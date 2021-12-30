<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->SessionModel->checkuserlogin(array("login","sign_up","loginbypassword","customer_signup","createCode"));
	}

   public function login()
   {
      	$this->load->view('form/header');
   		$this->load->view('home/login_valid');
   		$this->load->view('form/footer');
   }

   public function sign_up()
   {
   		$this->load->view('form/header');
   		$this->load->view('home/signup_valid');
   		$this->load->view('form/footer');
   }

	public function index(){
		$this->load->view('home/header');
		$this->load->view('home/home');
		$this->load->view('home/footer');
	}

    public function loginbypassword(){
		if(isset($_POST) && !empty($_POST)){
			if(isset($_POST['mobile_no']) && !empty($_POST['mobile_no']) && isset($_POST['password']) && !empty($_POST['password'])){
				$mobile_no = $_POST['mobile_no'];
				$password = md5($_POST['password']);
				$checkuser = $this->Common_model->GetWhere('users', array('mobile_no'=>$mobile_no,'password'=>$password));
				// print_r($checkuser);
				// die;
				if(isset($checkuser) && !empty($checkuser)){
					$checkuserrow = $checkuser[0];
					if($checkuserrow['status'] == 1){
						$this->session->set_userdata(USER_SESSION, $checkuserrow);
			
						$msg = array('status'=>1, 'msg'=>'Login Successfully ! Welcome ');
						echo json_encode($msg);
						exit();	
			
					}else{
						$msg = array('status'=>0, 'msg'=>'Your account has been deactivated ,please contact with admin');
						echo json_encode($msg);
						exit();	
					}
				}else{
					$msg = array('status'=>0, 'msg'=>'Invalid Mobile no. & Password  please try again.');
					echo json_encode($msg);
					exit();
				}

			}else{
				$msg = array('status'=>0, 'msg'=>'Mobile no. & Password has been required please try again.');
				echo json_encode($msg);
				exit();
			}
		}
	}

    public function customer_signup(){
        if(isset($_POST) && !empty($_POST)){
            $mobile_no = $_POST['mobile_no'];

            $checkmobile = $this->Common_model->GetWhere('users', array('mobile_no'=>$mobile_no));
			// print_r($checkmobile);
   			//          die;
            if(empty($checkmobile))
    		{
                if(isset($_POST['name']) && !empty($_POST['name']) && !empty($_POST['email']))
                {
                    $data = array();
        			$data['first_name'] = $_POST['name'];
        			$data['email'] = $_POST['email'];
                    $password = $_POST['password'];
                    $data['password'] = md5($password);
                    // $mobile_no = base64_encode($_POST['mobile_no']);
        			$data['mobile_no'] = $_POST['mobile_no'];

                    $data['reg_id'] = $this->createCode('users','reg_id',8);
                 
        			
                    // print_r($data);
                    // die;
        			$result = $this->Common_model->addRecords('users',$data);
        			$checkuser = $this->Common_model->GetWhere('users', array('mobile_no'=>$mobile_no));						
					if(isset($checkuser) && !empty($checkuser)){
						$checkuserrow = $checkuser[0];
						if($checkuserrow['status'] == 1){
							$this->session->set_userdata(USER_SESSION, $checkuserrow);
							$msg = array('status'=>1, 'msg'=>'Successfully Registered ! Welcome to eshop.');
							echo json_encode($msg);
							exit();	
				
						}else{
							$msg = array('status'=>0, 'msg'=>'Your account has been deactivated ,please contact with admin');
							echo json_encode($msg);
							exit();	
						}
					}else{
						$msg = array('status'=>0, 'msg'=>'Invalid Mobile no. & Password  please try again.');
						echo json_encode($msg);
						exit();
					}

				}else{
					$msg = array('status'=>0, 'msg'=>'Mobile no. & Password has been required please try again.');
					echo json_encode($msg);
					exit();
				}
			}else{
				$msg = array('status'=>0, 'msg'=>'Mobile no. already Registered.');
				echo json_encode($msg);
				exit();
			}
		}
	}	

    public function createCode($table,$column_name,$length)
	{
		$jc = "";
		$jay = generateRandomStringbylnth($length);
		$js = $this->Common_model->getSingleRecordById($table,array($column_name => $jay));
		if($js){
			$jc = $this->createCode($table,$column_name);
		}else{
			$jc = $jay;
		}
		return $jc;
    }

    public function logout(){
    	$this->session->unset_userdata(USER_SESSION);
    	// $this->session->unset_userdata('cart');
    	// $this->session->unset_userdata('couponcode');
		redirect(base_url('home'),'refresh');
    }

}    

?>
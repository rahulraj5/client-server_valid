<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		// $this->SessionModel->checkadminlogin(array("sign_up","login","loginajax"));
	}

	public function index()
	{
		// $data = array();
		// $whr = " WHERE status = 1 and delivery_status = 4";
		// $data['ordersByMonth'] = $this->Common_model->getOrdersByMonth($whr);
		// $data['ordersByMonth'] = array('years' => array_unique(array('2019')),'orders' => array('2019'=>array('1'=>9,'2'=>9,'3'=>9,'4'=>9,'5'=>9,'6'=>9,'7'=>9,'8'=>9,'9'=>9,'10'=>9,'11'=>9,'12'=>1)));
		$this->load->view('admin/header');
		$this->load->view('admin/dashboard');
        // $this->load->view('admin/dashboard',$data);
		$this->load->view('admin/footer');
	}

}    
?>
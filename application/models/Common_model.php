<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Common_model extends CI_Model {
	function getAllRecords($table){
		$query = $this->db->get($table);
		return $query->result_array();
	}

	function getSingleRecordById($table,$conditions){
		$query = $this->db->get_where($table,$conditions);
		return $query->row_array();
	}

	function geRandomString($length = 4){
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}

	function getAllRecordsById($table,$conditions){
		$query = $this->db->get_where($table,$conditions);
		return $query->result_array();
	}

	function getwhere($table,$conditions)
	{
		$query = $this->db->get_where($table,$conditions);
		return $query->result_array();
		//$this->db->last_query(); //die;
	}

	function getAllRecordsOrderById($table, $field, $short, $conditions){

		$this->db->order_by($field, $short);

		$query = $this->db->get_where($table,$conditions);

		return $query->result_array();
	}

	function addRecords($table,$post_data){
		$this->db->insert($table,$post_data); 
		return $this->db->insert_id();
	}

	function insertMultiple($table, $data){
		$this->db->insert_batch($table, $data); 
	}

	function updateRecords($table, $post_data, $where_condition){
		$this->db->where($where_condition);
		return $this->db->update($table, $post_data); 
	}

	public function updateData($tab,$data,$whr){

		$this->db->update($tab,$data,$whr);
		//echo $this->db->last_query(); die();
		return true;
	}

	function deleteRecords($table,$where_condition){
		$this->db->where($where_condition);
		return $this->db->delete($table);
	}
	
	

	function getSingleData($tab,$whr){
		$result = $this->db->get_where($tab,$whr)->row_array();
		return $result;
	}

	function getTotalRecords($table){
		$query = $this->db->get($table);
		return $query->num_rows();
	}
	
	function getTotalRecordsByCondition($table, $condition)
	{

	    $this->db->where($condition);

		$query = $this->db->get($table);

		return $query->num_rows();

	}

	function getAllRecordsByLimitId($table,$conditions,$limit)

	{

	    $this->db->limit($limit);

		$query = $this->db->get_where($table,$conditions);

		return $query->result_array();

	}

	function getLatestRecords($table,$date,$limit)

	{
	    $this->db->order_by($date,'desc');

	    $this->db->limit($limit);

		$query = $this->db->get($table);

		return $query->result_array();

	}

	function getLimitedRecords($table,$limit)

	{

	    $this->db->limit($limit);

		$query = $this->db->get($table);

		return $query->result_array();

	}

	function getRecordCount($table, $where_condition) 

	{

	    $this->db->where($where_condition);

		$query = $this->db->get($table);

		$rd = $query->num_rows();

		// echo $this->db->last_query(); die();

		return $rd;

	}

	function getSingleRecord($table,$conditions)

	{

		// $this->db->order_by('id','desc');

	   	$query = $this->db->get_where($table,$conditions);

	   	return $query->row_array();

	}

	function getAllRecordsByIdDes($table)

	{

		$this->db->order_by('id','desc');

	   	$query = $this->db->get($table);

	   	return $query->result_array();

	}

    function getWhereDataByCol($tab,$whr,$col){

		$this->db->select($col);

		$result = $this->db->get_where($tab,$whr)->row_array();

		//echo $this->db->last_query(); die();

		return $result[$col];

	}

	public function getWhereData($tab,$whr)

	{

		$result = $this->db->get_where($tab,$whr)->result_array();

		//echo $this->db->last_query(); die();

		return $result;

	}

}




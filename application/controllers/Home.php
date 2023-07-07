<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Users_Model');
	}

	public function index()
	{
		$this->load->view('view');
	}

	public function get_user_data()
	{
		$email = $_POST['user_email'];
		$user_role_table = $_POST['user_role'];
		$userId = getUserIdHelper($email);
		if (isset($userId)) {
			$userId = $userId['user_id'];
			$userData = getDataHelper($userId, $user_role_table);
			if($userData) {
				echo json_encode($userData);
			} else {
				echo json_encode('Data Does Not Found');
			}
		} else {
			echo json_encode('Data Does Not Found');
		}
	}
}

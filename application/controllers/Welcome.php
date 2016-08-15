<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
	    $data = [
           'mensaje' =>  $this->session->flashdata('correcto')
        ] ;
		$this->load->view('login',$data);
	}
}

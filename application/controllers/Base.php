<?php
/**
 *  Clase base para gestionar los datos de sesión de los usuarios
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Base extends CI_Controller {


    public function __construct(){
        parent::__construct();
        if(!$this->session->userdata('logged_in')){
            $this->session->set_flashdata('correcto' , 'Por favor inice sesión');
            redirect('/welcome');
        }
    }

    /**
     * Permite a
     * @param $data
     */
    public function addValue($data){
        $usuario = $this->session->userdata();
        return array_merge($data, $usuario);
    }

    /**
     * Genera el template de la acción
     *
     * @param $data
     * @param $template
     */
    public function renderTemplate($template,$data){
        $this->load->view('base/header',$data);
        $this->load->view($template);
        $this->load->view('base/footer');
    }




}

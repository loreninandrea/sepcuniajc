<?php
/**
 *  Gestiona las actividades de los usuarios en la aplicación
 *
 *  Gestiona la actividados de los usuarios en el sistema, adicionalmente permite el inicio y finalización de la sesiones
 * bvr 943
 */
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuario extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('usuario_model');
        $this->load->model('perfil_model');
    }

    /**
     * Se encarga de validar y autorizar los usuarios en el sistema
     */
	public function login()
	{

		$email = $_POST['email'];
        $password = $_POST['password'];
        if (!filter_var($email, FILTER_VALIDATE_EMAIL) === false) {
            $usuario = $this->usuario_model->valideUsuario($email,$password);
            if(is_array($usuario)) {

                $perfiles = $this->perfil_model->getPerfiles($usuario['id']);

                $registro = [
                    'usuario_id' => $usuario['id'],
                    'usuario' => $usuario['nombre'],
                    'email' => $usuario['email'],
                    'created' => $usuario['created'],
                    'logged_in' => true,
                    'perfiles' => $perfiles
                ];

                $this->session->set_userdata($registro);
                redirect('/dashboard');

            }else{
                $this->session->set_flashdata('correcto' , 'El usuario no existe o esta incorrecto.');
            }

        }else{
            $this->session->set_flashdata('correcto','La dirección de correo electrónico es inválida.');
        }
        redirect('/welcome');
	}
    /**
     * Finaliza las sesiones de los usuarios
     */
	public function logout(){
        $this->session->sess_destroy();
        redirect('/welcome');
    }


}

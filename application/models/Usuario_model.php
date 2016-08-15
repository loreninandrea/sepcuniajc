<?php

/**
 * Gestiona la información de los usuarios
 *
 * Class Usuario_model
 */
class Usuario_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Metodo que retorna el id usuario que inicia sesión
     *
     * @param $email
     * @param $password
     */
    public function valideUsuario($email,$password){
        $sql = "SELECT id,email,nombre,created  FROM usuarios 
                WHERE email = '".$email."'
                AND password = '".$password."'";
        $result = $this->db->query($sql);
        $row =  $result->result_array();
        return (is_array($row))? $row[0]: false;
    }

}
<?php

/**
 * Gestiona la información de los perfiles
 *
 * Class Perfil_model
 */
class Perfil_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }
    /**
     * Retorna todos los perfiles de un usuario
     * @param $usuario_id
     */
    public function getPerfiles($usuario_id){
        $sql = "SELECT perfil_id  
                FROM  perfiles_usuarios
                WHERE usuario_id = ".(int)$usuario_id;
        $query = $this->db->query($sql);
        $rows =  $query->result_array();
        $perfiles = [];
        foreach ($rows as $row)
            $perfiles[] = $row['perfil_id'];
        return $perfiles;
    }

}
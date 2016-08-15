<?php

/**
 * Gestiona los temas
 *
 */
class Temas_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Metodo que retorna de una materia
     *
     * @param $materia_id
     * @return mixed
     */
    public function getTemas($materia_id){
        $sql = "SELECT id,titulo
                FROM materias_plan_temas
                ORDER BY titulo ASC";
        return $this->db->query($sql);
        $result = $this->db->query($sql);
        return $result->result_array();
    }

}
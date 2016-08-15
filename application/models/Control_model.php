<?php

/**
 * Gestiona los controles y autorizaciones de las materias
 *
 */
class Control_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Metodo que realizar la confirmación del curso
     * @param $plan_id
     * @param $usuario_id
     */
    public function confirmar($plan_id,$usuario_id){
        $sql = "UPDATE  materias_ejecucion SET representante_id = ".(int)$usuario_id.", confirmado = 's',update=now()
                WHERE id = ".(int)$plan_id."  AND confirmado != 's' ";
        return $this->db->query($sql);
    }



}
<?php

/**
 * Gestiona la información de los cursos
 *
 * Class Usuario_model
 */
class Comentario_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Metodo que retorna los comentarios
     * @param $control_id
     *
     * @return mixed
     */
    public function getComentarios($control_id){
        $sql = "SELECT c.descripcion,
                       c.created,
                       CASE
                          WHEN c.autor = 1 THEN 'Docente'
                          ELSE
                             'Estudiante'
                       END AS autor,
                       tipo,
                       u.nombre
                FROM comentarios c
                INNER JOIN usuarios u on (u.id = c.usuario_id)
                WHERE c.materia_ejecucion_id = ".$control_id."
                ORDER BY created ASC";

        $result = $this->db->query($sql);
        return $result->result_array();
    }

    /**
     * Registra un nuevo comentario
     *
     * @param int $usurio_id
     * @param strint $descripcion
     * @param int $plan_id
     * @param int $tipo
     * @param int $autor
     */
    public function addComentario($usurio_id,$descripcion,$plan_id,$tipo=1,$autor=2){
        $data = ['usuario_id' => (int)$usurio_id,
                 'descripcion' => addslashes($descripcion),
                 'autor' => (int)$autor,
                 'tipo' => (int)$tipo,
                 'materia_ejecucion_id' => (int)$plan_id
                 ];

        $sql = "INSERT INTO comentarios (".implode(', ', array_keys($data)).") VALUES ('".implode("','", array_values($data))."')";
        $this->db->query($sql);
    }

    /**
     * Retorna los ultimos comentarios
     *
     * @param $user_id
     * @param int $limit
     * @return mixed
     */
    public function getLastComentarios($user_id,$limit=13){
        $sql = "SELECT c.descripcion,
                       c.created,
                       CASE
                          WHEN c.autor = 1 THEN 'Docente'
                          ELSE
                             'Estudiante'
                       END AS autor,
                       c.tipo,
                       u.nombre,
                       m.nombre as materia,
                       T1.titulo

                FROM comentarios c
                INNER JOIN materias_ejecucion  me on (me.id = c.materia_ejecucion_id)
                INNER JOIN materias_plan  mp on (mp.id = me.materia_plan_id)
                INNER JOIN materias_plan_temas T1 ON (T1.id = mp.tema_id)
                INNER JOIN cursos_usuarios  cu on (mp.curso_id = cu.curso_id)
                INNER JOIN cursos_materias  cm on (cm.curso_id = cu.curso_id)
                INNER JOIN materias  m on (m.id = cm.curso_id)
                INNER JOIN usuarios u on (u.id = c.usuario_id)
                WHERE cu.usuario_id = ".$user_id."
                GROUP BY T1.id,T1.titulo,u.nombre,m.nombre,m.id,c.descripcion,c.created,C.autor,c.tipo
                ORDER BY c.created DESC

                 LIMIT  $limit

                 " ;

        $result = $this->db->query($sql);
        return $result->result_array();
    }

    /**
     * Metodo que retorna los comentarios sobre un tema
     *
     * @param $control_id
     * @return mixed
     */
    public function getComentarioTema($plan_id){
        $sql = "SELECT c.descripcion,
                       to_char(c.created, 'YYYY/MM/DD hh:mm:ss') as fecha,
                       CASE
                          WHEN c.autor = 1 THEN 'Docente'
                          ELSE
                             'Estudiante'
                       END AS autor,
                       tipo,
                       u.nombre,
                       me.confirmado
                FROM comentarios c
                INNER JOIN usuarios u on (u.id = c.usuario_id)
                INNER JOIN materias_ejecucion me on (me.id = c.materia_ejecucion_id)
                WHERE me.id = ".$plan_id."
                ORDER BY c.created ASC";
        $result = $this->db->query($sql);
        return $result->result_array();
    }
}

<?php

/**
 * Gestiona la información de los cursos
 *
 * Class Usuario_model
 */
class Curso_model extends CI_Model {

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
    public function getCursos($usuario_id,$curso_id,$materia_id,$limite=20){
        $sql = "SELECT C.nombre as curso,
                       M.nombre as materia,
                       UD.nombre as docente,
                       E.created,
                       E.confirmado,
                       E.id,
                       P.fecha,
                       P.semana,
                       P.horas,
                       T1.titulo,
                       E.created+'1 hours'::interval as fecha_limite,
                       to_char(E.created+'24 hours'::interval, 'YYYY/MM/DD hh:mm:ss') as fecha_limite_formateada,
                       CASE WHEN E.confirmado = 's' THEN
                              100000
                             else
                               10
                        END  AS orden
                FROM   cursos C
                INNER JOIN cursos_usuarios CU ON (CU.curso_id = C.id)
                INNER JOIN cursos_materias CM ON (CM.curso_id = C.id)
                INNER JOIN materias M ON (CM.materia_id = M.id)
                INNER JOIN usuarios U ON (CU.usuario_id = U.id)
                INNER JOIN materias_docente D ON (M.id = D.materia_id)
                INNER JOIN usuarios UD ON (UD.id = D.docente_id)
                INNER JOIN materias_plan P ON (P.materia_id = M.id and P.curso_id = C.id)
                INNER JOIN materias_ejecucion E ON (E.materia_plan_id = P.id)
                INNER JOIN materias_plan_temas T1 ON (T1.id = E.tema_id)
                INNER JOIN perfiles_usuarios PU ON (PU.usuario_id = U.id and PU.perfil_id = 3)
                WHERE confirmado != 'S'";

        if($curso_id > 0){
            $sql .=" AND C.id = ".(int)$curso_id;
        }

        if($materia_id > 0){
            $sql .=" AND M.id = ".(int)$materia_id;
        }


        $sql .="  -- AND date_part('hours',now() - P.created) < 24
               -- AND CU.usuario_id = ".$usuario_id."
                GROUP BY  E.id,C.nombre,M.nombre,UD.nombre, T1.id,T1.titulo, P.fecha,P.semana,P.horas,E.created,P.created,E.confirmado
                ORDER BY orden,E.created+'24 hours'::interval asc
                LIMIT  ".$limite;
        $result = $this->db->query($sql);
        return $result->result_array();
    }
    /**
     * Obtener la lista de mis cursos
     *
     * @param $usuario_id
     * @return mixed
     */
    public function getMiCursos($usuario_id){
        $sql = "SELECT C.nombre as cursos,
                       M.nombre as materia,
                       C.id
                FROM   cursos C
                INNER JOIN cursos_usuarios CU ON (CU.curso_id = C.id)
                INNER JOIN cursos_materias CM ON (CM.curso_id = C.id)
                INNER JOIN materias M ON (CM.materia_id = M.id)
                WHERE CU.usuario_id = ".$usuario_id."
                ORDER BY C.nombre ASC";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    /**
     * Metodo que retorna los curso del estudiante
     * @param $usuario_id
     * @return mixed
     */
    public function getCursosEstudiante($usuario_id){
        $sql = "SELECT C.nombre as nombre,
                       C.id
                FROM   cursos C
                INNER JOIN cursos_usuarios CU ON (CU.curso_id = C.id)
                WHERE CU.usuario_id = ".$usuario_id."
                ORDER BY C.nombre ASC";
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    /**
     * Metodo que retorna el plan de trabajo
     *
     * @param $usuario_id
     * @param int $limite
     * @return mixed
     */
    public function getPlanTrabajo($materia_id,$limite=50){
        $sql = "
                 SELECT to_char(mp.fecha,'MM') as mes,
                        to_char(mp.fecha,'hh') as dia,
                        mp.horas,
                        mt.titulo as tema,
                        mp.tema_id,
                        mp.semana,
                        me.confirmado,
                        mt2.titulo as temaDictado,
                        to_char(me.created+'24 hours'::interval, 'YYYY/MM/DD hh:mm:ss') as fecha_limite_formateada,
                        mp.id as plan_id,
                        me.id as plan_ejecucion,
                        me.tema_id  as tema_dictado_id,
                        CASE WHEN me.confirmado = 's' THEN
                              100000
                             else
                               mp.semana
                        END  AS orden ,
                        CASE WHEN me.confirmado = 's' and me.representante_id  is null THEN
                           'Sistema'
                            ELSE
                            u.nombre
                        END as representante

                 FROM materias_plan mp
                 INNER JOIN  materias_plan_temas mt on (mt.id = mp.tema_id)
                 LEFT JOIN materias_ejecucion me on (me.materia_plan_id = mp.id)
                 LEFT JOIN  materias_plan_temas mt2 on (mt2.id = me.tema_id)
                 LEFT JOIN  usuarios  u on (u.id = me.representante_id)
                 WHERE mp.materia_id = %s
                 ORDER BY orden ASC
                 LIMIT 100
               ";
        $result = $this->db->query(sprintf($sql,(int)$materia_id));
        return $result->result_array();
    }

    /**
     * Metodo que retorna las materias de un docente
     *
     * @param $usuario_id
     * @return mixed
     */
    public function getMateriasDocente($usuario_id=0,$curso_id=0){
        $sql = 'SELECT m.id,
                       m.nombre
                FROM materias m
                INNER JOIN materias_docente md on (md.materia_id = m.id)
                INNER JOIN cursos_materias c on (c.materia_id = m.id)
                WHERE md.docente_id = '.(int)$usuario_id;

        if($curso_id > 0){
            $sql .= ' AND c.curso_id = '.(int)$curso_id;
        }

        $sql .='
                ORDER BY m.nombre';
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    /**
     * Metodo que retorna las materias de un curso para el estudiante
     *
     * @param int $usuario_id
     * @param int $curso_id
     * @return mixed
     */
    public function getMateriasEstudiante($usuario_id=0,$curso_id=0){
        $sql = 'SELECT m.id,
                       m.nombre
                FROM materias m
                INNER JOIN cursos_materias c on (c.materia_id = m.id)
                INNER JOIN cursos_usuarios cu on (cu.curso_id = c.curso_id)
                WHERE cu.usuario_id = '.(int)$usuario_id;

        if($curso_id > 0){
            $sql .= ' AND c.curso_id = '.(int)$curso_id;
        }

        $sql .='
                ORDER BY m.nombre';
        $result = $this->db->query($sql);
        return $result->result_array();
    }


    /**
     * Retorna los temas de una materia
     *
     * @param $materia_id
     * @return mixed
     */
    public function getTemas($materia_id){
        $sql = 'SELECT m.id,
                       m.titulo
                FROM materias_plan_temas m
                WHERE materia_id = '.(int)$materia_id.'
                ORDER BY m.titulo ASC';
        $result = $this->db->query($sql);
        return $result->result_array();
    }

    /**
     * Metodo que valida la existencia del metodo de evaluación
     *
     * @param $plan_id
     * @return bool
     */
    public function ejecucionExiste($plan_id){
        $sql = 'SELECT id
                FROM materias_ejecucion
                WHERE materia_plan_id = '.(int)$plan_id;
        $result = $this->db->query($sql);
        $row = $result->first_row();
        return ($row)? $row->id : false;
    }

    /**
     * Metodo que valida que no este confirmado la ejecucion del curso
     *
     * @param $plan_id
     * @return bool
     */
    public function ejecucionEstado($plan_id){
        $sql = "SELECT id
                FROM materias_ejecucion
                WHERE materia_plan_id = ".(int)$plan_id."
                AND confirmado in('u','n')";
        $result = $this->db->query($sql);
        $row = $result->first_row();
        return ($row)? true : false;
    }

    /**
     * Obtiene el tema de un plan de ejecución
     *
     * @param $plan_id
     * @return mixed
     */
    public function getTema($plan_id){
        $sql = "SELECT tema_id
                FROM materias_plan
                WHERE id = ".(int)$plan_id."
                ";
        $result = $this->db->query($sql);
        $row = $result->first_row();
        return $row->tema_id;
    }
    /**
     * Metodo que retorna el numero de horas sugeridas
     *
     * @param $plan_id
     * @return mixed
     */
    public function getHoraSugeridas($plan_id){
        $sql = "SELECT horas
                FROM materias_plan
                WHERE id = ".(int)$plan_id."
                ";
        $result = $this->db->query($sql);
        $row = $result->first_row();
        return $row->horas;
    }

    /**
     * Confirma los programas pasado un año
     */
    public function autoConfirmar(){
        $sql = "UPDATE materias_ejecucion set confirmado = 's' where created+'24 hours' <= now()";
        $this->db->query($sql);
    }

    /**
     * Retorna las cursos de un docente
     *
     * @param int $docente_id
     * @return mixed
     */
    public function getCursosDocente($docente_id = 0){
        $sql = 'SELECT c.id,
                       c.nombre
                FROM cursos c
                INNER JOIN  cursos_materias cm  on(cm.curso_id = c.id)
                INNER JOIN  materias_docente d on (cm.materia_id = d.materia_id)
                WHERE d.docente_id = '.(int)$docente_id.'
                GROUP BY c.id,c.nombre
                ORDER BY c.nombre ASC';
        $result = $this->db->query($sql);
        return $result->result_array();
    }


}

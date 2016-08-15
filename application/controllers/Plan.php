<?php
defined('BASEPATH') OR exit('No direct script access allowed');

include 'Base.php';

class Plan extends Base {
    /**
     * Control constructor.
     */
    public function __construct(){
        parent::__construct();
        $this->load->model('control_model');
        $this->load->model('comentario_model');
        $this->load->model('curso_model');
        $this->curso_model->autoConfirmar();
    }

    /**
     * Permite confirmar el plan de trabajo de un docente por parte del estudiante
     */
	public function confirmar(){

        if(in_array(3,$this->session->userdata('perfiles'))){
            $estado = 1;
            $planEjecucion = $_POST['planEjecucion'];
            $comentario = $_POST['comentario'];
            if($this->control_model->confirmar($planEjecucion,$this->session->userdata('usuario_id'))){
                if(!empty($comentario)){
                    $this->comentario_model->addComentario($this->session->userdata('usuario_id'),$comentario,$planEjecucion);
                }
                $mensaje = 'El trabajo del docente de manera exitosa';
            }else{
                $estado = 0;
                $mensaje = 'Error al tratar de confirmar el plan de trabajo';
            }
        }else{
            $estado = 0;
            $mensaje = 'El usuaro no cuenta con los permiso para realizar esta accción';
        }

        $resultado = [
            'estado' => $estado,
            'mensaje' => $mensaje
        ];

        echo json_encode($resultado);
        exit;
	}

    /**
     * obtiene la lista de cursso del estudiate
     */
	public function misCurso(){



        $parametros = [
            'title' => 'Mis Cursos',
            'cursos' => $this->curso_model->getMiCursos($this->session->userdata('usuario_id'))
        ];

        $this->renderTemplate('misCursos',$this->addValue($parametros));
    }


    /**
     * presenta la plantilla de trabajo del docente
     */
    public function ejecucion()
    {
        if (in_array(2, $this->session->userdata('perfiles'))) {
            $this->load->model('curso_model');
            $data = $this->input->post();

            $parametros = [
                'title' => 'Ejecución',
                'materiaDocente' =>  $this->curso_model->getMateriasDocente($this->session->userdata('usuario_id'),$data['curso']),
                'cursos' => $this->curso_model->getCursosDocente($this->session->userdata('usuario_id')),
                'titulo' => '',
                'data' => $data,
                'planes' => $this->curso_model->getPlanTrabajo($data['materia']),
                'temas' => $this->curso_model->getTemas($data['materia'])
            ];
            $this->renderTemplate('plan',$this->addValue($parametros));

        }else{
            redirect('dashboard');
        }
    }
    /**
     * Permite realizar cambios sobre el plan de trabajo que ejecuta el docente
     *
     * @param string $elemento
     */
    public function cambiarTema($elemento=''){

        if (in_array(2, $this->session->userdata('perfiles'))) {
            $data = $this->input->post();
            $ejecucionId = $this->curso_model->ejecucionExiste($data['pk']);
            if ($ejecucionId == false) {
                $datos = [
                    'materia_plan_id' => (int)$data['pk'],
                    'docente_id' => $this->session->userdata('usuario_id'),
                    'confirmado' => 'u',
                    'horas' => 0,
                    'tema_id' => $this->curso_model->getTema($data['pk'])
                ];
                $this->db->insert('materias_ejecucion', $datos);
            }
            if ($this->curso_model->ejecucionEstado($data['pk'])) {
                $datos = [];
                switch ($elemento) {
                    case 'hora':
                        $datos = ['horas' => (int)$data['value']];
                        break;

                    case 'tema':
                        $datos = ['tema_id' => (int)$data['value']];
                        break;
                }
                $this->db->update('materias_ejecucion', $datos, array('materia_plan_id' => (int)$data['pk']));
            }
        }
        exit;
    }

    /**
     * Inicia el proceso de capacitación
     */
    public function iniciar(){
        $error = 0;
        if (in_array(2, $this->session->userdata('perfiles'))) {
            $data = $this->input->post();
            $ejecucionId = $this->curso_model->ejecucionExiste($data['plan_id']);
            if ($ejecucionId == false) {
                $datos = [
                    'materia_plan_id' => (int)$data['plan_id'],
                    'docente_id' => $this->session->userdata('usuario_id'),
                    'confirmado' => 'n',
                    'horas' => $this->curso_model->getHoraSugeridas($data['plan_id']),
                    'tema_id' => $this->curso_model->getTema($data['plan_id'])
                ];
                $this->db->insert('materias_ejecucion', $datos);
            }else{
                $datos = [
                   'created' => "now()",
                   'updated' => "now()"
                ];
                $this->db->update('materias_ejecucion', $datos, array('materia_plan_id' => (int)$data['plan_id']));
            }

            $mensaje = 'El proceso ha iniciado, a partir de este momento tiene 24 horas para aplicar cambios al informe';
        }else{
            $error = 1;
            $mensaje = 'No tiene permisos para ejecutar esta acción';
        }
        $resultado = [
            'estado' => $error,
            'mensaje' => $mensaje
        ];

        echo json_encode($resultado);
        exit;
    }
    /**
     * Metodo que retorna los comentarios de un plan de trabajo
     */
    public  function getComentarios(){
        $comentarios = [];
        if (in_array(2, $this->session->userdata('perfiles')) || in_array(3, $this->session->userdata('perfiles'))) {
            $data = $this->input->post();
            $comentarios = $this->comentario_model->getComentarioTema($data['plan_id']);
        }
        echo json_encode([
            'plan_id' => $data['plan_id'],
            'comentarios' => $comentarios,
            'vacio' => (empty($comentarios))? 1 : 0,
            'actualizar' => $this->curso_model->ejecucionEstado($data['plan_id'])
        ]);
        exit;
    }

    /**
     * Metodo que permite agregar nuevos comentarios
     */
    public function addComentario(){

        $data = $this->input->post();
        $error = 1;
        $mensaje = 'No tiene permisos para esta acción';
        if (in_array(2, $this->session->userdata('perfiles')) || in_array(3, $this->session->userdata('perfiles'))) {
            $ejecucion_id = $this->curso_model->ejecucionExiste($data['plan_id']);
            if($ejecucion_id == false){
                $mensaje = 'Para poder comentar es necesario que primero, realice una modifición en el registro, por ejemplo tema, hora o inicarlo';
            }else{
                if($this->curso_model->ejecucionEstado($data['plan_id'])){
                    if(!empty($data['comentario'])){
                        try{
                            $this->comentario_model->addComentario($this->session->userdata('usuario_id'),$data['comentario'],$ejecucion_id);
                            $mensaje = 'Se ha añadido un nuevo comentario';
                            $error = 0;
                        }catch (Exception $e){
                            $mensaje = $e->getMessage();
                            $error = 1;
                        }

                    }else{
                        $mensaje = 'El comentario esta vacio';
                    }
                }else{
                    $mensaje = 'El tema fue confirmado, no puede adicionar mas comentarios';
                }
            }
        }
        echo json_encode([
            'error' => $error,
            'comentarios' => $mensaje
        ]);
        exit;
    }
    /**
     * Metodo que retorna el json de las materias  relacionadas a un usuario
     */
    public function obtenerMaterias(){
        $data = $this->input->post();
        if (in_array(2, $this->session->userdata('perfiles'))){
            $cursos = $this->curso_model->getMateriasDocente($this->session->userdata('usuario_id'),$data['curso_id']);
        }else if(in_array(3, $this->session->userdata('perfiles'))){
            $cursos = $this->curso_model->getMateriasEstudiante($this->session->userdata('usuario_id'),$data['curso_id']);
        }
        echo json_encode(['cursos' =>  $cursos]);
        exit;
    }


}

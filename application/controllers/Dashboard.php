<?php
defined('BASEPATH') OR exit('No direct script access allowed');

include 'Base.php';

class Dashboard extends Base {
    /**
     * Dashboard constructor.
     */
    public function __construct(){
        parent::__construct();
        $this->load->model('curso_model');
        $this->load->model('comentario_model');
        $this->curso_model->autoConfirmar();
    }
    /**
     * Genera el dashboard de la pagona
     */
	public function index(){

        $data = $this->input->post();

        if(empty($data)){
            $data = [
                'curso' => 0,
                'materia' => 0
            ];
        }

	    $reportes = $this->curso_model->getCursos($this->session->userdata('usuario_id'),$data['curso'],$data['materia']);
        foreach ($reportes as $i=>$reporte){
            $reportes[$i]['comentarios'] = $this->comentario_model->getComentarios($reporte['id']);
        }
	    $parametros = [
            'title' => 'Dashboard',
            'data'  => $data,
            'cursosPendientesEstudiante' => $reportes,
            'comentarios' => $this->comentario_model->getLastComentarios($this->session->userdata('usuario_id'))
        ];

        if(!empty($data)){
            $parametros['materias'] = $this->curso_model->getMateriasEstudiante($this->session->userdata('usuario_id'),$data['curso']);
        }else{
            $parametros['materias'] = [];
        }


        if(in_array(3,$this->session->userdata('perfiles'))){
            $parametros['cursos'] =  $this->curso_model->getCursosEstudiante($this->session->userdata('usuario_id'));
        }

       if(in_array(2,$this->session->userdata('perfiles'))){
           $parametros['cursos'] =  $this->curso_model->getCursosDocente($this->session->userdata('usuario_id'));
       }



	    $this->renderTemplate('dashboard',$this->addValue($parametros));
	}
}

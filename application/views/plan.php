<div class="row">
    <div class="col-lg-12 col-xs-12 col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Selección<small> Ejecución del programa</small></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php echo form_open('plan/ejecucion', ['class'=> "form"]); ?>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-xs-12 col-sm-4">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Curso</label>
                            <select name="curso"
                                    id="curso"
                                    class="_materias form-control"
                                    required="required"
                                    data-url="<?php echo site_url('plan/obtenerMaterias') ?>"
                                    data-children="materia"
                            >
                                <option value="">Seleccione</option>
                                <?php foreach ($cursos as $curso): ?>
                                    <option value="<?php echo $curso['id'] ?>" <?php if($curso['id'] == $data['curso']):?> selected <?php endif; ?>><?php echo $curso['nombre'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-xs-12 col-sm-4">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Materias</label>
                            <select name="materia" id="materia" class="_materia form-control" required="required">
                                <option value="">Seleccione</option>
                                <?php foreach ($materiaDocente as $materia): ?>
                                    <option value="<?php echo $materia['id'] ?>" <?php if($materia['id'] == $data['materia']):?> selected <?php endif; ?>><?php echo $materia['nombre'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 col-xs-12 col-sm-2 text-left">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary" style="margin-top: 25px">Buscar</button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
            <!-- /.box-body -->
        </div>

    </div>
</div>



        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title"><?php echo $titulo ?></small></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table  table-hover">
                        <thead>
                        <tr>
                            <th class="text-center">Mes</th>
                            <th class="text-center">Día</th>
                            <th class="text-center">Horas</th>
                            <th class="text-center">Semana</th>
                            <th>Tema Del Programa</th>
                            <th>Limite</th>
                            <th>Representate</th>
                            <th class="text-center">Observaciones</th>
                            <th class="text-center">Iniciar</th>
                        </tr>
                        </thead>
                        <tbody>
                          <?php if(!empty($temas)){
                              $t = [];
                              foreach ($temas as $tema){
                                 $t[] = ['value' => $tema['id'], 'text' => trim(preg_replace('/\s\s+/', ' ', $tema['titulo'])) ];
                              }
                              $temas = json_encode($t);
                          } ?>



                         <?php foreach ($planes as $plan): ?>
                             <tr data-plan="<?php echo $plan['plan_id'] ?>" data-ejecucion="<?php echo $plan['plan_ejecucion'] ?>">
                                 <td  class="text-center"><?php echo $plan['mes'] ?></td>
                                 <td  class="text-center"><?php echo $plan['dia'] ?></td>
                                 <td  class="text-center">
                                     <?php if($plan['confirmado'] != 's'): ?>
                                       <a href="javascript:void(0)" id="hora-<?php echo $plan['plan_id'] ?>"
                                          data-type="number"
                                          class="_hora"
                                          data-pk="<?php echo $plan['plan_id'] ?>"
                                          data-url="<?php echo  site_url('plan/cambiarTema/hora') ?>"
                                       >
                                           <?php echo $plan['horas'] ?></a>
                                     <?php else: ?>
                                         <?php echo $plan['horas'] ?>
                                     <?php endif; ?>
                                 </td>
                                 <td  class="text-center"><?php echo $plan['semana'] ?></td>
                                 <td>
                                     <?php if($plan['confirmado'] == 's'): ?>
                                       <?php echo $plan['tema'] ?>
                                     <?php else: ?>
                                         <a href="#" id="status-<?php echo $plan['plan_id'] ?>"
                                            data-type="select"
                                            data-pk="<?php echo $plan['plan_id'] ?>"
                                            data-plan=""
                                            class="_tema-<?php echo $plan['plan_id'] ?>"
                                            data-url="<?php echo  site_url('plan/cambiarTema/tema') ?>"
                                            data-title="Seleccionar tema"></a>
                                         <script>
                                             $(function(){
                                                 $('#status-<?php echo $plan['plan_id'] ?>').editable({
                                                     value: <?php echo (is_numeric($plan['tema_dictado_id']))? $plan['tema_dictado_id'] : $plan['tema_id'] ?>,
                                                     source: <?php echo $temas ?>,
                                                 });
                                             });
                                         </script>
                                     <?php endif; ?>
                                 </td>
                                 <td>
                                     <?php if($plan['confirmado'] != 's'): ?>
                                     <p
                                         data-toggle="tooltip"
                                         title="Tiempo limite para realizar cambios en el informe"
                                         class="contador contador-<?php echo  $plan['plan_id']?>"></p>
                                     <script type="text/javascript">
                                         $(document).ready(function (){
                                             $(".contador-<?php echo  $plan['plan_id']?>")
                                                 .countdown("<?php echo $plan['fecha_limite_formateada']?>", function(event) {
                                                     $(this).text(
                                                         event.strftime('%H:%M:%S')
                                                     );
                                                 });
                                         });
                                      </script>
                                     <?php else: ?>
                                        Cerrado
                                     <?php endif; ?>

                                 </td>
                                 <td class=" <?php if(empty($plan['representante'])):?> text-warning<?php endif; ?>">
                                 <?php echo (empty($plan['representante']))? 'Sin confirmar': $plan['representante'] ?></td>
                                 <td class="text-center">
                                     <a href="javascript:void(0)"
                                        class="_comentario"
                                        title="Obtener los comentarios"
                                        data-toggle="tooltip"
                                        data-url="<?php echo  site_url('plan/getComentarios') ?>"
                                        data-id="<?php echo $plan['plan_id'] ?>" >
                                         <i class="fa  fa-comments popover-1"></i>
                                     </a>
                                 </td>
                                 <td class="text-center">
                                     <?php if(is_null($plan['confirmado'])): ?>
                                         <a href="javascript:void(0)"
                                            class="_iniciar"
                                            data-toggle="tooltip"
                                            data-url="<?php echo  site_url('plan/iniciar') ?>"
                                            data-id="<?php echo $plan['plan_id'] ?>"
                                            data-placement="top"
                                            title="Iniciar el curso">
                                             <i  class="glyphicon glyphicon-floppy-saved"></i>
                                         </a>
                                     <?php endif ; ?>
                                 </td>
                             </tr>
                         <?php endforeach; ?>
                        </tbody>
                    </table>

                    <script>
                        $(function(){
                            $('._hora').editable({
                                url: '<?php echo  site_url('plan/cambiarTema/hora') ?>',
                                title: 'Ingrese las horas'
                            });
                        });
                    </script>


                </div>
            </div>
            <!-- /.box-body -->
        </div>


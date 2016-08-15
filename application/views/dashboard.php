<div class="row">
    <div class="col-lg-12 col-xs-12 col-md-12">
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Selección<small> Ejecución del programa</small></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

               <?php $accion =  (in_array(2,$perfiles))? 'plan/ejecucion': 'dashboard/index'; ?>
                <?php echo form_open($accion, ['class'=> "form"]); ?>
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
                                    <option value="<?php echo $curso['id'] ?>" <?php if(isset($data['curso']) && $data['curso'] ==  $curso['id']): ?> selected <?php endif; ?>><?php echo $curso['nombre'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-xs-12 col-sm-4">
                        <div class="form-group">
                            <label for="exampleInputPassword1">Materias</label>
                            <select name="materia" id="materia" class="_materia form-control" required="required">
                                <option value="">Seleccione</option>
                                <?php foreach ($materias as $materia): ?>
                                    <option value="<?php echo $materia['id'] ?>" <?php if(isset($data['materia']) && $data['materia'] ==  $materia['id']): ?> selected <?php endif; ?>><?php echo $materia['nombre'] ?></option>
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


<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <!-- Columna izquierda -->

        <!-- Cursos pendientes por confirmar -->
        <?php if(in_array(3,$perfiles)): ?>

        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Temas Pendientes Por Confirmar</h3>
            </div><!-- /.box-header -->
            <div class="box-body">
                <?php if(!empty($cursosPendientesEstudiante)): ?>
                <table class="table table-pendientes table-striped">
                    <thead>
                        <tr>
                            <th>Curso/Materia</th>
                            <th>Docente</th>
                            <th>Limite</th>
                            <th>Comen.</th>
                            <th>Confir.</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($cursosPendientesEstudiante as $row):?>
                    <tr>
                        <td>
                            <?php echo  $row['curso']?>
                            <p class="text-muted"><?php echo  $row['materia'].' - '.$row['titulo']?></p>
                        </td>
                        <td>
                            <?php echo  $row['docente']?>
                        </td>
                        <td class="text-center">
                            <?php if ($row['confirmado'] == 'n'): ?>
                            <p class="contador contador-<?php echo  $row['id']?>"></p>
                            <script type="text/javascript">
                                $(document).ready(function (){
                                    $(".contador-<?php echo  $row['id']?>")
                                        .countdown("<?php echo $row['fecha_limite_formateada']?>", function(event) {
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
                        <td class="text-center">
                            <a href="javascript:void(0)">
                              <?php if(!empty($row['comentarios'])): ?>
                              <i data-container="body"
                                 data-toggle="popover"
                                 data-placement="top"
                                 data-content="
                                 <?php foreach ($row['comentarios'] as $comentario): ?>
                                   <div class='comentario'>
                                       <?php echo $comentario['descripcion']; ?><br>
                                       <i><?php echo$comentario['autor'].':'.$comentario['nombre']; ?></i><br>
                                       <i><?php echo nice_date($comentario['created'],'d/m/Y'); ?></i>
                                   </div>
                                 <?php endforeach; ?>
                                 "
                                 class="fa  fa-comments popover-1"></i>
                               <?php endif; ?>


                            </a>

                        </td>
                        <td class="text-center">
                            <?php if ($row['confirmado'] == 'n'): ?>
                            <a href="javascript:void(0)"
                               data-toggle="tooltip"
                               data-id="<?php echo  $row['id']?>"
                               data-placement="top"
                               title="Confirmar la ejecución de la materia <?php echo  $row['materia']?>"
                               data-title="<?php echo  $row['materia']?>" class="_confirmar">
                              <i class="fa   fa-thumbs-o-up"></i>
                            </a>
                            <?php else : ?>
                                ok
                            <?php endif; ?>
                        </td>
                    </tr>
                    <?php endforeach;?>
                    </tbody>

                </table>
                <?php else: ?>
                    <div class="alert alert-warning" role="alert">
                        No hay temas pendientes por confirmar
                    </div>
                <?php endif; ?>
            </div><!-- /.box-body -->
        </div><!-- /.box -->

        <?php endif; ?>



    </div>
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <!-- Columna derecha -->
        <?php if(in_array(3,$perfiles)): ?>
        <!-- Comentarios -->
        <?php if(!empty($comentarios)): ?>
        <div class="box">
            <div class="box-header with-border">
                <h3 class="box-title">Últimos comentarios</h3>
            </div><!-- /.box-header -->
            <div class="box-body chat comentario-contador">
        <?php foreach ($comentarios as $comentario): ?>

            <div class="item">

                <?php echo img('template/img/user.png',['class' => 'offline']); ?>
                <p class="message">
                    <a href="#" class="name">
                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i> <?php echo nice_date($comentario['created'], 'd/m/y') ?></small>
                        <?php echo $comentario['autor'].' - '.$comentario['nombre']?>
                    </a>
                    <?php echo $comentario['descripcion'] ?><br>
                    <i><?php echo $comentario['materia'].' - '.$comentario['titulo'] ?></i>
                </p>
            </div>

        <?php endforeach; ?>
            </div>
        </div>
        <?php endif; ?>
        <?php endif; ?>

    </div>
</div>


<?php if(in_array(2,$perfiles)): ?>
<!-- Información para el docente -->

<?php /*
    <div class="row">
        <div class="col-lg-12 col-xs-12 col-md-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Titulo</small></h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">



                    </div>
                </div>
                <!-- /.box-body -->
            </div>

        </div>
    </div>
 */ ?>
<?php endif; ?>
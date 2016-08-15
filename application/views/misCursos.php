<?php if (!empty($cursos)): ?>

    <div class="box box-danger">
        <div class="box-header">
            <h3 class="box-title">Materias asignadas</h3>
        </div>
        <div class="box-body lista-cursos">
            <div class="row">
                <?php foreach ($cursos as $curso): ?>
                    <div class="col-lg-4 col-md-4 col-xs-12 col-sm-6">
                        <div class="small-box bg-green">
                            <div class="inner">
                                <h3><?php echo $curso['curso'] ?></h3>
                                <p><?php echo $curso['materia'] ?></p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                            <a href="javascript:void(0)" class="small-box-footer">
                                Detalles <i class="fa fa-arrow-circle-right"></i>
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>

<?php else: ?>
    <div class="col-xs-12">
        <div class="box box-danger">
            <div class="box-header">
                <h3 class="box-title">Estado de los cursos</h3>
            </div>
            <div class="box-body">
                En este momento no tiene cursos asignados
            </div>
        </div>
        <!-- /.box -->
    </div>
<?php endif; ?>

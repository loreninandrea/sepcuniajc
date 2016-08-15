<?php
/**
 * Genera el header del template
 */
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ejecutar Programas | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="<?php echo base_url() ?>template/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="<?php echo base_url() ?>template/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url() ?>template/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>template/dist/css/personalizado.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php echo base_url() ?>template/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>template/plugins/sweetalert/dist/sweetalert.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>template/plugins/x-editable/bootstrap3-editable/css/bootstrap-editable.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<?php echo base_url() ?>template/https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="<?php echo base_url() ?>template/https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery 2.2.3 -->
    <script src="<?php echo base_url() ?>template/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="<?php echo base_url() ?>template/bootstrap/js/bootstrap.min.js"></script>

    <script src="<?php echo base_url() ?>template/plugins/jquery.countdown.min.js"></script>
    <script src="<?php echo base_url() ?>template/plugins/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript">
        var baseURl = "<?php echo base_url('index.php/') ?>";
    </script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">

        <!-- Logo -->
        <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>C</b>PR</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>Control</b>PRO</span>
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">


                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="<?php echo base_url() ?>template/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs"><?php echo $usuario ?> </span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="<?php echo base_url() ?>template/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                                <p>
                                    <?php echo $usuario ?>
                                    <small>Miembro desde  <?php echo nice_date($created, 'Y-m-d'); ?></small>
                                </p>
                            </li>
                            <li class="user-footer">

                                <div class="pull-right">
                                    <a href="<?php echo site_url("usuario/logout"); ?>" class="btn btn-default btn-flat">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                    <li class="oculto">
                        <a href="#" data-toggle="control-sidebar" class="_barra-izquierda"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>

        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<?php echo base_url() ?>template/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><?php echo $usuario ?></p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">Menu Principal </li>
                <li class="active">
                    <a href="<?php echo site_url("Dashboard"); ?>">
                        <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                        <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                    </a>
                </li>

                <?php
                // Generación del menu principal
                include 'menu.php';
                foreach($menu as $link):
                   if(in_array($link['perfil'],$perfiles)):
                ?>
                <li>
                    <a href="<?php echo site_url($link['controlador']); ?>">
                        <i class="<?php echo $link['class'] ?>"></i>
                        <span><?php echo $link['nombre'] ?></span>
                    </a>
                 </li>

                <?php
                    endif;
                  endforeach; ?>

                <li><a href="<?php echo site_url("usuario/logout"); ?>"><i class="fa fa-circle-o text-aqua"></i> <span>Salir</span></a></li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <?php echo $title ?>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active"><?php echo $title ?></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

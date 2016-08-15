<?php
/**
 * Genera el menu principal de navegación para los usuarios de acuerdo a los perfiles
 */

$menu = [

    [
        'perfil' => 1,
        'nombre' => 'Usuarios',
        'class' => 'fa fa-circle-o',
        'controlador' => 'usuarios'
    ],
    [
        'perfil' => 1,
        'nombre' => 'Materias',
        'class' => 'fa fa-circle-o',
        'controlador' => 'materias'
    ],
    [
        'perfil' => 1,
        'nombre' => 'Cursos',
        'class' => 'fa fa-circle-o',
        'controlador' => 'cursos'
    ],

    /*[
        'perfil' => 2,
        'nombre' => 'Cursos',
        'class' => 'fa fa-circle-o',
        'controlador' => 'Cursos'
    ],

    [
        'perfil' => 2,
        'nombre' => 'Mis Cursos',
        'class' => 'fa fa-circle-o',
        'controlador' => 'Reportes'
    ],*/

    [
        'perfil' => 3,
        'nombre' => 'Mis Cursos',
        'class' => 'fa fa-circle-o',
        'controlador' => 'plan/misCurso'
    ],

   /* [
    'perfil' => 3,
    'nombre' => 'Cursos',
    'class' => 'fa fa-circle-o',
    'controlador' => 'Cursos/miscursos'
    ],*/

];

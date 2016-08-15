###################
 Ejecutar Programas
###################
La funcición principal es llevar el control de las materias dictadas por un docente de una universidad X.



*******************
Configuración
*******************

- Script de la base de datos es el siguiente
BD/Modelo entidad relacion.sql

- Para la base de datos es el siguiente archivo, esta en postgresSQL
application/config/database.php


**************************
Clave de los usuarios
**************************
- Usuario estudiante
   estudiante@proyecto.com
   clave: 123456
- Usuario docente
   docente@proyecto.com
   clave: 123456

**********************************
 Update base de datos
**********************************
- se crea una nueva tabla con el nombre materias_plan_temas: Esta es con el fin de crear la lista de temas por materia
  que se le entrega al docente para poder dictar el plan de trabajo, si el docente cambia el tema esto queda registrado
  en la tabla materias_ejecución.

- Se agrega el cambio para ingresar el numero de horas al plan de ejecución, el sistema toma las horas recomendadas en el caso que el docente no las cambie.
**********************************
 Estudiante
**********************************
- El estudiante organiza los temas por autorizar por relevancia, entre menos tiempo tenga para autorizar el tema sera los primeros en la lista,
los cursos  confirmados por el sistema o por otro auditor se presenta en la parte de abajo de la lista con una menor relavancia.
**********************************
 Docente
**********************************
- El docente puede modificar las horas de trabajo
- Cambiar el tema sugerido
- Ingresar comentarios respecto al tema dictado
- El sistema automaticamente le indica al docente cuanto tiempo le queda para poder aplicar cambios sobre la programación


*******************
Server Requirements
*******************

PHP version 5.6 or 7


************
Installation
************

Please see the `installation section <https://codeigniter.com/user_guide/installation/index.html>`_
of the CodeIgniter User Guide.

*******
License
*******

Please see the `license
agreement <https://github.com/bcit-ci/CodeIgniter/blob/develop/user_guide_src/source/license.rst>`_.

*********
Resources
*********

-  `User Guide <https://codeigniter.com/docs>`_
-  `Language File Translations <https://github.com/bcit-ci/codeigniter3-translations>`_
-  `Community Forums <http://forum.codeigniter.com/>`_
-  `Community Wiki <https://github.com/bcit-ci/CodeIgniter/wiki>`_
-  `Community IRC <https://webchat.freenode.net/?channels=%23codeigniter>`_

Report security issues to our `Security Panel <mailto:security@codeigniter.com>`_
or via our `page on HackerOne <https://hackerone.com/codeigniter>`_, thank you.

***************
Acknowledgement
***************

The CodeIgniter team would like to thank EllisLab, all the
contributors to the CodeIgniter project and you, the CodeIgniter user.
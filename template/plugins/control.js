$(document).ready(function () {
    // Genera las ventanas con los comentarios
    $('.popover-1').popover({html: true});
    //Proceso de confirmacion
    $('._confirmar').click(function () {

        var elemento = $(this);

        swal({
            title: 'Confirmación - ' + elemento.data('title'),
            text: "Ayudanos a mejorar ¿Que tal clase?",
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "Write something",
            showLoaderOnConfirm: true,
        }, function (inputValue) {
            if (inputValue !== false) {
                $.ajax({
                    url: baseURl + '/plan/confirmar/',
                    type: 'POST',
                    async: true,
                    dataType: 'json',
                    data: {planEjecucion: elemento.data('id'), comentario: inputValue},
                    success: function (json) {
                        if (json.estado == 1) {
                            swal("Confirmación", json.mensaje, "success");
                        } else {
                            swal("Error", json.mensaje, "error");
                        }

                        elemento.hide('show');
                        $('.contador-'+elemento.data('cerrado'))
                            .countdown('stop')
                            .removeClass('contador')
                            .html('ok');
                    },
                    error: function () {

                    }
                });
            }
        });
        return false;
    });
    // Proceso que inicar el plan de trabajo
    $('._iniciar').click(function (e) {
        e.preventDefault();
        var elemento = $(this);

        swal({
            title: 'Registrando el plan de trabajo',
            text: $('._tema-' + elemento.data('id')).text(),
            type: "input",
            showCancelButton: true,
            closeOnConfirm: false,
            animation: "slide-from-top",
            inputPlaceholder: "Write something",
            showLoaderOnConfirm: true,
        }, function (inputValue) {
            if (inputValue === false) return false;

                $.ajax({
                    url: elemento.data('url'),
                    type: 'POST',
                    async: true,
                    dataType: 'json',
                    data: {plan_id: elemento.data('id'), comentario: inputValue},
                    success: function (json) {
                        if (json.estado == 0) {
                            var now = moment();
                            var thirty = moment(now).add(24,"hours");
                            thirty = thirty.format('YYYY/MM/DD hh:mm:ss');
                            $(".contador-"+elemento.data('id'))
                                .countdown(thirty, function(event) {
                                    $(this).text(
                                        event.strftime('%H:%M:%S')
                                    );
                                });
                            swal("Confirmación", json.mensaje, "success");
                            elemento.slideUp('show');
                        } else {
                            swal("Error", json.mensaje, "error");
                        }
                    },
                    error: function () {
                        sweetAlert("Oops...", "Se genero un error inesperado intentelo de nuevo más tarde", "error");
                    }
                });
        });
        return false;
    });

    $('._comentario').click(function (e) {
        e.preventDefault();
        var elemento = $(this);

             $.ajax({
                url: elemento.data('url'),
                type: 'POST',
                async: true,
                dataType: 'json',
                data: {plan_id: elemento.data('id')},
                success: function (json) {

                    $('.tab-pane.active').html('');

                    var contenedor_comentarios = $("<div />", {
                        "id": "control-sidebar-theme-demo-options-tab",
                        "class": "tab-pane active _eliminar_comentario"
                    });

                    var comentarios = $("<div />", {
                        "id": "lista-comentarios",
                        "class": "comments"
                    });
                    $('._eliminar_comentario').remove();

                    var comments_settings = $("<div />");
                    var accion = $("<div />",{
                        "class": "_eliminar_comentario"
                    });

                    comments_settings.append(
                     "<h4 class='control-sidebar-heading comentario-titulo'>"
                     + $('._tema-' + elemento.data('id')).text()
                     + "</h4>");

                    if(json.vacio == 0){

                        $.each(json.comentarios,function (i,c){
                           comments_settings.append(
                               "<div class='form-group tab-comentario'>"
                               + '<label>' + c.nombre + '</label>'
                               +  c.descripcion
                               + "<i class='small'>" + c.fecha + "</i>"
                               + "</div>"
                           )
                        });


                    }else{
                        comments_settings.append(
                            "<div class='form-group tab-comentario'>"
                            + '<label>No se han registrado comentarios</label>'
                            + "</div>"
                        )
                    }
                    comentarios.append(comments_settings);
                    contenedor_comentarios.append(comentarios);

                    if(json.actualizar){
                        accion.append(
                            "<div class='form-group tab-comentario accion-comentario'>"
                            + '<label>Nuevo comentario</label>'
                            + '<textarea class="_nuevo-comentario form-control"  cols="30" rows="3" maxlength="450"></textarea>'
                            + '<button type="button" class="btn btn-default _comentar btn-sm" data-id="'+elemento.data('id')+'">Comentar</button>'
                            + '<button type="button" data-toggle="control-sidebar" class="btn btn-info _comentar-cerrar btn-sm">Cerrar</button>'
                            + "</div>"
                        )
                    }else{
                        accion.append(
                            "<div class='form-group tab-comentario accion-comentario'>"
                            + '<label>No puede adicionar comentarios, por una de las siguientes razones</label>'
                            + '<ul>'
                            +'<li>La ejecución del trabajo fue confirmada por una representate</li>'
                            +'<li>No ha iniciado la ejecución del plan de trabajo</li>'
                            +'</ul>'
                            + '<button type="button" data-toggle="control-sidebar" class="btn btn-info _comentar-cerrar btn-sm">Cerrar</button>'
                            + "</div>"
                        )
                    }


                    $("#control-sidebar-home-tab").after(accion);
                    $("#control-sidebar-home-tab").after(contenedor_comentarios);
                    $('._barra-izquierda').trigger('click');
                },
                error: function () {
                }
            });
        return false;
    });
    /**
     * Cierra el panel de comentarios
     */
    $('body').on('click','._comentar-cerrar',function(e){
        e.preventDefault();
        $('._barra-izquierda').trigger('click');
        $('#control-sidebar-theme-demo-options-tab,._eliminar_comentario').remove();
        return false;
    });
    /**
     * Añadir un nuevo comentario
     */
    $('body').on('click','._comentar',function(e){

        var elemento = $(this);

        if($('._nuevo-comentario').val() != ''){
            $.ajax({
                url: baseURl + '/plan/addComentario',
                type: 'POST',
                async: true,
                dataType: 'json',
                data: {plan_id: elemento.data('id'), comentario: $('._nuevo-comentario').val()},
                success: function (json) {
                   if(json.error == 1){
                       sweetAlert("Oops...", json.comentarios, "error");
                   }else{
                       sweetAlert("Oops...", json.comentarios, "success");
                       var enlace ='a[data-id="'+elemento.data('id')+'"]';
                       $('#control-sidebar-theme-demo-options-tab,._eliminar_comentario').remove();
                       $(enlace).trigger('click');
                       $(enlace).trigger('click');
                   }
                },
                error: function () {
                    sweetAlert("Oops...", "Se genero un error inesperado intentelo de nuevo más tarde", "error");
                }
            });
        }else{
            sweetAlert("Oops...", "Por favor ingrese un comentario", "error");
        }
    });



    $('._materias').change(function () {
        if($(this).val() != ''){
            var elemento = $(this);
            $.ajax({
                url: elemento.data('url'),
                type: 'POST',
                async: true,
                dataType: 'json',
                data: {curso_id: elemento.val()},
                success: function (json) {
                    $('#'+elemento.data('children')).html('<option>Seleccione</option>');
                    if(json.cursos.length > 0){
                        $.each(json.cursos,function (i,c){
                            $('#'+elemento.data('children')).append('<option value="'+c.id+'">'+c.nombre+'</option>');
                        });
                    }
                },
                error: function () {
                    sweetAlert("Oops...", "Se genero un error inesperado intentelo de nuevo más tarde", "error");
                }
            });
        }
    });


});
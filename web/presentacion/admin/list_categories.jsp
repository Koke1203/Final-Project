<%--
    Document   : list_categories
    Created on : 09/06/2020, 03:37:52 PM
    Author     : groya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
        <%@include file="/presentacion/admin/head_admin.jsp" %>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="/presentacion/admin/header_admin.jsp" %>
        <div class="page-wrapper">
            <div class="row-fluid">

                <div id="toolbar" class="toolbar btn-toolbar ">
                    <div class="toolbar-action">
                        <div class="progress-indicator-container">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModalCenter">
                                Add Category
                            </button>
                        </div>
                    </div>
                </div>

                <!--*******************************TABLA ***********************************-->

                <div class="list-form table-responsive">
                    <table id="orders-table" class="table table-striped">
                        <thead>
                            <tr>
                                <th class="list-action">DESCRIPTION</th>
                                <th class="list-action">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody id="listado"></tbody>
                    </table>
                </div>
                <!--***********************************************************************-->



                <!--***************************************MODAL DEL ADD*********************************************-->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Add Category</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="formulario-add">
                                    <div class="form-group">
                                        <label for="descripcion_cat">Description</label>
                                        <input type="text" class="form-control" id="descripcion_cat" name="descripcion_cat"
                                               aria-describedby="emailHelp" placeholder="Category Description">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button id="btnAdd" type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--************************************************************************************************-->
                <!--***************************************MODAL DEL EDIT*********************************************-->
                <div class="modal fade" id="editMenu" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Edit Category</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="formulario-edit">
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Description</label>
                                        <input type="text" class="form-control" id="description_edit" name="description_edit"
                                               placeholder="Description">
                                    </div>
                                    <input type="text" class="form-control" id="codigo_edit" name="codigo_edit" hidden>

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button id="btnGuardar_edicion" type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>


                <!--************************************************************************************************-->
            </div>
        </div>
        <script>
            function loaded() {
                listarCategorias();
                $("#btnAdd").on("click", add);
                $("#btnEditar").on("click", edit);
                $("#btnGuardar_edicion").on("click", guardarEdicion);
            }
            $(loaded);

            function listarCategorias() {
                $.ajax({type: "GET", url: "api/categorias/listar", contentType: "application/json"})
                        .then((categorias) => {
                            //console.log(categorias);
                            listCat(categorias);
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function listCat(categorias) {
                var listado = $("#listado");
                listado.html("");
                categorias.forEach((c) => {
                    row(listado, c);
                });
            }

            function row(listado, categoria) {
                var tr = $("<tr />");
                tr.html(
                        "<td class='list-col-index-2 list-col-name-order-id list-col-type-text'>" + categoria.descripcion + "</td>" +
                        "<td class='list-col-index-5 list-col-name-order-type-name list-col-type-text'>" +
                        "<a id='btnEditar'  data-toggle='modal' data-target='#editMenu' >" +
                        "<img src='https://img.icons8.com/fluent/25/000000/edit.png'/>" +
                        "</a>" +
                        "</td>");
                tr.find("#btnEditar").on("click", () => {
                    show(categoria);
                });
                /*tr.find("#btnDelete").on("click", () => {
                 del(platillo.codigo);
                 });*/
                listado.append(tr);
            }

            function add() {
                if (!validar())
                    return;
                categoria = {descripcion: $("#formulario-add input[type='text']").filter("#descripcion_cat").val()};
                //console.log("Valores inputs:", categoria);
                $.ajax({type: "POST", url: "api/categoria/add",
                    data: JSON.stringify(categoria), contentType: "application/json"})
                        .then((categorias) => {
                            $("#exampleModalCenter").modal('hide');
                            listCat(categorias);
                            $("#formulario-add")[0].reset();
                        },
                                (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function edit(categoria) {
                //console.log(platillo);
                $.ajax({type: "POST", url: "api/categoria/get", data: JSON.stringify(categoria), contentType: "application/json"})
                        .then((obj) => {
                            show(obj);
                        },
                                (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function show(categoria) {
                console.log(categoria);
                $("#description_edit").val(categoria.descripcion);
                $("#codigo_edit").val(categoria.codigo);
            }

            function validar() {
                var error = false;
                $("#formulario-add input").removeClass("is-invalid");
                error |= $("#formulario-add input[type='text']")
                        .filter((i, e) => {
                            return e.value == '';
                        }).length > 0;
                $("#formulario-add input[type='text']")
                        .filter((i, e) => {
                            return e.value == '';
                        }).addClass("is-invalid");
                return !error;
            }

            function validarEdicion() {
                var error = false;
                $("#formulario-edit input").removeClass("is-invalid");
                error |= $("formulario-edit input[type='text']")
                        .filter((i, e) => {
                            return e.value == '';
                        }).length > 0;
                $("#formulario-edit input[type='text']")
                        .filter((i, e) => {
                            return e.value == '';
                        }).addClass("is-invalid");
                return !error;
            }

            function guardarEdicion() {
                if (!validarEdicion())
                    return;
                categoria = {codigo: $("#formulario-edit input[type='text']").filter("#codigo_edit").val(),
                    descripcion: $("#formulario-edit input[type='text']").filter("#description_edit").val()};
                console.log(categoria);
                $.ajax({type: "POST", url: "api/categoria/edit",
                    data: JSON.stringify(categoria), contentType: "application/json"})
                        .then((categorias) => {
                            console.log(categorias);
                            listCat(categorias);
                            $("#editMenu").modal('hide');
                            $("#formulario-edit")[0].reset();
                        },
                                (error) => {
                            alert(errorMessage(error.status));
                        });
            }

        </script>
        <%@include file="/presentacion/admin/animation_admin.jsp" %>
    </body>
</html>

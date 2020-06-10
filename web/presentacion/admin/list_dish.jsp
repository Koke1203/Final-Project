<%--
    Document   : list_dish
    Created on : 08-jun-2020, 19:46:53
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                                Add Dish
                            </button>
                        </div>
                    </div>
                </div>
                <!--*******************************TABLA ***********************************-->

                <div class="list-form table-responsive">
                    <table id="orders-table" class="table table-striped">
                        <thead>
                            <tr>
                                <th class="list-action">NAME DISH</th>
                                <th class="list-action">PRICE</th>
                                <th class="list-action">DESCRIPTION</th>
                                <th class="list-action">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody id="listado">
                            <%--<tr>
                                <td id="name_dish" class="list-col-index-2 list-col-name-order-id list-col-type-text">PUFF-PUFF</td>
                                <td id="price" class="list-col-index-3 list-col-name-full-name list-col-type-text">4.99</td>
                                <td id="description" class="list-col-index-4 list-col-name-order-type-name list-col-type-text">Traditional
                                    Nigerian donut ball, rolled in sugar</td>
                                <td class="list-col-index-5 list-col-name-order-type-name list-col-type-text">
                                    <a id="btnEditar" href="direccion nuestra" data-toggle="modal" data-target="#editMenu" >
                                        <img src="https://img.icons8.com/fluent/25/000000/edit.png"/>
                                    </a>
                                    <a href="direccion nuestra">
                                        <img src="https://img.icons8.com/fluent/25/000000/delete-sign.png"/>
                                    </a>
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                </div>
                <!--***************************************MODAL DEL ADD*********************************************-->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Add Dish</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="formulario-add">
                                    <div class="form-group">
                                        <label for="name_dish">Name</label>
                                        <input type="text" class="form-control" id="name_dish" name="name_dish"
                                               aria-describedby="emailHelp" placeholder="Name Dish">
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Price</label>
                                        <input type="text" class="form-control" id="price" name="price" placeholder="Price">
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <input type="text" class="form-control" id="description" name="description"
                                               placeholder="Description">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Categoria</label>
                                        <select  class="custom-select" id="tipo_categoria"></select>
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

            </div>
        </div>
        <!--***************************************MODAL DEL EDIT*********************************************-->
        <div class="modal fade" id="editMenu" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Edit Dish</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="formulario-edit">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <input type="text" class="form-control" id="name_dish_edit" name="name_dish_edit"
                                       aria-describedby="emailHelp" placeholder="Name Dish">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Price</label>
                                <input type="text" class="form-control" id="price_edit" name="price_edit" placeholder="Price">
                            </div>
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
        <script>
            function loaded() {
                listarCategorias();
                listarPlatillos();
                $("#btnEditar").on("click", edit);
                $("#btnAdd").on("click", add);
                $("#btnGuardar_edicion").on("click", guardarEdicion);
            }

            $(loaded);

            function add() {
                if (!validar())
                    return;
                platillo = {
                    nombre: $("#formulario-add input[type='text']").filter("#name_dish").val(),
                    precio: $("#formulario-add input[type='text']").filter("#price").val(),
                    descripcion: $("#formulario-add input[type='text']").filter("#description").val(),
                    codigo_categoria: $("#tipo_categoria option:selected").val()};
                console.log("Valores inputs:", platillo);
                $.ajax({type: "POST", url: "api/platillo/add",
                    data: JSON.stringify(platillo), contentType: "application/json"})
                        .then((platillos) => {
                            $("#exampleModalCenter").modal('hide');
                            list(platillos);
                            $("#formulario-add")[0].reset();
                        },
                                (error) => {
                            alert(errorMessage(error.status));
                        });
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
                var listado = $("#tipo_categoria");
                categorias.forEach((c) => {
                    var option = $("<option value='" + c.codigo + "'>" + c.descripcion + "</option>");
                    listado.append(option);
                });
            }

            function listarPlatillos() {
                $.ajax({type: "GET", url: "api/platillos/listAll", contentType: "application/json"})
                        .then((platillos) => {
                            //console.log(platillos);
                            list(platillos);
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }


            function list(platillo) {
                var listado = $("#listado");
                listado.html("");
                platillo.forEach((p) => {
                    row(listado, p);
                });
            }

            function row(listado, platillo) {
                var tr = $("<tr />");
                tr.html(
                        "<td id='name_dish' class='list-col-index-2 list-col-name-order-id list-col-type-text'>" + platillo.nombre + "</td>" +
                        "<td id='price' class='list-col-index-3 list-col-name-full-name list-col-type-text'>" + "£" + platillo.precio + "</td>" +
                        "<td id='description' class='list-col-index-4 list-col-name-order-type-name list-col-type-text'>" + platillo.descripcion + "</td>" +
                        "<td class='list-col-index-5 list-col-name-order-type-name list-col-type-text'>" +
                        "<a id='btnEditar'  data-toggle='modal' data-target='#editMenu' >" +
                        "<img src='https://img.icons8.com/fluent/25/000000/edit.png'/>" +
                        "</a>" +
                        /*"<a id='btnDelete'>" +
                         "<img src='https://img.icons8.com/fluent/25/000000/delete-sign.png'/>" +
                         "</a>" +*/
                        "</td>");
                tr.find("#btnEditar").on("click", () => {
                    edit(platillo);
                });
                /*tr.find("#btnDelete").on("click", () => {
                 del(platillo.codigo);
                 });*/
                listado.append(tr);
            }

            function edit(platillo) {
                //console.log(platillo);
                $.ajax({type: "POST", url: "api/platillo/get", data: JSON.stringify(platillo), contentType: "application/json"})
                        .then((obj) => {
                            show(obj);
                        },
                                (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function show(per) {
                //console.log(per);
                $("#codigo_edit").val(per.codigo);
                $("#name_dish_edit").val(per.nombre);
                $("#price_edit").val(per.precio);
                $("#description_edit").val(per.descripcion);
                $("#categoria_edit").val(per.codigo_categoria);
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
                platillo = {
                    codigo: $("#formulario-edit input[type='text']").filter("#codigo_edit").val(),
                    nombre: $("#formulario-edit input[type='text']").filter("#name_dish_edit").val(),
                    precio: $("#formulario-edit input[type='text']").filter("#price_edit").val(),
                    descripcion: $("#formulario-edit input[type='text']").filter("#description_edit").val()};
                console.log(platillo);
                $.ajax({type: "POST", url: "api/platillo/edit",
                    data: JSON.stringify(platillo), contentType: "application/json"})
                        .then((platillos) => {
                            list(platillos);
                            $("#editMenu").modal('hide');
                            $("#formulario-edit")[0].reset();
                        },
                                (error) => {
                            alert(errorMessage(error.status));
                        });
            }


            /*function del(codigo) {
             platillo = {codigo: codigo};
             console.log(platillo);
             $.ajax({type: "POST", url: "api/platillo/delete", data: JSON.stringify(platillo), contentType: "application/json"})
             .then((platillos) => {
             console.log(platillos);
             list(platillos);
             },
             (error) => {
             alert(errorMessage(error.status));
             });
             }*/

            function errorMessage(status) {
                switch (status) {
                    case 404:
                        return "Registro no encontrado";
                    case 403:
                    case 405:
                        return "Usuario no autorizado";
                    case 406:
                        return "Registro duplicado";
                    default:
                        return "Error: " + status;
                }
            }




        </script>
        <%@include file="/presentacion/admin/animation_admin.jsp" %>
    </body>
</html>

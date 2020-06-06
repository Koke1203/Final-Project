<!DOCTYPE html>
<html lang="en">

    <head>
        <meta name="Content-type" content="text/html; charset=utf-8" type="equiv">
        <%@include file="/presentacion/admin/head_admin.jsp" %>
    </head>

    <body class="page ">
        <%@include file="/presentacion/admin/header_admin.jsp" %>




        <div class="row-fluid" style="margin-top: 120px; margin-left: 250px; margin-right: 25px;">
            <div class="alert alert-dismissible fade show" role="alert">
                <p id="message"></p>
                <button type="button" class="close"  id="btnCloseAlert" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="list-form table-responsive">
                <table id="orders-table" class="table table-striped">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <script>


            function loaded() {
                $("#nav-list-orders").click(function() {
                    mostrarTablaOrdenes();
                });

                $(".alert").on('close.bs.alert', function(event) {
                    event.preventDefault();
                    $(".alert").attr("hidden", true);
                })


            }
            $(loaded);

            function mostrarTablaOrdenes() {
                agregarHeaderTabla();
                listarOrdenes();

                /*$("#checkboxAll-lists").click(() => {
                 //alert("escuchando");
                 //$("input[type=checkbox]").prop('checked', this.checked);
                 $('input[name=\'checked\']').prop('checked', this.checked);

                 });*/

            }

            function agregarHeaderTabla() {
                var listado = $("#orders-table thead");
                listado.html("");
                var tr = $("<tr> /");
                //Se agregan todos los encabezados de la tabla
                agregarHeadersColumnas(tr);
                //Evento que permite al presionar el check box, se seleccionen todos los de la tabla
                /*tr.find("#checkboxAll-lists").on("click", () => {
                 //alert("escuchando");
                 //$("input[type=checkbox]").prop('checked', this.checked);
                 $('input[name=\'checked\']').prop('checked', this.checked);

                 });*/
                listado.append(tr);
            }

            function agregarHeadersColumnas(tr) {
                /*tr.html(
                 "<th class='list-action'>" +
                 "<div class='custom-control custom-checkbox'>" +
                 "<input type='checkbox' id='checkboxAll-lists' class='custom-control-input'>" +
                 "<label class='custom-control-label' for='checkboxAll-lists'>&nbsp;</label>" +
                 "<div></th>");*/

                var headers = [/*"",*/ "ID", "CUSTOMER NAME", "TYPE", "ORDER TIME", "ORDER DATE", "STATUS", "PAYMENT", "TOTAL"];
                headers.forEach((h) => {
                    tr.append("<th class='list-action'>" + h + "</th>");
                });
            }

            function listarOrdenes() {
                $.ajax({type: "GET", url: "api/orders/listAll", contentType: "application/json"})
                        .then((ordenes) => {
                            listOrdenes(ordenes);
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function listOrdenes(ordenes) {
                var listado = $("#orders-table tbody");
                listado.html("");
                //console.log(ordenes);
                ordenes.forEach((orden) => {
                    rowOrden(listado, orden);
                });
            }

            function rowOrden(listado, orden) {
                var tr = $("<tr />");
                //tr.html(/*Chechbox*/
                /*"<td class='list-action'><div class='custom-control custom-checkbox'>" +
                 "<input type='checkbox' id='check" + orden.codigo_orden + "' class='custom-control-input' value='" + orden.codigo_orden + "' name='checked'>" +
                 "<label class='custom-control-label' for='check" + orden.codigo_orden + "'>&nbsp;</label></div></td>" +*/
                /*Edit*/
                //"<td class='list-action'><a class='btn-action btn btn-edit'><i class='fa fa-pencil'></i></a></td>");
                //"<td class='list-action'><button class='btn-action btn btn-edit' id='btnEditar'><i class='fa fa-pencil'></i></button></td>");
                /*Datos de las ordenes*/
                tr.append("<td class='list-col-index-2 list-col-name-order-id list-col-type-text'>" + orden.codigo_orden + "</td>");
                tr.append("<td class='list-col-index-3 list-col-name-full-name list-col-type-text'>" + orden.nombre_cliente + "</td>");
                tr.append("<td class='list-col-index-4 list-col-name-order-type-name list-col-type-text'>" + tipoEntrega(orden.tipo_entrega) + "</td>");
                tr.append("<td class='list-col-index-5 list-col-name-order-time list-col-type-time'>" + orden.hora + "</td>");
                tr.append("<td class='list-col-index-6 list-col-name-order-date list-col-type-date'>" + orden.fecha + "</td>");
                tr.append("<td class='list-col-index-7 list-col-name-status-name list-col-type-partial'>" +
                        "<select class='custom-select' name='selectEstado" + orden.codigo_orden + "' id='selectEstado" + orden.codigo_orden + "' style='margin-left: -30px;'>" +
                        "<option value='Received'>" + "Received" + "</option>" +
                        "<option value='Pending'>" + "Pending" + "</option>" +
                        "<option value='Preparation'>" + "Preparation" + "</option>" +
                        "<option value='Delivery'>" + "Delivery" + "</option>" +
                        "<option value='Completed'>" + "Completed" + "</option>" +
                        "<option value='Canceled'>" + "Canceled" + "</option>" +
                        "</select>" +
                        "</td>");
                tr.append("<td class='list-col-index-8 list-col-name-payment list-col-type-text'>" + tipoPago(orden.tipo_pago) + "</td>");
                tr.append("<td class='list-col-index-9 list-col-name-order-total list-col-type-currency'> £" + orden.total_pagar + "</td>");

                tr.find("#selectEstado" + orden.codigo_orden).val(orden.estado);

                tr.find("#selectEstado" + orden.codigo_orden).change(() => {
                    var orden_editada = {codigo_orden: orden.codigo_orden, estado: tr.find("#selectEstado" + orden.codigo_orden).val()};
                    //console.log(orden_editada);
                    $.ajax({type: "POST", url: "api/order/edit", data: JSON.stringify(orden_editada), contentType: "application/json"})
                            .then((ordenes) => {
                                $(".alert").removeClass("alert-danger").addClass("alert-success");
                                $(".alert #message").html("Orden editada correctamente");
                                $(".alert").removeAttr("hidden");
                                $(".alert").alert();
                                listOrdenes(ordenes);
                            },
                                    (error) => {
                                $(".alert").removeClass("alert-success").addClass("alert-danger");
                                $(".alert #message").html("<strong>NO</strong> se pudo editar la orden.");
                                $(".alert").removeAttr("hidden");
                                $(".alert").alert();
                                alert(errorMessage(error.status));
                            });
                });

                listado.append(tr);
            }

            function tipoPago(codigo_tipo) {
                switch (codigo_tipo) {
                    case 0:
                        return "Cash On Delivery";
                    case 1:
                        return "PayPal Express";
                    case 2:
                        return "Stripe Payment";
                    case 3:
                        return "Mollie Payment";
                    case 4:
                        return "Square Payment";
                }
            }

            function tipoEntrega(codigo_entrega) {
                switch (codigo_entrega) {
                    case 0:
                        return "Delivery";
                    case 1:
                        return "Pick-up";
                }
            }

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
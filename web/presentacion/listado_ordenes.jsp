<%@page import="Logica.Orden"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/presentacion/admin/head_admin.jsp" %>
    </head>
    <body class="page">
        <%@include file="/presentacion/admin/header_admin.jsp" %>

        <%List<Orden> ordenes = (List<Orden>) request.getAttribute("listaOrdenes");%>
        
        <div class="row-fluid" style="margin-top: 70px; margin-left: 250px; margin-right: 25px;">
            <div class="alert alert-dismissible fade show" role="alert">
                <p id="message"></p>
                <button type="button" class="close"  id="btnCloseAlert" data-dismiss="alert" aria-label="Close" hidden>
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <script>
                $('.alert [data-dismiss]').on('click', function() {
                    $('.alert').hide();
                    return false;
                });
            </script>

            <div class="list-form table-responsive">
                <table id="orders-table" class="table table-striped">
                    <thead>
                        <tr>
                            <th class="list-action">ID</th>
                            <th class="list-action">CUSTOMER NAME</th>
                            <th class="list-action">TYPE</th>
                            <th class="list-action">ORDER TIME</th>
                            <th class="list-action">ORDER DATE</th>
                            <th class="list-action">STATUS</th>
                            <th class="list-action">PAYMENT</th>
                            <th class="list-action">TOTAL</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (Orden orden : ordenes) {%>
                        <tr>
                            <td class="list-col-index-2 list-col-name-order-id list-col-type-text"><%=orden.getCodigo_orden()%></td>
                            <td class="list-col-index-3 list-col-name-full-name list-col-type-text"><%= orden.getNombre_cliente()%></td>
                            <td class="list-col-index-4 list-col-name-order-type-name list-col-type-text"><%= orden.getTipoEntrega()%></td>
                            <td class="list-col-index-5 list-col-name-order-time list-col-type-time"><%= orden.getHora()%></td>
                            <td class="list-col-index-6 list-col-name-order-date list-col-type-date"><%= orden.getFecha()%></td>
                            <td class="list-col-index-7 list-col-name-status-name list-col-type-partial">
                                <select class="custom-select" <%--name="<%=orden.getCodigo_orden()%>" --%>id="selectEstado<%=orden.getCodigo_orden()%>" style="margin-left: -50px;">
                                    <option value="Received"> Received</option>
                                    <option value="Pending">Pending</option>
                                    <option value="Preparation">Preparation</option>
                                    <option value="Delivery">Delivery</option>
                                    <option value="Completed">Completed</option>
                                    <option value="Canceled">Canceled</option>
                                </select>
                            </td>
                            <td class="list-col-index-8 list-col-name-payment list-col-type-text"><%=orden.getTipoPago()%></td>
                            <td class="list-col-index-9 list-col-name-order-total list-col-type-currency"> <%= "£" + orden.getTotal_pagar()%></td>

                    <script>
                        $("#selectEstado<%=orden.getCodigo_orden()%>").val("<%=orden.getEstado()%>");
                        $("#selectEstado<%=orden.getCodigo_orden()%>").change(function() {
                            var orden_editada = {codigo_orden: <%=orden.getCodigo_orden()%>, estado: $("#selectEstado<%=orden.getCodigo_orden()%>").val()};
                            //console.log(orden_editada);
                            $.ajax({type: "POST", url: "api/order/edit", data: JSON.stringify(orden_editada), contentType: "application/json"})
                                    .then(() => {
                                        $(".alert").removeClass("alert-danger").addClass("alert-success");
                                        $(".alert #message").html("Orden editada correctamente");
                                        $(".close").removeAttr("hidden");
                                        $(".alert").show();
                                    },
                                            (error) => {
                                        $(".alert").removeClass("alert-success").addClass("alert-danger");
                                        $(".alert #message").html("<strong>NO</strong> se pudo editar la orden.");
                                        $(".close").removeAttr("hidden");
                                        $(".alert").show();
                                    });
                        });
                    </script>

                    </tr>
                    <%}%>
                    
                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="/presentacion/admin/animation_admin.jsp" %>
    </body>
</html>

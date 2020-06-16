<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orden</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body>
        <%@ include file="/presentacion/header.jsp" %>
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row py-5">
                        <!--MENU-->
                        <div class="col-sm-3">
                            <div class="nav flex-column">
                                <a href="ControladorLogin?accion=mi_cuenta" class="nav-item nav-link text-reset"><span class="fa fa-user mr-3"></span>My Account</a>
                                <a href="ControladorCompra?accion=direcciones" class="nav-item nav-link text-reset"><span class="fa fa-book mr-3"></span>Address Book</a>
                                <a href="ControladorCompra?accion=recent_orders" class="nav-item nav-link active font-weight-bold"><span class="fa fa-list-alt mr-3"></span>Recent Orders</a>
                            </div>
                        </div>
                        <!--FIN MENU-->
                        <!--INFORMACION ORDEN-->
                        <div class="col-sm-9">
                            <!--HEADER ORDEN-->
                            <div class="card mb-1">
                                <div id="header_orden" class="card-body text-sm-center">
                                </div>
                            </div>
                            <!---->
                            <!--CUERPO ORDEN-->
                            <div class="row no-gutters">
                                <!--LADO IZQUIERO-->
                                <div class="col-sm-7 pr-sm-1">
                                    <!--ARRIBA-->
                                    <div class="card mb-1">
                                        <div class="card-body">
                                            <div class="d-sm-flex">
                                                <div class="">
                                                    <dl class="no-spacing mb-0">
                                                        <dd><h2 class="h4 mb-0 font-weight-normal">TastyIgniter</h2></dd>
                                                        <dd>
                                                            <span class="text-muted text-truncate">345 Lewisham Road, London SE13 7AB, United Kingdom</span>
                                                        </dd>
                                                        <dd>8273647892</dd>
                                                        <dd>
                                                            <a href="ControladorCompra?accion=menu">View Menu</a>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>               
                                        </div>
                                    </div>
                                    
                                    <!--ABAJO-->
                                    <div class="card">
                                        <div class="card-body">
                                            <h2 class="h4 mb-0 font-weight-normal">Order Summary</h2>
                                            <!--PLATILLOS-->
                                            <div class="cart-items pt-2" id="summary">
                                            </div>
                                            <!--TOTALES-->
                                            <div class="cart-totals" id="totales">
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!--FIN-->
                                <!--LADO DERECHO-->
                                <div class="col-sm-5">
                                    <!--INFORMACION PERSONAL-->
                                    <div class="card mb-1" id="info_personal">
                                    </div>

                                    <!--COMENTARIOS-->
                                    <div class="card mb-1">
                                        <div class="card-body">
                                            <h2 class="h4 font-weight-normal">Your comment</h2>
                                            <p class="mb-0">You didn't leave a comment</p>
                                        </div>
                                    </div>
                                    
                                    <!--TIPO DE PAGO-->
                                    <div class="card">
                                        <div class="card-body">
                                            <h2 class="h4 font-weight-normal">Payment Method</h2>
                                            <p class="mb-0" id="tipo_pago"></p>
                                        </div>
                                    </div>
                                    
                                </div>
                                <!--FIN-->
                            </div>
                            <!---->
                        </div>
                        <!---->
                    </div>
                </div>
            </div>
        </main>

        <script>
            function loaded() {
                traerOrdenClienteDetalle();
                var seleccionados = new Array();
            }
            $(loaded);
            
            function traerOrdenClienteDetalle(){
                $.ajax({type: "GET", data:"", url: "api/cliente/listarOrden", contentType: "application/json"})
                .then((orden_detalles) => {
                    if(orden_detalles!=null){
                        listarHeaderOrden(orden_detalles.orden_cliente.orden);
                        listarOrderSummary(orden_detalles.orden_cliente.detalles);
                        listarTotales(orden_detalles.orden_cliente.orden);
                        var detalles_orden = new Array();
                        detalles_orden = orden_detalles.orden_cliente.detalles;
                        listarInfoPersonal(orden_detalles.orden_cliente.orden,orden_detalles.direccion);
                        listarTipoPago(orden_detalles.orden_cliente.orden);
                    }
                }, (error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            //cargar la orden
            function listarHeaderOrden(orden) {
                var header_div = $("#header_orden");
                header_div.append(
                    "<div class='label label-light mb-3'>" +
                    "<span class='h6'><i class='fa fa-clock'></i>&nbsp;" + orden.fecha + " at " + orden.hora + "</span>" +
                    "</div><h5>Order #" + orden.codigo_orden + "</h5>" +
                    "<h3 style='color: #00a65a;'>" + orden.estado + "</h3>" +
                    "<p class='lead'>Details of your order.</p>" +
                    "<p class='mb-0'>Order Summary and personal information.</p>"
                );
            }
            
            function listarInfoPersonal(orden,direccion){
                var div_personal = $("#info_personal");
                div_personal.html("");
                if(orden.tipo_entrega==0){
                    div_personal.append("<div class='card-body'><h2 class='h4 font-weight-normal'>Delivering to...</h2><b>"+
                        orden.nombre_cliente+"</b><br>"+direccion+"</div>");
                }else{
                    div_personal.append("<div class='card-body'><h2 class='h4 font-weight-normal'>Pick-up to...</h2><b>"+
                        orden.nombre_cliente+"</b></div>");
                }
            }
            
            function listarTipoPago(orden){
                var tipo_pago = $("#tipo_pago");
                if(orden.tipo_pago==0){
                    tipo_pago.append("Cash On Delivery");
                }else if(orden.tipo_pago==1){
                    tipo_pago.append("PayPal Express");
                }else if(orden.tipo_pago==2){
                    tipo_pago.append("Stripe");
                }else if(orden.tipo_pago==3){
                    tipo_pago.append("Mollie");
                }else{
                    tipo_pago.append("Square");
                }
            }
            
            function listarOrderSummary(detalles){
                var summary = $("#summary");
                summary.html("");
                summary.append("<div class='cart-items pt-2'><ul>");
                
                detalles.forEach((d)=>{
                    listarPlatillo(d.platillo,summary);
                    d.opciones.forEach((o)=>{
                        listOpcion(o,summary);
                    });
                });
                
                summary.append("</ul></div>");
            }
            
            
            function listarPlatillo(platillo,summary){
                summary.append(
                    "<li class='no_lista' id='titulo'><span class='price pull-right'>£"+platillo.precio+"</span><span class='name'>"+platillo.nombre+"</span>"  
                );
            }
            
            function listOpcion(opcion,summary){
                if(opcion.descripcion!=null){
                    summary.append("<ul class='list-unstyled small text-muted'>"+
                    "<li>"+opcion.descripcion+" &nbsp; (£"+opcion.precio+")</li></ul>");
                }
            }
            
            function listarTotales(orden){
                var totales = $("#totales");
                if(orden.tipo_entrega==0){
                    totales.append(
                        "<div class='table-responsive'><table class='table table-sm mb-0'>"+
                        "<tbody><tr><td class='border-top p-0' colspan='99999'></td></tr><tr>"+
                        "<td class='px-0 text-muted border-0'>Sub Total</td>"+
                        "<td class='text-right px-0 border-0'>£"+orden.total_pagar.toFixed(2)+"</td></tr>"+
                        "<tr><td class='px-0 text-muted border-0'>Delivery</td>"+
                        "<td class='text-right px-0 border-0'>£0.00</td></tr>"+
                        "<tr><td class='px-0 border-top lead font-weight-bold'>Order Total</td>"+
                        "<td class='text-right px-0 border-top lead font-weight-bold'>£"+orden.total_pagar.toFixed(2)+"</td></tr>"+
                        "</tbody></table></div>"
                    );
                }else{
                    totales.append(
                        "<div class='table-responsive'><table class='table table-sm mb-0'>"+
                        "<tbody><tr><td class='border-top p-0' colspan='99999'></td></tr><tr>"+
                        "<td class='px-0 text-muted border-0'>Sub Total</td>"+
                        "<td class='text-right px-0 border-0'>£"+orden.total_pagar.toFixed(2)+"</td></tr>"+
                        "<tr><td class='px-0 border-top lead font-weight-bold'>Order Total</td>"+
                        "<td class='text-right px-0 border-top lead font-weight-bold'>£"+orden.total_pagar.toFixed(2)+"</td></tr>"+
                        "</tbody></table></div>"
                    );
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
    </body>
</html>

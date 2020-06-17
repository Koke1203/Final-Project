<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body>
        <%@ include file="/presentacion/header.jsp" %><br>

        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row py-4">
                        <div class="col-sm-9 m-auto">
                            <!--HEADER ORDEN-->
                            <div class="card mb-1">
                                <div class="card-body text-sm-center">
                                    <div class="label label-light mb-3">
                                        <span class="h6" id="fecha_orden">
                                        </span>
                                    </div>
                                    <h5 id="numero_orden"></h5>
                                    <h3 style="color: #686663;">Received</h3>
                                    <p class="lead">Your order has been received.</p>
                                    <p class="mb-0">Your order has been received and will be with you shortly.</p>
                                    <div class="mt-3">
                                    </div>
                                </div>
                            </div>
                            <!--fin-->

                            <!--CUERPO ORDEN-->
                            <div class="row no-gutters">
                                <!--LADO IZQUIERO-->
                                <div class="col-sm-7 pr-sm-1">
                                    <!--INFO RESTUARANTE-->
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
                                    <!--ORDER SUMMARY-->
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
                                <!--LADO DERECHO-->
                                <div class="col-sm-5">
                                    <!--INFORMACION DEL CLIENTE-->
                                    <div class="card mb-1">
                                        <div class="card-body" id="tipoPedido">
                                        </div>
                                    </div>
                                    <!--COMENTARIOS-->
                                    <div class="card mb-1">
                                        <div class="card-body">
                                            <h2 class="h4 font-weight-normal">Your comment</h2>
                                            <p class="mb-0">You didn't leave a comment</p>
                                        </div>
                                    </div>
                                    <!--METODO DE PAGO-->
                                    <div class="card">
                                        <div class="card-body">
                                            <h2 class="h4 font-weight-normal">Payment Method</h2>
                                            <p class="mb-0" id="metodo_pago"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--fin-->
                        </div>  
                    </div>
                </div>
            </div>
        </main>
        
        <script>
            function loaded(){
                listarInfoOrden();
                traerOrdenClienteDetalle();
            }
            $(loaded);
            
            function listarInfoOrden() {
                $.ajax({type: "GET", url: "api/orden/listarInfo", contentType: "application/json"})
                .then((orden)=>{
                    listOrden(orden);
                },(error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            function listOrden(orden){
                var fecha = $("#fecha_orden");
                fecha.html("");
                fecha.append("<i class='fa fa-clock'></i>&nbsp; "+orden.fecha+" at "+orden.hora+"");
                var numero = $("#numero_orden");
                numero.html("");
                numero.append("<b>Order #"+orden.codigo_orden+"</b>");
                var tipoEntrega = $("#tipoPedido");
                if(orden.tipo_entrega==0){ //delivery
                    tipoEntrega.append("<h2 class='h4 font-weight-normal'>Delivering to...</h2><b>"+orden.nombre_cliente+"</b><br><br><br><br><br>");
                }else{
                    tipoEntrega.append("<h2 class='h4 font-weight-normal'>Pick-up to...</h2><b>"+orden.nombre_cliente+"</b>");
                }
                
                var metodo_pago = $("#metodo_pago");
                if(orden.tipo_pago==0){
                    metodo_pago.append("Cash On Delivery");
                }else if(orden.tipo_pago==1){
                    metodo_pago.append("PayPal Express");
                }else if(orden.tipo_pago==2){
                    metodo_pago.append("Stripe");
                }else if(orden.tipo_pago==3){
                    metodo_pago.append("Mollie");
                }else{
                    metodo_pago.append("Square");
                }
                localStorage.setItem('tipo_entrega', ""+orden.tipo_entrega);
            }
            
            function traerOrdenClienteDetalle(){
                $.ajax({type: "GET", url: "api/orden/listarInfo", contentType: "application/json"})
                .then((orden)=>{
                    alert(orden.codigo_orden);
                    $.ajax({type: "POST", data: JSON.stringify(orden), url: "api/cliente/listarOrdenCompletada", contentType: "application/json"})
                    .then((orden_detalles) => {
                        if(orden_detalles!=null){
                            listarOrderSummary(orden_detalles.orden_cliente.detalles);
                            listarTotales(orden_detalles.orden_cliente.orden);
                            var detalles_orden = new Array();
                            detalles_orden = orden_detalles.orden_cliente.detalles;
                        }
                    }, (error) => {
                        alert(errorMessage(error.status));
                    });
                },(error) => {
                    alert(errorMessage(error.status));
                });   
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

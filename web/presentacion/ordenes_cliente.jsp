<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordenes</title>
        <%@ include file="/presentacion/head.jsp"%>
    </head>
    <body>
        <%@include file="/presentacion/header.jsp"%>
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row py-5">
                        <!--MENU LATERAL-->
                        <div class="col-sm-3">
                            <div class="nav flex-column">
                                <a href="ControladorLogin?accion=mi_cuenta" class="nav-item nav-link text-reset"><span class="fa fa-user mr-3"></span>My Account</a>
                                <a href="ControladorCompra?accion=direcciones" class="nav-item nav-link text-reset"><span class="fa fa-book mr-3"></span>Address Book</a>
                                <a href="ControladorCompra?accion=recent_orders" class="nav-item nav-link active font-weight-bold"><span class="fa fa-list-alt mr-3"></span>Recent Orders</a>
                            </div>
                        </div>
                        <!--FIN-->

                        <!--LISTADO-->
                        <div class="col-sm-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                                    <th>Location</th>
                                                    <th>Status</th>
                                                    <th>Ready Time - Date</th>
                                                    <th>Order Total</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody id="contenido_tabla">
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination-bar text-right">
                                        <div class="links"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--FIN-->
                    </div>
                </div>
            </div>
        </main>
        
        <script>
            function loaded() {
                listarOrdenesCliente();
            }
            $(loaded);
            
            
            function listarOrdenesCliente(){
                $.ajax({type: "GET",data:"", url: "api/orden/listarOrdenesCliente", contentType: "application/json"})
                .then((ordenes_cliente) => {
                    if(ordenes_cliente.length>0){
                        listOrden(ordenes_cliente);
                    }
                }, (error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            function listOrden(ordenes_cliente){
                var tbody = $("#contenido_tabla");
                tbody.html("");
                ordenes_cliente.forEach((o)=>{
                    tbody.append(
                        "<tr>"+
                            "<td>TastyIgniter</td>"+
                            "<td><b id='estado'>"+o.estado+"</b></td>"+
                            "<td id='fecha'>"+o.fecha+" at "+o.hora+"</td>"+
                            "<td id='precio'>£"+o.total_pagar.toFixed(2)+"</td>"+
                            "<td>"+
                                "<a class='btn btn-light' href='ControladorCompra?accion=orden_show&id="+o.codigo_orden+"'><i class='fa fa-receipt'></i>&nbsp;&nbsp;View order</a>"+
                            "</td>"+
                        "</tr>"
                    );
                });
            }
        </script>
    </body>
</html>

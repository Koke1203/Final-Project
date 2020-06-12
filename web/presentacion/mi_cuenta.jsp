<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi cuenta</title>
        <%@include file="/presentacion/head.jsp" %>
    </head>
    <body class="" style="padding-bottom: 289px;">
        <%@include file="/presentacion/header.jsp"%>
        
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row py-5">
                        <div class="col-sm-3">
                            <div class="nav flex-column">
                                <a href="ControladorLogin?accion=mi_cuenta" class="nav-item nav-link active font-weight-bold"><span class="fa fa-user mr-3"></span>My Account</a>
                                <a href="ControladorCompra?accion=direcciones" class="nav-item nav-link text-reset"><span class="fa fa-book mr-3"></span>Address Book</a>
                                <a href="ControladorCompra?accion=recent_orders" class="nav-item nav-link text-reset"><span class="fa fa-list-alt mr-3"></span>Recent Orders</a>
                            </div>
                        </div>
                        
                        <div class="col-sm-9">
                            <div class="card mb-1">
                                <div class="card-body">
                                    <h5 class="mb-0">Welcome <%=user.getNombre()%></h5>
                                </div>
                            </div>
                            
                            <div class="card-group mb-1">
                                <div class="card mr-sm-1">
                                    <div id="div-direcciones" class="card-body">
                                    </div>
                                </div>
                                
                                <div class="card">
                                    <div id="carrito" class="card-body text-center">
                                        <p><i class="fa fa-shopping-basket fa-3x text-muted"></i></p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="font-weight-normal mb-3">Edit My Details</h5>
                                    <form role="form" action="ControladorLogin">
                                        <div class="form-row">
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%=user.getNombre()%>" name="first_name" placeholder="First Name">
                                                </div>
                                            </div>
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%=user.getApellido()%>" name="last_name" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%=user.getTelefono()%>" name="telephone" placeholder="Telephone">
                                                </div>
                                            </div>
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" value="<%=user.getCorreo()%>" name="correo" placeholder="Email Address" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="newsletter" id="newsletter" class="custom-control-input" value="1">
                                                <label for="newsletter" class="custom-control-label">
                                                    Keep me up-to-date with offers by email.</label>
                                            </div>
                                        </div>

                                        <div class="my-3">
                                            <h5 class="font-weight-normal">Change Password</h5>
                                        </div>

                                        <div class="form-group">
                                            <input type="password" name="old_password" class="form-control" placeholder="Old Password">
                                        </div>
                                               
                                        <div class="form-row">
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" name="new_password" placeholder="New Password">
                                                </div>
                                            </div>
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" name="confirm_new_password" placeholder="New Password Confirm">
                                                </div>
                                            </div>
                                        </div>
                                                
                                        <div>
                                            <button type="submit" value="editar_usuario" name="accion" class="btn btn-primary">Save Details</button>
                                        </div>

                                        <input type="text" name="password_user" value="<%=user.getContrasenia()%>" hidden>
                                    </form>          
                                </div>
                            </div>
                                    
                        </div>
                    </div>
                </div>
            </div>
        </main>      
        
        <script>
            function loaded() {
                listarDirecciones();
                infoCarritoCuenta();
            }
            $(loaded);
            
            function listarDirecciones() {
                $.ajax({type: "GET",data:"", url: "api/direccion/listar", contentType: "application/json"})
                .then((direccion) => {
                    listDireccion(direccion);
                }, (error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            function listDireccion(direccion) {
                var listado = $("#div-direcciones");
                var p;
                listado.html("");
                if(direccion.length<=0){
                    p = $("<p>You don't have a default address</p>");  
                }else{
                    p = $("<p>"+direccion[0].direccion_general+", "+direccion[0].pais+", "+direccion[0].estado+"</p>");
                }
                listado.append(p);
            }
            
            function infoCarritoCuenta(){
                $.ajax({type: "GET",data:"", url: "api/carrito/verificar", contentType: "application/json"})
                .then((carrito) => {
                    var div_carrito = $("#carrito");
                    if(carrito == null){
                        div_carrito.append("<p>There are no menus added in your cart.</p><a class='btn btn-light'"+ 
                        "href='ControladorCompra?accion=menu'>ORDER NOW</a>");
                    }else{
                        var precio_final = 0.0;
                        carrito.forEach((c)=>{
                            precio_final+=c.precio_total;
                        });
                        
                        div_carrito.append("<p>You have 1 items: £"+precio_final.toFixed(2)+"</p>"+
                        "<a class='btn btn-primary' href='ControladorCompra?accion=comprar'>CHECKOUT NOW</a></div>");
                    }
                }, (error) => {
                    alert(errorMessage(error.status));
                });
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

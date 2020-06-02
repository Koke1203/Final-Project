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
                                <a href="#" class="nav-item nav-link active font-weight-bold"><span class="fa fa-user mr-3"></span>My Account</a>
                                <a href="#" class="nav-item nav-link text-reset"><span class="fa fa-book mr-3"></span>Address Book</a>
                                <a href="#" class="nav-item nav-link text-reset"><span class="fa fa-list-alt mr-3"></span>Recent Orders</a>
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
                                    <div class="card-body">
                                        <p>You don't have a default address</p>
                                    </div>
                                </div>
                                
                                <div class="card">
                                    <div class="card-body text-center">
                                        <p><i class="fa fa-shopping-basket fa-3x text-muted"></i></p>
                                        <p>There are no menus added in your cart.</p>
                                        <a class="btn btn-light" href="ControladorCompra?accion=menu">
                                            ORDER NOW                </a>
                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <h5 class="font-weight-normal mb-3">Edit My Details</h5>
                                    <form role="form" action="ControladorRegistro">
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
                                                    <input type="text" class="form-control" value="<%=user.getCorreo()%>" name="correo" placeholder="Email Address" disabled="">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" name="newsletter" id="newsletter" class="custom-control-input" value="1">
                                                <label for="newsletter" class="custom-control-label">
                                                    Keep me up-to-date with offers by email.            </label>
                                            </div>
                                        </div>

                                        <div class="my-3">
                                            <h5 class="font-weight-normal">Change Password</h5>
                                        </div>

                                        <div class="form-group">
                                            <input type="password" name="old_password" class="form-control" value="" placeholder="Old Password">
                                        </div>

                                        <div class="form-row">
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" value="" name="new_password" placeholder="New Password">
                                                </div>
                                            </div>
                                            <div class="col col-sm-6">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" name="confirm_new_password" value="" placeholder="New Password Confirm">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="buttons">
                                            <button type="submit" value="editar_usuario" name="accion" class="btn btn-primary">Actualizar información</button>
                                        </div>
                                    </form>
                                                
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>

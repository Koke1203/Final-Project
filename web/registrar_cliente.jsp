<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body>
        <%@include file="/presentacion/header.jsp"%><br><br>
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 mx-auto my-5">
                            <div class="card">
                                <div class="card-body">
                                    <h1 class="titulo-registro card-title h4 mb-4 font-weight-normal">Register</h1>
                                    <form action="ControladorLogin">
                                        <div class="form-row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" id="nombre" class="form-control input-lg" name="nombre" placeholder="First Name" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="text" id="apellido" class="form-control input-lg" name="apellido" placeholder="Last Name" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" id="correo" class="form-control input-lg" name="correo" placeholder="Email Address" required>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="password" id="password" class="form-control input-lg" name="password" placeholder="Password" required>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <input type="password" id="password-confirm" class="form-control input-lg" name="password_confirm" placeholder="Password Confirm" required>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="text" id="telefono" class="form-control input-lg" name="telefono" placeholder="Telephone" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input id="newsletter" type="checkbox" name="newsletter" value="1" class="custom-control-input">
                                                <label class="custom-control-label" for="newsletter">
                                                    Mantenerme informado sobre promociones por email          </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input id="agree-terms" type="checkbox" name="terms" value="1" class="custom-control-input">
                                                <label class="custom-control-label" for="agree-terms">
                                                    Dando click, aceptas los <a target="_blank" href="#">términos y condiciones</a> que lo puedes ver dentro de este link, incluyendo el uso de Cookies.                </label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12 mb-2">
                                                <button type="submit" class="btn btn-primary btn-block btn-lg" name="accion" value="Registrarse">Register</button>
                                            </div>
                                            <div class="col-12 text-center">
                                                <a href="ControladorLogin?accion=login_show" class="btn btn-link">Login</a>
                                            </div>
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

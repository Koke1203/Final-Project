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
                                    <form method="POST" name="formulario" id="formulario">
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
                                                    <input type="password" id="password-confirm" class="form-control input-lg" name="password_confirm" placeholder="Password Confirm">
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
                                                <button type="button" id="Registrar" class="btn btn-primary btn-block btn-lg" value="Registrarse">Register</button>
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

        <script>
            function loaded() {
                $("#Registrar").on("click", registrarCliente);
            }
            $(loaded);
            function registrarCliente(){
                if(!validarCampos()) return;
                usuario = {
                    correo: $("#correo").val(),
                    nombre: $("#nombre").val(),
                    apellido: $("#apellido").val(),
                    contrasenia: $("#password").val(),
                    tipo: 1,
                    telefono: $("#telefono").val()
                };
                
                $.ajax({type: "POST", url:"api/cliente/add",
                    data: JSON.stringify(usuario), contentType: "application/json"})
                .then(() => {swal("Registro completado!"); },
                    (error) => { alert(errorMessage(error.status)); }
                );
            }
            
            function validarCampos(){
                var error=false;
                $("#formulario input").removeClass("invalid");
                error |= $("#formulario input[type='text']")
                        .filter( (i,e)=>{ return e.value=='';}).length>0;        
                $("#formulario input[type='text']")
                        .filter( (i,e)=>{ return e.value=='';}).addClass("invalid");
                error |= $("#formulario input[type='password']")
                        .filter( (i,e)=>{ return e.value=='';}).length>0;        
                $("#formulario input[type='password']")
                        .filter( (i,e)=>{ return e.value=='';}).addClass("invalid");
                return !error;
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

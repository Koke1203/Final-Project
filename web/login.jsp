<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@ include file="/presentacion/head.jsp"%>
    </head>
    <body style="background-color:#E8E8E8;">
        <%@include file="/presentacion/header.jsp"%><br><br><br><br>
        <% Map<String, String> errores = (Map<String, String>) request.getAttribute("errores"); %>
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4 mx-auto my-5">
                            <div class="card">
                                <div class="card-body">
                                    <h1 class="card-title h4 mb-4 font-weight-normal">
                                        Log In                    </h1>
                                    <form action="ControladorLogin" accept-charset="UTF-8" role="form">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="text" name="email" id="email" class="<%=erroneo("user", errores)%> form-control input-lg" title="<%=title("email", errores)%>" placeholder="Email Address" required="">
                                                <span class="input-group-addon">
                                                    <span class="input-group-text">@</span>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="input-group">
                                                <input type="password" name="password" id="password" class="<%=erroneo("password", errores)%> form-control input-lg" title="<%=title("password", errores)%>" placeholder="Password" required="">
                                                <span class="input-group-addon">
                                                    <span class="input-group-text"><i class="fa fa-lock">&#128274;</i></span>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox">
                                                <input id="rememberLogin" type="checkbox" name="newsletter" value="1" class="custom-control-input">
                                                <label class="custom-control-label" for="rememberLogin">
                                                    Remember me            </label>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-12">
                                                    <button type="submit" name="accion" value="Login" class="login btn btn btn-block btn-lg">Login</button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <a class="registrarse btn btn-default" href="ControladorLogin?accion=registro_show">Registrarse</a>
                                        </div>
                                        <div class="col-md-7">
                                            <a class="btn btn-link btn-lg" href="#">
                                                <span class="letra-forgot small">Olvidó la contraseña?</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
                                                
                                                
                                                
         
        <script>
            //tengo que validar los campos con jquery
            
        </script>
    </body>
</html>

<%!
    private String erroneo(String campo, Map<String, String> errores) {
        if ((errores != null) && (errores.get(campo) != null)) {
            return "is-invalid";
        } else {
            return "";
        }
    }

    private String title(String campo, Map<String, String> errores) {
        if ((errores != null) && (errores.get(campo) != null)) {
            return errores.get(campo);
        } else {
            return "";
        }
    }
    /*
    private Map<String,String[]> getForm(ModelLogin model){
       Map<String,String[]> values = new HashMap<>();
       values.put("user", new String[]{model.getCurrent().getCedula()""});
       values.put("password", new String[]{model.getCurrent().getClave()""});
       return values;
    }*/
%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta content="text/html; charset=utf-8">
        <title>Administrator Page</title>
        <link rel="stylesheet" type="text/css" href="css_admin/flame.css">
        <link rel="stylesheet" type="text/css" href="css_admin/admin.css">
    </head>

    <body class="page page-login">
        <% Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");%>
        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="login-container">
                    <div class="card">
                        <div class="card-body">
                            <form action="ControladorLogin">
                                <div class="form-group">
                                    <label for="input-user" class="control-label">Username</label>
                                    <input type="text" name="email" id="email" class="<%=erroneo("email", errores)%> form-control input-lg" title="<%=title("email", errores)%>" placeholder="Email Address" required>
                                </div>
                                <div class="form-group">
                                    <label for="input-password" class="control-label">Password</label>
                                    <input type="password" name="password" id="password" class="<%=erroneo("password", errores)%> form-control input-lg" title="<%=title("password", errores)%>" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="accion" value="LoginAdmin"  class="btn btn-primary btn-lg pull-right">
                                        <img src="https://img.icons8.com/ios/25/000000/login-rounded-right.png" />
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
%>

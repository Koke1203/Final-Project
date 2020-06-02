<%@page import="Logica.Usuario"%>
<%Usuario user = new Usuario(" ");
  if(session.getAttribute("usuario")!=null){
      user = (Usuario) session.getAttribute("usuario");
  }
%>
<header>
    <nav class="div_header navbar navbar-light navbar-top navbar-expand-md fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img class="img-logo" alt="Tasty" src="images/tastyigniter-logo.png" style="height: 40px;">
            </a>
            <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#navbarMainHeader" aria-controls="navbarMainHeader" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

            <div class="justify-content-end collapse navbar-collapse" id="navbarMainHeader">
                <ul class="nav navbar-nav">
                    <%if (user.getNombre() != " ") {%>
                        <li class="nav-item">
                            <a class="nav-link" href="ControladorLogin?accion=menu">Ver Menú</a>
                        </li>
                        <!--Hacer un dropdown de My account-->
                        <li class="nav-item">
                            <a class="nav-link" href="ControladorLogin?accion=mi_cuenta">Mi cuenta</a>
                            <!--
                                <ul class="nav navbar-nav">
                                    <li>
                                        <a class="nav-link" href="ControladorLogin?accion=mi_cuenta">Ordenes Recientes</a>
                                        <a class="nav-link" href="ControladorLogin?accion=mi_cuenta" onfocus="">Cuenta</a>
                                        <a class="nav-link" href="ControladorLogin?accion=mi_cuenta">Direcciones</a>
                                        <a class="nav-link" href="ControladorLogin?accion=logout">Salir</a>
                                    </li>
                                </ul>
                            -->
                        </li>
                    <%} else {%>
                        <li class="nav-item">
                            <a class="nav-link" href="ControladorLogin?accion=login_show">Iniciar Sesión</a>
                        </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header><br>
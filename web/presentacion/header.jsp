<%@page import="Logica.Usuario"%>
<%Usuario user = new Usuario(" ");
    if (session.getAttribute("usuario") != null) {
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
                        <a class="nav-link" href="ControladorLogin?accion=menu">View Menu</a>
                    </li>
                    <!--Hacer un dropdown de My account-->
                    <li class="nav-item active">
                        <div class="dropdown">
                            <button id="dropdownMenuButton" class="boton-header nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >My Account<span class="caret"></span></button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="ControladorCompra?accion=recent_orders">Recent Orders</a>
                                <a class="dropdown-item" href="ControladorLogin?accion=mi_cuenta">My Account</a>
                                <a class="dropdown-item" href="ControladorCompra?accion=direcciones">Address Book</a>
                                <a class="dropdown-item" href="ControladorLogin?accion=logout">Logout</a>
                            </div>
                        </div>
                    </li>
                    <%} else {%>
                    <li class="nav-item">
                        <a class="nav-link" href="ControladorLogin?accion=menu">View Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ControladorLogin?accion=login_show">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ControladorLogin?accion=registro_show">Register</a>
                    </li>
                    <%}%>
                </ul>
            </div>
        </div>
    </nav>
</header>
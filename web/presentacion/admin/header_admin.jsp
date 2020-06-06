<%@page import="Logica.Usuario"%>
<%Usuario user = new Usuario(" ");
    if (session.getAttribute("usuario") != null) {
        user = (Usuario) session.getAttribute("usuario");
    }
%>
<!--**************************************************-->
<!--**************************************************-->
<!--**************************************************-->
<!--Aqui comienza la barra horizontal del admin-->
<!--**************************************************-->
<!--**************************************************-->
<!--**************************************************-->
<nav class="navbar navbar-top navbar-expand navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-brand">
            <a class="logo" href="DIRECCIONES NUESTRAS">
                <img src="https://img.icons8.com/dusk/44/000000/waiter.png"/>
            </a>
        </div>

        <div class="page-title">
            <span>Dashboard</span>
        </div>

        <div class="navbar navbar-right">
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navSidebar"
                    aria-controls="navSidebar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars"></span>
            </button>

            <ul id="menu-mainmenu" class="navbar-nav" data-control="mainmenu" data-alias="mainmenu">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link" data-toggle="dropdown">
                        <img class="rounded-circle icon-border border-info"
                             src="images/profile.png">
                    </a>
                    <div class="dropdown-menu">
                        <div class="d-flex flex-column w-100 align-items-center">
                            <div class="pt-4 px-4 pb-2">
                                <img class="rounded-circle"
                                     src="images/profile.png">
                            </div>
                            <div class="pb-3 text-center">
                                <div class="text-uppercase"><%=user.getNombre()%></div>
                                <div class="text-muted">Demo Admin</div>
                            </div>
                        </div>
                        <a class="dropdown-item" data-toggle="modal" data-target="#editStaffStatusModal"
                           role="button">
                            <img src="https://img.icons8.com/dusk/24/000000/online.png"/>
                            Set Status </a>
                        <a class="dropdown-item" href="DIRECCIONES NUESTRAS">
                            <img src="https://img.icons8.com/cute-clipart/24/000000/edit.png"/>
                            Edit Details </a>
                        <a class="dropdown-item text-danger" href="">
                            <img src="https://img.icons8.com/dusk/24/000000/logout-rounded-left.png"/>
                            Logout </a>          
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--**************************************************-->
<!--**************************************************-->
<!--**************************************************-->
<!--Aqui comienza la barra lateral del admin principal-->
<!--**************************************************-->
<!--**************************************************-->
<!--**************************************************-->
<div class="sidebar" role="navigation">
    <div id="navSidebar" class="nav-sidebar">
        <ul id="side-nav-menu" class="nav">
            <li class="nav-item active">
                <a class="nav-link dashboard admin" href="DIRECCIONES NUESTRAS"
                   aria-expanded="true">
                    <img src="https://img.icons8.com/dusk/24/000000/dashboard.png"/>

                    <span class="content">Dashboard</span>
                </a>

            </li>
            <li class="nav-item">
                <a class="nav-link kitchen has-arrow" href="#" aria-expanded="false">
                    <img src="https://img.icons8.com/dusk/24/000000/restaurant.png"/>

                    <span class="content">Kitchen</span>
                </a>

                <ul class="nav collapse" aria-expanded="false">
                    <li class="nav-item">
                        <a class="nav-link menus" href="DIRECCIONES NUESTRAS"
                           aria-expanded="false">

                            Menu Items </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link categories" href="DIRECCIONES NUESTRAS"
                           aria-expanded="false">

                            Categories </a>

                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link sales has-arrow" href="#" aria-expanded="false">
                    <img src="https://img.icons8.com/dusk/24/000000/total-sales.png"/>

                    <span class="content">Sales</span>
                </a>

                <ul class="nav collapse" aria-expanded="false">
                    <li class="nav-item">
                        <a class="nav-link orders" href="DIRECCIONES NUESTRAS"
                           aria-expanded="false">

                            Orders </a>

                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link users has-arrow" href="#" aria-expanded="false">
                    <img src="https://img.icons8.com/bubbles/24/000000/couple-icloud.png"/>

                    <span class="content">Users</span>
                </a>

                <ul class="nav collapse" aria-expanded="false">
                    <li class="nav-item">
                        <a class="nav-link customers" href="DIRECCIONES NUESTRAS"
                           aria-expanded="false">

                            Customers </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link staffs" href="DIRECCIONES NUESTRAS"
                           aria-expanded="false">

                            Staff </a>

                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div> 

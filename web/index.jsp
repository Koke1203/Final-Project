<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Demo of TastyIgniter - Restaurant Online Ordering System</title>
        <base href="http://localhost:8080/Proyecto2/">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" title="pink" type="text/css" href="css/estilo.css">
        <link rel="stylesheet" title="pink" type="text/css" href="css/style.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body class="layout-default page-site-demo ">
        <nav id="site-navbar" class="site-navbar navbar navbar-expand-lg navbar-stick-dark navbar-dark"
             data-navbar="static">
            <div class="container">
                <div class="navbar-left" style="width:17%">
                    <img src="images/tastyigniter-horizontal-logo.png">
                </div>
            </div>
        </nav>
        <section id="site-content" class="site-content pt-2">
            <div id="flash">
            </div>
            <div class="page-content ">
                <div class="container">
                    <div class="w-md-70 py-8">
                        <h1 class="page-title h2">The ultimate TastyIgniter experience</h1>
                        <p class="lead">Learn all that is there to using TastyIgniter and use this restaurant
                            online ordering software to its full potential!</p>
                    </div>
                </div>
                <div class="overflow-hidden bg-light text-center">
                    <div class="container py-6">
                        <div class="row no-gutters">
                            <div class="col-sm-6">
                                <div class="demo-box border-0">
                                    <a class="box-overlay" href="ControladorLogin?accion=menu" target="_blank">
                                        <div class="inner">
                                            <i class="fa fa-external-link opacity-70"></i>
                                            <p class="fw-600 my-4">See what your website will look like</p>
                                        </div>
                                    </a>
                                    <h4 class="pt-5">Storefront</h4>
                                    <div class="m-auto">
                                        <div class="holder">
                                            <img class="" data-aos="slide-right" data-aos-duration="2000"
                                                 src="images/tastyigniter-storefront.png" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="demo-box border-0">
                                    <a class="box-overlay" href="ControladorLogin?accion=login_admin" target="_blank">
                                        <div class="inner">
                                            <i class="fa fa-external-link opacity-70"></i>
                                            <p class="fw-600 my-4">See how you'll accept orders from your customers</p>
                                        </div>
                                    </a>
                                    <h4 class="pt-5">Administrator Panel</h4>
                                    <div class="m-auto">
                                        <div class="holder">
                                            <img class="" data-aos="slide-left" data-aos-duration="2000"
                                                 src="images/tastyigniter-admin.png" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="js/global.js"></script>
    </body>
</html>

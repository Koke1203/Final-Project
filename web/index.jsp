<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="generator" content="TastyIgniter">
        <link rel="alternate" type="application/rss+xml" title="TastyIgniter » Feed" href="https://tastyigniter.com/feed">
        <title>Demo of TastyIgniter - Restaurant Online Ordering System</title>
        <link href="ht1tps://tastyigniter.com/assets/ui/css/global.css?v=20200522" rel="stylesheet">
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body class="layout-default page-site-demo ">
        <nav id="site-navbar" class="site-navbar navbar navbar-expand-lg navbar-stick-dark navbar-dark"
             data-navbar="static">
            <div class="container">
                <div class="navbar-left">
                    <button class="navbar-toggler" type="button">☰</button>
                    <a class="navbar-brand" href="https://tastyigniter.com">
                        <i class="icon-logo icon-ti-text-logo text-primary logo-dark"></i>
                        <i class="icon-logo icon-ti-text-logo text-white logo-light"></i>
                    </a>
                </div>

            </div>
        </nav>
        <section id="site-content" class="site-content pt-6">
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
                                    <a class="box-overlay" href="" target="_blank">
                                        <div class="inner">
                                            <i class="fa fa-external-link opacity-70"></i>
                                            <p class="fw-600 my-4">See what your website will look like</p>
                                        </div>
                                    </a>
                                    <h4 class="pt-5">Storefront</h4>
                                    <div class="m-auto">
                                        <div class="holder">
                                            <img class="" data-aos="slide-right" data-aos-duration="1500"
                                                 src="images/tastyigniter-storefront.png" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="demo-box border-0">
                                    <a class="box-overlay" href="" target="_blank">
                                        <div class="inner">
                                            <i class="fa fa-external-link opacity-70"></i>
                                            <p class="fw-600 my-4">See how you'll accept orders from your customers</p>
                                        </div>
                                    </a>
                                    <h4 class="pt-5">Administrator Panel</h4>
                                    <div class="m-auto">
                                        <div class="holder">
                                            <img class="" data-aos="slide-left" data-aos-duration="1500"
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
        <a href="ControladorLogin?accion=login_show">Redireccion</a>
    </body>
</html>

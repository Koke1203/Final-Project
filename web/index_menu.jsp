<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body style="background-color:#dddddd">
        <%@include file="/presentacion/header.jsp"%>
        <main>
            <div id="page-wrapper">
                <div class="container py-5">
                    <div class="row py-4">
                        <%--Categorias--%>
                        <div class="col-sm-2 d-none d-sm-inline-block">
                            <div class="affix">
                                <div class="collapse d-sm-block">
                                    <h2 class="h5 px-2 d-none d-sm-block">Categorías</h2>
                                    <ul id="ul-categorias" class="nav flex-column m-lg-3">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <%--FIN Categorias--%>

                        <%--INICIO DIV SEARCH(ASAP,SCHEDULER)--%>
                        <div class="col-sm-6" style="background-color: white;">
                            <div class="content">
                                <div id="local-box">
                                    <div class="panel local-search">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-sm-12 mb-3 mb-sm-0">
                                                    <div id="local-timeslot" data-control="timepicker"><div class="dropdown position-static">
                                                            <button class="btn btn-light btn-timepicker btn-block dropdown-toggle text-truncate" type="button" id="orderTimePicker" data-toggle="dropdown" data-boundary="viewport" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fa fa-clock-o"></i>&nbsp;&nbsp;
                                                                <b>ASAP</b>
                                                            </button>

                                                            <div class="dropdown-menu" aria-labelledby="orderTimePicker" style="">
                                                                <button type="button" class="dropdown-item py-2 active" data-timepicker-option="asap"><i class="fa fa-clock-o"></i>&nbsp;&nbsp;ASAP</button>
                                                                <button type="button" class="dropdown-item py-2" data-timepicker-option="later"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Schedule Order</button>

                                                                <form class="dropdown-content px-4 py-3 hide" role="form" data-request="localBox::onSetOrderTime">
                                                                    <input type="hidden" data-timepicker-control="type" value="asap">
                                                                    <div class="form-group">
                                                                        <select class="form-control" data-timepicker-control="date" data-timepicker-label="Select a date" data-timepicker-selected="2020-05-29"><option value="2020-05-29">Fri 29</option><option value="2020-05-30">Sat 30</option><option value="2020-05-31">Sun 31</option><option value="2020-06-01">Mon 01</option><option value="2020-06-02">Tue 02</option><option value="2020-06-03">Wed 03</option></select>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <select class="form-control" data-timepicker-control="time" data-timepicker-label="Select a time" data-timepicker-selected="02:07"><option value="">Select a time</option>
                                                                        </select>
                                                                    </div>
                                                                    <button type="button" class="btn btn-primary text-nowrap" data-timepicker-submit="" data-attach-loading="">
                                                                        Set Delivery Time            </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%--FIN DIV SEARCH--%>

                                    <%--DIV INFO RESTAURANTE--%>
                                    <div class="panel panel-local">
                                        <div class="panel-body">
                                            <div class="row boxes">
                                                <div class="box-one col-sm-6">
                                                    <dl class="no-spacing">
                                                        <dd><h1 class="h3">TastyIgniter</h1></dd>
                                                        <dd>
                                                            <span class="text-muted">345 Lewisham Road, London SE13 7AB, United Kingdom</span>
                                                        </dd>
                                                    </dl>                    </div>
                                                <div class="box-divider d-block d-sm-none"></div>
                                                <div class="box-two col-sm-6">
                                                    <dl class="no-spacing">
                                                        <dt><span class="text-success">We are open</span></dt>

                                                        <dd>
                                                            <span class="fa fa-clock"></span>&nbsp;&nbsp;
                                                            <span>24 hours, 7 days.</span>
                                                        </dd>

                                                        <dd class="text-muted">
                                                            Delivery and pick-up available            </dd>
                                                        <dd class="text-muted">
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--FIN INFO RESTAURANTE--%>

                                <%--MENU REVIEWS INFO--%>
                                <ul id="nav-tabs" class="nav-menus nav nav-tabs">
                                    <a class="nav-item nav-link active" href="https://demo.tastyigniter.com/local/menus">Menu</a>
                                    <a class="nav-item nav-link " href="https://demo.tastyigniter.com/local/reviews">Reviews</a>
                                    <a class="nav-item nav-link " href="https://demo.tastyigniter.com/local/info">Info</a>
                                </ul>

                                <%--Platillos--%>
                                <div class="panel"> 
                                    <%--Platillos--%>
                                    <button>Categoria</button>
                                    <ul>
                                        <li>
                                            <div>
                                                <p>Nombre platillo</p>
                                                <p>Descripcion</p>
                                                <p>Precio</p>
                                                <button id="sumar">Suma</button>
                                                <%--$("#sumar").click(function(){alert("Escuchando")});--%>
                                            </div>
                                        </li>
                                        <>
                                    </ul>
                                    
                                </div>

                                <%--FIN Categoria Platillo--%>
                                
                                <div class="d-flex flex-row">
                                    <%--Descripcion--%>
                                    <div class="menu-content flex-grow-1 mr-3">
                                        <h6 class="menu-name">PUFF-PUFF</h6>
                                        <p class="menu-desc text-muted mb-0">
                                            Traditional Nigerian donut ball, rolled in sugar
                                        </p>
                                    </div>
                                    <%--FIN Descripcion--%>
                                    <%--Precio--%>
                                    <div class="menu-detail align-self-start col-3 text-right p-0">
                                        <span class="menu-price pr-sm-3">
                                            <b>£4.99</b>
                                        </span>
                                    </div>
                                    <%--FIN Precio--%>
                                </div>
                            </div>
                        </div>
                        <%--FIN Platillos--%>


                    </div>
                </div>
            </div>
        </main>
        <script>
            function loaded() {
            listarCategorias();
            }
            $(loaded);
            function listarCategorias() {
                $.ajax({type: "GET", url: "api/categorias/listar", contentType: "application/json"})
                .then((categorias) = > {
                    listCat(categorias);
                    console.log(categorias);
                }, (error) = > {
                alert(errorMessage(error.status));
                });
            }

            function listCat(categorias) {
            var listado = $("#ul-categorias");
                    categorias.forEach((c) = > {
                    rowCategoria(listado, c);
                    });
            }

            function rowCategoria(listado, categoria) {
            var li = $("<li class='nav-item organge-link'>" + categoria.descripcion + "</li>");
                    /*li.on("click",()=>{
                     listarPlatillosXCategoria(categoria.codigo);
                     });*/
                        
                    listado.append(li);
            }
            
            
            function listarPlatillos(codigo_categoria){
                categoria{
                    codigo : codigo_categoria;
                }
                $.ajax({type: "POST", data: JSON.stringify((categoria), url: "api/platillos/listar", contentType: "application/json"})
                .then((platillos) = > {
                    listPlatillo(platillos);
                    console.log(platillos);
                }, (error) = > {
                    alert(errorMessage(error.status));
                });
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

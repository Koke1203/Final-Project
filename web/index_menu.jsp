<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@ include file="/presentacion/head.jsp" %>
    </head>
    <body>
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
                        <div class="div-platillo col-sm-6" style="background-color: white;">
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
                                </ul>

                                <%--Platillos--%>
                                <div class="panel">
                                    <ul class="ul-itemsMenu" id="ul-itemsMenu">
                                        <%-- Aquí se muestran los platillos por categoria --%>
                                    </ul>
                                </div>
                                <%--FIN Platillos--%>


                            </div>
                        </div>

                        <%--PEDIDO--%>
                        <div class="div-pedido col-sm-4">
                            <div class="affix-cart d-none d-sm-block affix-top" data-control="cart-box" data-load-item-handler="cartBox::onLoadItemPopup" data-update-item-handler="cartBox::onUpdateCart" data-apply-coupon-handler="cartBox::onApplyCoupon" data-change-order-type-handler="cartBox::onChangeOrderType" data-remove-item-handler="cartBox::onRemoveItem" data-remove-condition-handler="cartBox::onRemoveCondition" style="width: 350px;">
                                <div id="cart-box" class="module-box">
                                    <div class="panel panel-cart">
                                        <div class="panel-body">
                                            <div id="cart-control"><div class="btn-group btn-group-toggle w-100 text-center order-type" data-toggle="buttons">
                                                    <label class="btn btn-light">
                                                        <input type="radio" name="order_type" data-cart-toggle="order-type" value="delivery">&nbsp;&nbsp;
                                                        <strong>Delivery</strong>
                                                    </label>
                                                    <label class="btn btn-light active">
                                                        <input type="radio" name="order_type" data-cart-toggle="order-type" value="collection" checked="checked">&nbsp;&nbsp;
                                                        <strong>Pick-up</strong>
                                                    </label>
                                                </div>
                                            </div>

                                            <div id="cart-items"></div>
                                        </div>
                                        <ul id="ul-itemsPedido"> </ul>
                                        <div id="cart-coupon"></div>

                                        <div id="cart-totals"></div>

                                        <div id="cart-buttons" class="mt-3"><a href="ControladorCompra?accion=checkout" class="checkout-btn btn-block btn-lg">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="cart-mobile-buttons" class="fixed-bottom d-block d-sm-none" style="">
                            <a class="btn btn-primary btn-block btn-lg radius-none cart-toggle text-nowrap" href="https://demo.tastyigniter.com/cart">
                                My Order:
                                <span id="cart-total" class="font-weight-bold">£106.99</span>
                            </a>
                        </div>
                    </div>
                    <!--FIN PEDIDO-->
                </div>
            </div>
        </main>



        <div class="modal fade" id="opciones-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div id="header-modal-platillo">

                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="opciones-menu" id="opciones-menu">

                            <%--Detalles Adicionales--%>
                            <%--<div class="option-details">
                                <h5 class="mb-0">
                                    Mode of cooking<span class="small pull-right text-muted">Required</span>
                                </h5>
                            </div>

                            <div class="option-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="menuOptionRadio118" class="custom-control-input" name="menu_options[1][option_values][]" value="118" data-option-price="10">
                                    <label class="custom-control-label w-100" for="menuOptionRadio118">
                                        Steamed            <span class="pull-right">£10.00</span>
                                    </label>
                                </div>

                                <div class="custom-control custom-radio">
                                    <input type="radio" id="menuOptionRadio119" class="custom-control-input" name="menu_options[1][option_values][]" value="119" data-option-price="12" checked="checked">
                                    <label class="custom-control-label w-100" for="menuOptionRadio119">
                                        Boiled            <span class="pull-right">£12.00</span>
                                    </label>
                                </div>
                            </div>--%>

                            <%--Fin Adicionales--%>


                        </div>
                        <div>
                            <textarea name="comment" class="form-control" rows="2" placeholder="Add Comment"></textarea>
                        </div>
                    </div>
                    <%--BUTTONS - INPUT CANTIDAD--%>
                    <div class="modal-footer">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button id="btnDecrementar" type="button" class="btn btn-light"><i class='fa fa-minus'></i></button>
                            </div>
                            <input class="form-control text-center" id="cantidad-platillos" type="number" name="cantidad-platillosFld" min="0" value="1">
                            <div class="input-group-append">
                                <button id="btnIncrementar" type="button" class="btn btn-light"><i class='fa fa-plus'></i></button>
                            </div>
                            &nbsp;&nbsp;<button type="button" class="btn btn-primary">ADD TO ORDER</button>
                        </div>
                    </div>
                    <%--FIN BUTTONS - INPUT CANTIDAD--%>
                </div>
            </div>
        </div>


        <script>
            var contador = 0;

            function loaded() {
                AumentaDisminuye_Cantidad();
                listarCategorias();
                infoCarrito();
            }
            $(loaded);

            function listarCategorias() {
                $.ajax({type: "GET", url: "api/categorias/listar", contentType: "application/json"})
                        .then((categorias) => {
                            //console.log(categorias);
                            listCat(categorias);
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function listCat(categorias) {
                var listado = $("#ul-categorias");
                categorias.forEach((c) => {
                    rowCategoria(listado, c);
                });
            }

            function rowCategoria(listado, categoria) {
                var li = $("<li class='nav-item organge-link'><button class='btn'>" + categoria.descripcion + "</button></li>");
                li.on("click", () => {
                    listarPlatillosXCategoria(categoria);
                });
                listado.append(li);
            }

            function listarPlatillosXCategoria(cat) {
                categoria = {codigo: cat.codigo};
                $.ajax({type: "POST", data: JSON.stringify(categoria), url: "api/platillos/listar", contentType: "application/json"})
                        .then((platillos) => {
                            listarPlatillos(platillos, cat);
                            //console.log(platillos);
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function listarPlatillos(platillos, cat) {
                //console.log(platillos);
                //console.log(cat);
                var listado = $("#ul-itemsMenu");
                listado.html("");
                var h3 = $("<h3>" + cat.descripcion + "</h3>");
                listado.append(h3);
                platillos.forEach((p) => {
                    rowPlatillo(listado, p);
                });
            }

            function rowPlatillo(listado, platillo) {
                var li = $("<li />");
                li.addClass("list-item");
                li.html("<div class='row'>" +
                        "<div class='col-sm'>" +
                        "<h6 class='modal-title'>" + platillo.nombre + "</h6>" +
                        "</div>" +
                        "<div class='col-md-3'>" +
                        "<span><b>" + "£" + platillo.precio + "</b></span>" +
                        "</div>" +
                        "<div class='col-md-2'>" +
                        "<button id='addMenuItemBtn' type='button' class='btn btn-light btn-sm' data-toggle='modal' data-target='#opciones-modal'>" +
                        "<i class='fa fa-plus'></i>" +
                        "</button>" +
                        "</div>" +
                        "</div>" +
                        "<div class='row'>" +
                        "<p class='text-muted col-sm'>" + platillo.descripcion + "</p>" +
                        "</div>");
                li.find("#addMenuItemBtn").on("click", () => {
                    agregarHeaderModal(platillo);
                    //agregarCuerpoModal(platillo);
                });
                listado.append(li);
            }

            function agregarHeaderModal(platillo) {

                var modal_header = $("#header-modal-platillo");
                modal_header.html("");
                var div = $("<div />");
                div.html(
                        "<div class='row'>" +
                        "<div class='col-sm'>" +
                        "<h6>" + platillo.nombre + "</h6>" +
                        "</div>" +
                        "</div>" +
                        "<div class='row'>" +
                        "<p class='text-muted col-sm'>" + platillo.descripcion + "</p>" +
                        "</div>"
                        );
                modal_header.append(div);
            }


            /*function rowPlatillo(listado, platillo) {
             var li = $("<li class='nav-item organge-link'/>");
             li.html("<div>" +
             "<h5>" + platillo.nombre + "</h5>" +
             "<p>" + platillo.descripcion + "</p>" +
             "<p>" + platillo.precio + "</p>" +
             "<input type='button' id='addPlatillo' value='Add'>" +
             "</div>");
             li.find("#addPlatillo").on("click", () => {
             //agregarPlatilloCarrito(platillo)
             });
             listado.append(li);
             }*/

            function agregarPlatilloCarrito(platillo) {
                $.ajax({type: "POST", data: JSON.stringify(platillo), url: "api/carrito/agregarPlatillo", contentType: "application/json"})
                        .then((carrito_platillos) => {
                            listCarrito(carrito_platillos);
                            contador++;
                            infoCarrito(); //actualizo la info
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function listCarrito(carrito_platillos) {
                var lista_pedido = $("#ul-itemsPedido");
                lista_pedido.html("");
                carrito_platillos.forEach((p) => {
                    rowCarrito(lista_pedido, p);
                });
                //agrego los subtotales
                var div_montos = $("#cart-totals");
                var monto = 0;
                carrito_platillos.forEach((p) => {
                    monto = monto + p.precio_total;
                });
                div_montos.html("<p class='p-totales'>Sub Total: <span class='price pull-right'>£" + monto.toFixed(2) + "</span><p>" +
                        "<p class='p-totales'>Delivery: <span class='price pull-right'>Free</span><p>" +
                        "<p class='p-totales'>Order Total: <span class='price pull-right'>£" + monto.toFixed(2) + "</span><p>");
            }

            function rowCarrito(lista_pedido, carrito) {
                var li = $("<li class='li-pedido' />");
                li.html("<p><button class='cart-btn btn btn-light btn-sm text-muted' id='quitar_platillo'>-</button>" + " <b>" +
                        carrito.cantidad + " x </b>" + carrito.platillo.nombre + "<span class='price pull-right'> £" + carrito.precio_total + "</span></p>");
                li.find("#quitar_platillo").on("click", () => {
                    sacarPlatilloCarrito(carrito.platillo);
                });
                lista_pedido.append(li);
            }

            function sacarPlatilloCarrito(platillo) {
                $.ajax({type: "POST", data: JSON.stringify(platillo), url: "api/carrito/sacarPlatillo", contentType: "application/json"})
                        .then((carrito_platillos) => {
                            listCarrito(carrito_platillos);
                            contador--;
                            infoCarrito(); //actualizo la info
                        }, (error) => {
                            alert(errorMessage(error.status));
                        });
            }

            function infoCarrito() {
                var div_info = $("#cart-items");
                if (contador > 0) {
                    div_info.html("<div class='panel-body'><p class='text-center'>Your order</p");
                } else {
                    div_info.html("<div class='panel-body'><p class='text-center'>Add menu items to your cart</p");
                    var div_total = $("#cart-totals");
                    div_total.html("");
                }
            }

            //Botones para aumentar o disminuir cantidad (Modal)
            function AumentaDisminuye_Cantidad() {
                var contador = $("#cantidad-platillos").val();
                $("#btnIncrementar").on("click", () => {
                    contador++;
                    $("#cantidad-platillos").val(contador);
                });
                $("#btnDecrementar").on("click", () => {
                    contador - 1 >= 1 ? --contador : 1;
                    $("#cantidad-platillos").val(contador);
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

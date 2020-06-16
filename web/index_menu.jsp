<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@ include file="/presentacion/head.jsp"%>
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
                                    <div class="div-itemsMenu" id="div-itemsMenu">
                                        <%-- Aquí se muestran los platillos por categoria --%>
                                    </div>
                                </div>
                                <%--FIN Platillos--%>


                            </div>
                        </div>
                        
                        <%--PEDIDO--%>
                        <div class="div-pedido col-sm-4">
                            <div class="affix-cart d-none d-sm-block affix-top" data-control="cart-box" data-load-item-handler="cartBox::onLoadItemPopup" data-update-item-handler="cartBox::onUpdateCart" data-apply-coupon-handler="cartBox::onApplyCoupon" data-change-order-type-handler="cartBox::onChangeOrderType" data-remove-item-handler="cartBox::onRemoveItem" data-remove-condition-handler="cartBox::onRemoveCondition" style="width: 350px;">
                                <div id="cart-box" class="module-box">
                                    <form action="ControladorCompra">
                                        <div class="panel panel-cart">
                                            <div class="panel-body">
                                                <div id="cart-control">
                                                    <div class="btn-group btn-group-toggle w-100 text-center order-type" data-toggle="buttons">
                                                        <label class="btn btn-light">
                                                            <input type="radio" name="order_type" id="order_type" data-cart-toggle="order-type" value="delivery">&nbsp;&nbsp;
                                                            <strong>Delivery</strong>
                                                        </label>
                                                        <label class="btn btn-light active">
                                                            <input type="radio" name="order_type" id="order_type" data-cart-toggle="order-type" value="pick-up" checked="checked">&nbsp;&nbsp;
                                                            <strong>Pick-up</strong>
                                                        </label>
                                                    </div>
                                                    
                                                    <div class="pedido car-items">
                                                        <ul id="ul-itemsPedido" class="pedido"></ul>
                                                    </div>
                                                    
                                                </div>
                                                <br>
                                                <div id="cart-coupon"></div>
                                                
                                                <div class="division-total"></div>
                                                
                                                <div id="cart-totals" class="pedido"></div>

                                                <div id="cart-buttons" class="mt-3"><button type="button" id="Checkout" name="accion" value="Checkout" class="checkout-btn btn-block btn-lg">Checkout</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>         
                    </div>
                    <!--FIN PEDIDO-->
                </div>
            </div>
        </main>
        
        <!--MODAL PARA AGREGAR PLATILLOS-->
        <div class="modal fade" id="opciones-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div id="header-modal-platillo">
                        </div>
                        <button id="cancelar-modal" type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="opciones-menu" id="opciones-menu">
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
                            &nbsp;&nbsp;<button id="add_order" type="button" class="btn btn-primary">ADD TO ORDER</button>
                        </div>
                    </div>
                    <%--FIN BUTTONS - INPUT CANTIDAD--%>
                </div>
            </div>
        </div>                

        <script>
            var contador = 0;
            
            var platillo_seleccionado;
            var opcion_radio = new Array();
            var adicional_radio;
            var adicional_check;
            var opcion_check = new Array();
            
            function loaded() {
                AumentaDisminuye_Cantidad();
                listarCategorias();
                agregarOrdenPlatillo();
                limpiarRegistrosModal();
                listarCarritoInicio();
                validaCheckout();
                listarTotales(new Array());
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
                }, (error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            function listarPlatillos(platillos, cat) {
                var listado = $("#div-itemsMenu");
                listado.html("");
                var h3 = $("<h3>" + cat.descripcion + "</h3>");
                listado.append(h3);
                platillos.forEach((p) => {
                    rowPlatillo(listado, p);
                });
            }
            
            function rowPlatillo(listado, platillo) {
                var div = $("<div />");
                div.addClass("list-item");
                div.html("<div class='row'>" +
                        "<div class='col-sm'>" +
                        "<h6 class='modal-title'>" + platillo.nombre + "</h6>" +
                        "</div>" +
                        "<div class='col-md-3'>" +
                        "<span><b>" + "£" + platillo.precio + "</b></span>" +
                        "</div>" +
                        "<div class='col-md-2'>" +
                        "<button id='addMenuItemBtn' type='button' class='btn btn-light btn-sm' data-target='#opciones-modal'>" +
                        "<i class='fa fa-plus'></i>" +
                        "</button>" +
                        "</div>" +
                        "</div>" +
                        "<div class='row'>" +
                        "<p class='text-muted col-sm'>" + platillo.descripcion + "</p>" +
                        "</div>");
                div.find("#addMenuItemBtn").on("click", () => {
                    platillo_seleccionado = platillo;
                    $.ajax({type: "POST", data: JSON.stringify(platillo), url: "api/platillo/getAdicionales", contentType: "application/json"})
                            .then((adicionales) => {
                                //console.log(adicionales);
                                if (adicionales.length === 0) {/*Se agrega directamente al carrito de compras*/
                                    agregarPlatilloCarrito(platillo,null,null,null,null);
                                    infoCarrito();
                                } else {
                                    agregarHeaderModal(platillo);
                                    agregarCuerpoModal(adicionales);
                                    $("#opciones-modal").modal();
                                }
                            }, (error) => {
                                alert(errorMessage(error.status));
                            });
                });
                listado.append(div);
            }
            
            function agregarHeaderModal(platillo) {
                //console.log(platillo);
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

            function agregarCuerpoModal(adicionales) {
                var listado = $("#opciones-menu");
                listado.html("");
                adicionales.forEach((a) => {
                    rowAdicional(listado, a);
                });
            }
            
            function rowAdicional(listado, adicional) {
                //Titulo Adicional
                var div_general = $("<div/>");
                var div_adicional = $("<div class='titulo-opcion'>" +
                        "<h5 class='mb-0'>" +
                        adicional.descripcion +
                        "<span class='small pull-right text-muted'>Required</span>" +
                        "</h5></div>");
                div_general.append(div_adicional);
                listado.append(div_general);
                $.ajax({type: "POST", data: JSON.stringify(adicional), url: "api/platillo/getOpciones", contentType: "application/json"})
                .then((opciones) => {
                    if (adicional.multiple) {
                        listarOpcionesCheckBox(opciones, div_general,adicional);
                    } else {
                        listarOpcionesRadioButton(opciones, div_general, adicional);
                    }
                }, (error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            function listarOpcionesRadioButton(opciones, div, adicional) {
                var listado = div;
                opciones.forEach((opc) => {
                    var rowOpc = $("<div />");
                    rowOpc.addClass("option-group");
                    rowOpc.html("<div class='custom-control custom-radio'>" +
                            "<input type='radio' id='optionRadio" + opc.codigo_opcion + "' class='custom-control-input' name='" + adicional.descripcion + "' checked>" +
                            "<label class='custom-control-label' for='optionRadio" + opc.codigo_opcion + "'>" + opc.descripcion +
                            "<span class='pull-right'>" + "£" + opc.precio + "</span>" +
                            "</label>" +
                            "</div>");
                    
                    var boton = "#optionRadio"+opc.codigo_opcion;
                    
                    //Por si el usuario esta de acuerdo con la selección y no presiona ningun radio
                    //no da problemas porque al final de cuentas siempre agarramos el ultimo
                    opcion_radio.push(opc);
                    adicional_radio = adicional;
                    //
                    
                    rowOpc.find(boton).on("click", () => {
                        opcion_radio.push(opc);
                        adicional_radio = adicional;
                    });
                    
                    listado.append(rowOpc);
                });
            }
            
            function listarOpcionesCheckBox(opciones, div, adicional) {
                var listado = div;
                opciones.forEach((opc) => {
                    var rowOpc = $("<div />");
                    rowOpc.html("<div class='custom-control custom-checkbox'>" +
                            "<input type='checkbox' class='custom-control-input' id='check" + opc.descripcion + "'>" +
                            "<label class='custom-control-label' for='check" + opc.descripcion + "'>" + opc.descripcion + "</label>" +
                            "<span class='pull-right'>" + "£" + opc.precio + "</span>" +
                            "</div>");
                    listado.append(rowOpc);
                    var boton = "#check" + opc.descripcion ;
                    rowOpc.find(boton).on("click", () => {
                        //averiguo si el check ya estaba en el array
                        var elimina = false;
                        opcion_check.forEach((p) => {
                            if(p.codigo_opcion == opc.codigo_opcion){
                                elimina=true;
                            }
                        });
                        if(elimina==true){
                            opcion_check = opcion_check.filter(o=>o.codigo_opcion!=opc.codigo_opcion);;
                        }else{
                            opcion_check.push(opc);
                            adicional_check = adicional;
                        }
                    });
                });
            }
            
            function agregarOrdenPlatillo(){
                $("#add_order").on("click",()=>{
                    var index = (opcion_radio.length)-1;
                    agregarPlatilloCarrito(platillo_seleccionado,adicional_radio,adicional_check,opcion_radio,opcion_check);                    
                    //limpiamos registros
                    platillo_seleccionado = null;
                    adicional_radio = null;
                    adicional_check = null;
                    opcion_radio = new Array();
                    opcion_check = new Array();
                    $("#cantidad-platillos").val(1);
                    $('#opciones-modal').modal('hide');
                });
            }
            
            function agregarPlatilloCarrito(platillo,adicional_radio,adicional_check,opcion_radio,opcion_check) {
                if(adicional_radio==null && adicional_check==null && opcion_radio==null && opcion_check==null){
                    var parametro = {platillo: platillo, cantidad: 1, precio_total:platillo.precio, opcion_radio: new Array(), opcion_check: new Array()};
                }else{
                    var cantidad_platillo = $("#cantidad-platillos").val();
                    var parametro = {platillo: platillo, adicional_radio: adicional_radio,adicional_check: adicional_check,opcion_radio: opcion_radio,opcion_check: opcion_check, cantidad:cantidad_platillo, precio_total:0};
                 }
                $.ajax({type: "POST", data: JSON.stringify(parametro), url: "api/carrito/agregarPlatillo", contentType: "application/json"})
                .then((carrito_platillos) => {
                    listCarrito(carrito_platillos);
                    contador++;
                    infoCarrito(); //actualizo la info
                }, (error) => {
                    alert(errorMessage(error.status));
                });
            }
            
            function listarCarritoInicio(){ //cuando se refresque la pagina se carga el carrito 
                $.ajax({type: "GET", url: "api/carrito/listarCarrito", contentType: "application/json"})
                .then((carrito_platillos) => {
                    if(carrito_platillos.length>0){
                        listCarrito(carrito_platillos);
                        infoCarrito(); //actualizo la info
                    }
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
                listarTotales(carrito_platillos);
            }
            
            function listarTotales(carrito_platillos){
                //agrego los subtotales
                var div_montos = $("#cart-totals");
                if(carrito_platillos.length<=0){
                    div_montos.html("<p class='p-totales'>Sub Total: <span class='price pull-right'>£0</span><p>" +
                            "<p class='p-totales'>Delivery: <span class='price pull-right'>Free</span><p>" +
                            "<p class='p-totales'>Order Total: <span class='price pull-right'>£0</span><p>");
                }else{
                    var monto = 0;
                    carrito_platillos.forEach((p) => {
                        monto = monto + p.precio_total;
                    });
                    div_montos.html("<p class='p-totales'>Sub Total: <span class='price pull-right'>£" + monto.toFixed(2) + "</span><p>" +
                            "<p class='p-totales'>Delivery: <span class='price pull-right'>Free</span><p>" +
                            "<p class='p-totales'>Order Total: <span class='price pull-right'>£" + monto.toFixed(2) + "</span><p>");
                }
            }
            
            function rowCarrito(lista_pedido, carrito) {
                var li = $("<li class='li-pedido' />");
                li.html("<p><button type='button' class='cart-btn btn btn-light btn-sm text-muted' id='quitar_platillo'>-</button>" + " <b>" +
                        carrito.cantidad + " x </b>" + carrito.platillo.nombre + "<span class='price pull-right'> £" + carrito.precio_total.toFixed(2) + "</span></p>");
                
                if(carrito.adicional_radio!=null && carrito.opcion_radio!=null){
                    var index = (carrito.opcion_radio.length)-1;
                    li.append("<ul class='pedido-item primer-item list-unstyled small'> <li class='text-muted'><b>"+carrito.adicional_radio.descripcion+"</b></li><li>"+carrito.opcion_radio[index].descripcion+
                            " &nbsp; (£"+carrito.opcion_radio[index].precio+")</li> </ul>");
                }
                
                if(carrito.adicional_check!=null && carrito.opcion_check!=null){
                    li.append("<ul class='pedido-item list-unstyled small'><li class='text-muted'><b>"+carrito.adicional_check.descripcion+"</b></li><li>");
                    carrito.opcion_check.forEach((e)=>{
                        li.append("<li class='pedido-item list-unstyled small'>"+e.descripcion+" &nbsp; (£"+e.precio+")</li> </ul>");
                    }); 
                }
                
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
                    //var div_total = $("#cart-totals");
                    //div_total.html("");
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
            
            function limpiarRegistrosModal(){
                $("#cancelar-modal").on("click",()=>{
                    platillo_seleccionado = null;
                    adicional_radio = null;
                    adicional_check = null;
                    opcion_radio = new Array();
                    opcion_check = new Array();
                    $("#cantidad-platillos").val(1);
                });
            }
            
            function validaCheckout(){
                $("#Checkout").on("click",()=>{
                    $.ajax({type: "GET", url: "api/carrito/listarCarrito", contentType: "application/json"})
                    .then((carrito_platillos) => {
                        if(carrito_platillos.length==0){
                            swal("Carrito vacío");
                        }else{
                            var tipo = $('input:radio[name=order_type]:checked').val();
                            if(tipo=="delivery"){
                                var orden_factura = {tipo_entrega: 0,total_pagar:0.0};
                            }else{
                               var orden_factura = {tipo_entrega: 1, total_pagar:0.0}; 
                            }
                            $.ajax({type: "POST",data: JSON.stringify(orden_factura), url: "api/tipo_orden/agregarSesion", contentType: "application/json"})
                            .then(() => {
                                //redireccionar a la pantalla compra
                                window.location.href = "http://localhost:8080/Proyecto2/ControladorCompra?accion=comprar";
                            }, (error) => {
                                alert(errorMessage(error.status));
                            });
                            contador = 0;
                            platillo_seleccionado = null;
                            opcion_radio = new Array();
                            adicional_radio = null;
                            adicional_check = null;
                            opcion_check = new Array();
                        }
                    }, (error) => {
                        alert(errorMessage(error.status));
                    });
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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


                        <%--Platillos--%>
                        <div class="col-sm-6">
                            <%--Categoria Platillo--%>
                            <div class="d-block d-sm-none">
                                <div class="panel-body">
                                    <div class="d-block d-sm-none">
                                        <button class="btn btn-light btn-block px-3 text-left">
                                            <i class="fa fa-bars"></i>&nbsp;&nbsp;Appetizer
                                        </button>
                                    </div>
                                </div>
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
                $.ajax({type: "POST", url: "api/categorias/listar", contentType: "application/json"})
                        .then((categorias) => {
                            listCat(categorias);
                            console.log(categorias);
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
                var li = $("<li class='nav-item organge-link'>" + categoria.descripcion + "</li>");

                /*li.on("click",()=>{
                 listarPlatillosXCategoria(categoria.codigo);
                 });*/

                listado.append(li);
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

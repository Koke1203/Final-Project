<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Address Book</title>
        <%@include file="/presentacion/head.jsp"%>
    </head>
    <body>
        <%@include file="/presentacion/header.jsp"%>
        
        <main role="main">
            <div id="page-wrapper">
                <div class="container">
                    <div class="row py-5">
                        <div class="col-sm-3">
                            <div class="nav flex-column">
                                <a href="ControladorLogin?accion=mi_cuenta" class="nav-item nav-link text-reset"><span class="fa fa-user mr-3"></span>My Account</a>
                                <a href="ControladorCompra?accion=direcciones" class="nav-item nav-link active font-weight-bold"><span class="fa fa-book mr-3"></span>Address Book</a>
                                <a href="ControladorLogin?accion=mi_cuenta" class="nav-item nav-link text-reset"><span class="fa fa-list-alt mr-3"></span>Recent Orders</a>
                            </div>
                        </div>

                        <div class="col-sm-9">
                            <div class="card">
                                <div class="card-body">
                                    <div id="address-book">
                                        <form action="ControladorCompra">
                                            <input type="hidden" name="address[address_id]" value="">
                                            <div class="form-group">
                                                <label>Address 1</label>
                                                <input type="text" name="address[address_1]" class="form-control" value="">
                                            </div>

                                            <div class="form-group">
                                                <label>Address 2</label>
                                                <input type="text" name="address[address_2]" class="form-control" value="">
                                            </div>

                                            <div class="row">
                                                <div class="col-xs-12 col-sm-4 col-md-4">
                                                    <div class="form-group">
                                                        <label>City</label>
                                                        <input type="text" class="form-control" name="address[city]" value="" placeholder="City">
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4">
                                                    <div class="form-group">
                                                        <label>State</label>
                                                        <input type="text" class="form-control" value="" name="address[state]" placeholder="State">
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-4 col-md-4">
                                                    <div class="form-group">
                                                        <label>Postcode</label>
                                                        <input type="text" class="form-control" name="address[postcode]" value="" placeholder="Postcode">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label>Country</label>
                                                <select name="address[country]" class="form-control">
                                                    <option value="1">Costa Rica</option>
                                                </select>
                                            </div>

                                            <div class="d-flex justify-content-between">
                                                <button type="submit" name="accion" value="agregar_direccion" class="btn btn-primary">Update Address</button>
                                            </div>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

    </body>
</html>

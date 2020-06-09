<%-- 
    Document   : list_dish
    Created on : 08-jun-2020, 19:46:53
    Author     : jorge
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/presentacion/admin/head_admin.jsp" %>
    </head>
    <body>
        <%@include file="/presentacion/admin/header_admin.jsp" %>
        <div class="page-wrapper">
            <div class="row-fluid">

                <div id="toolbar" class="toolbar btn-toolbar ">
                    <div class="toolbar-action">
                        <div class="progress-indicator-container">
                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                    data-target="#exampleModalCenter">
                                Add Dish
                            </button>
                        </div>
                    </div>
                </div>
                <!--*******************************TABLA ***********************************-->

                <div class="list-form table-responsive">
                    <table id="orders-table" class="table table-striped">
                        <thead>
                            <tr>
                                <th class="list-action">NAME DISH</th>
                                <th class="list-action">PRICE</th>
                                <th class="list-action">DESCRIPTION</th>
                                <th class="list-action">ACTIONS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="list-col-index-2 list-col-name-order-id list-col-type-text">PUFF-PUFF</td>
                                <td class="list-col-index-3 list-col-name-full-name list-col-type-text">4.99</td>
                                <td class="list-col-index-4 list-col-name-order-type-name list-col-type-text">Traditional
                                    Nigerian donut ball, rolled in sugar</td>
                                <td class="list-col-index-5 list-col-name-order-type-name list-col-type-text">
                                    <a href="direccion nuestra" data-toggle="modal" data-target="#exampleModalCenter" >
                                        <img src="https://img.icons8.com/fluent/25/000000/edit.png"/>
                                    </a>
                                    <a href="direccion nuestra">
                                        <img src="https://img.icons8.com/fluent/25/000000/delete-sign.png"/>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!--***************************************MODAL DEL ADD*********************************************-->
                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Add Dish</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Name</label>
                                        <input type="text" class="form-control" id="name_dish" name="name_dish"
                                               aria-describedby="emailHelp" placeholder="Name Dish">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Price</label>
                                        <input type="text" class="form-control" id="price" name="price" placeholder="Price">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Description</label>
                                        <input type="text" class="form-control" id="description" name="description"
                                               placeholder="Description">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@include file="/presentacion/admin/animation_admin.jsp" %>
    </body>
</html>

<%@page import="Logica.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/presentacion/admin/head_admin.jsp" %>
    </head>
    <body class="page">
        <%@include file="/presentacion/admin/header_admin.jsp" %>
        <%List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaCustomer");%>
        <div class="page-wrapper">
            <div class="row-fluid">
                <div class="list-form table-responsive">
                    <table id="orders-table" class="table table-striped">
                        <thead>
                            <tr>
                                <th class="list-action">EMAIL</th>
                                <th class="list-action">NAME</th>
                                <th class="list-action">LAST NAME</th>
                                <th class="list-action">TELEPHONE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Usuario usu : usuarios) {%>
                            <tr>
                                <td class="list-col-index-2 list-col-name-order-id list-col-type-text"><%=usu.getCorreo()%></td>
                                <td class="list-col-index-3 list-col-name-full-name list-col-type-text"><%= usu.getNombre()%></td>
                                <td class="list-col-index-4 list-col-name-order-type-name list-col-type-text"><%= usu.getApellido()%></td>
                                <td class="list-col-index-5 list-col-name-order-time list-col-type-time"><%= usu.getTelefono()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="/presentacion/admin/animation_admin.jsp" %>
    </body>
</html>

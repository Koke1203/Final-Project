<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/presentacion/admin/head_admin.jsp" %>
    </head>
    <body class="page ">
        <%@include file="/presentacion/admin/header_admin.jsp" %>
        <div class="page-wrapper">
            <div class="row-fluid">
                <form action="ControladorLogin">
                    <div id="toolbar" class="toolbar btn-toolbar ">
                        <div class="toolbar-action">
                            <div class="progress-indicator-container">                              
                                <button type="submit" value="update_admin" name="accion" class="btn-primary">
                                    <img src="https://img.icons8.com/dusk/44/000000/save-all.png"/>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="form-widget">
                        <div id="form-outside-tabs" class="">
                            <div class="form-fields">
                                <div class="form-group text-field span-left " data-field-name="staff_name"
                                     id="form-field-staff-staff-name-group"><label for="form-field-staff-staff-name"
                                                                              class="control-label">
                                        Name </label>


                                    <input type="text" name="first_name" id="form-field-staff-staff-name"
                                           value=<%=user.getNombre()%> placeholder="" class="form-control" autocomplete="off"
                                           maxlength="255" /></div>

                                <div class="form-group password-field span-left " data-field-name="user[password]"
                                     id="form-field-staff-user-password-group"><label for="form-field-staff-user-password"
                                                                                 class="control-label">
                                        Password </label>


                                    <input type="password" name="new_password" id="form-field-staff-user-password"
                                           value=<%=user.getContrasenia()%> class="form-control" autocomplete="off" maxlength="255" /></div>

                                <div class="form-group text-field span-left " data-field-name="user[username]"
                                     id="form-field-staff-user-username-group"><label for="form-field-staff-user-username"
                                                                                 class="control-label">
                                        Last Name </label>


                                    <input type="text" name="last_name" id="form-field-staff-user-username"
                                           value=<%=user.getApellido()%> placeholder="" class="form-control" autocomplete="off"
                                           maxlength="255" /></div>



                                <div class="form-group password-field span-left " data-field-name="user[password]"
                                     id="form-field-staff-user-password-group"><label for="form-field-staff-user-password"
                                                                                 class="control-label">
                                        Telephone </label>


                                    <input type="text" name="telephone" id="form-field-staff-user-password"
                                           value=<%=user.getTelefono()%> class="form-control" autocomplete="off" maxlength="255" /></div>

                                <div class="form-group text-field span-right " data-field-name="staff_email"
                                     id="form-field-staff-staff-email-group"><label for="form-field-staff-staff-email"
                                                                               class="control-label">
                                    </label>


                                    <input type="text" name="correo" id="form-field-staff-staff-email"
                                           value=<%=user.getCorreo()%>  class="form-control" autocomplete="off"
                                           maxlength="255" hidden/></div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="/presentacion/admin/animation_admin.jsp" %>
    </body>
</html>

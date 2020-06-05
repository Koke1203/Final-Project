package Presentacion;

import Logica.Usuario;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ModelDAO.UsuarioDAO;
import java.util.Iterator;

public class ControladorLogin extends HttpServlet {

    String menu = "index_menu.jsp";
    String login_admin ="login_admin.jsp";
    String dashboard ="dashboard.jsp";
    String login = "login.jsp";
    String registro = "registrar_cliente.jsp";
    String mi_cuenta = "presentacion/mi_cuenta.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");
        HttpSession session = request.getSession(true);
        UsuarioDAO user_dao = new UsuarioDAO();

        if (action.equalsIgnoreCase("Login")) {
            List<Usuario> list = user_dao.listarUsuarios();
            Iterator<Usuario> iter = list.iterator();
            Usuario per = null;
            boolean es_falso = false;
            
            while (iter.hasNext()) {
                per = iter.next();
                if (request.getParameter("email").equals(per.getCorreo()) && request.getParameter("password").equals(per.getContrasenia())) {
                    acceso = mi_cuenta;
                    es_falso = true;
                    session.setAttribute("usuario", per);
                    break;
                } else {
                    es_falso = false;
                }
            }
            
            if (es_falso == false) {
                //Por medio de Maps, setear errores a la vista
                Map<String, String> errores = new HashMap<>();
                request.setAttribute("errores", errores);
                errores.put("email", "Correo o clave incorrectos");
                errores.put("password", "Correo o clave incorrectos");
                acceso = login;
            }
        } else if (action.equalsIgnoreCase("registro_show")) {
            acceso = registro;
        } else if (action.equalsIgnoreCase("login_show")) {
            acceso = login;
        } else if (action.equalsIgnoreCase("logout")) {
            session.removeAttribute("usuario");
            acceso = login;
        } else if (action.equalsIgnoreCase("menu")) {
            acceso = menu;
        } else if (action.equalsIgnoreCase("login_admin")) {
            acceso = login_admin;
        } else if (action.equalsIgnoreCase("dashboard")) {
            acceso = dashboard;
        } else if (action.equalsIgnoreCase("mi_cuenta")) {
            acceso = mi_cuenta;
        } else if (action.equalsIgnoreCase("editar_usuario")) {
            Usuario new_user = new Usuario();
            new_user.setCorreo(request.getParameter("correo"));
            new_user.setNombre(request.getParameter("first_name"));
            new_user.setApellido(request.getParameter("last_name"));
            new_user.setTelefono(Integer.parseInt(request.getParameter("telephone")));
            new_user.setTipo(1);
            if (request.getParameter("old_password").equalsIgnoreCase("")) {
                new_user.setContrasenia(request.getParameter("password_user"));
                user_dao.edit(new_user);
            } else {
                new_user.setContrasenia(request.getParameter("new_password"));
                user_dao.edit(new_user);
            }
            session.setAttribute("usuario", new_user);
            acceso = mi_cuenta;
        } else if (action.equalsIgnoreCase("Registrarse")) {
            UsuarioDAO dao_user = new UsuarioDAO();
            Usuario usuario = new Usuario(request.getParameter("correo"),request.getParameter("nombre"),
                    request.getParameter("apellido"),request.getParameter("password"),1,Integer.parseInt(request.getParameter("telefono")));
            dao_user.add(usuario);
            session.setAttribute("usuario", usuario);
            acceso = mi_cuenta;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

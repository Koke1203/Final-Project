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
import Logica.Model;
import java.util.Iterator;

public class ControladorLogin extends HttpServlet {
    
    String menu = "index_menu.jsp";
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
        
        if (action.equalsIgnoreCase("Login")) {
            List<Usuario> list = Model.instance().listUsuarios();
            Iterator<Usuario> iter = list.iterator();
            Usuario per = null;
            boolean es_falso = true;

            while (iter.hasNext()) {
                per = iter.next();
                if (request.getParameter("email").equals(per.getCorreo()) && request.getParameter("password").equals(per.getContrasenia())) {
                    acceso = menu;
                    //   updateModel(request);
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
        }else if(action.equalsIgnoreCase("logout")) {
            session.removeAttribute("usuario");
            acceso = login;
        }else if(action.equalsIgnoreCase("menu")){
            acceso = menu;
        }else if(action.equalsIgnoreCase("mi_cuenta")){
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

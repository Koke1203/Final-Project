package Presentacion;

import Logica.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
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
    String login = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLogin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("Login")) {
            HttpSession session = request.getSession(true);
            
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
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

//    void updateModel(HttpServletRequest request) {
//        ModelLogin model = (ModelLogin) request.getAttribute("modelLogin");
//        model.getCurrent().setCedula(request.getParameter("user"));
//        model.getCurrent().setClave(request.getParameter("password"));
//    }
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

package Presentacion;

import Logica.Direccion;
import Logica.Usuario;
import ModelDAO.DireccionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ControladorCompra extends HttpServlet {

    String comprar = "presentacion/compra.jsp";
    String menu = "index_menu.jsp";
    String direccion = "presentacion/address_book.jsp";
    String cuenta = "presentacion/mi_cuenta.jsp";
    String orden_completada = "presentacion/orden_completada.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorCompra</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorCompra at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");
        HttpSession session = request.getSession(true);
        
        if (action.equalsIgnoreCase("Checkout")) {
            if (session.getAttribute("carrito")!=null) {
                session.setAttribute("tipo_entrega", request.getParameter("order_type"));
                System.out.println("Tipo de entrega: "+request.getParameter("order_type"));
                acceso = comprar;
            }else{
                String carrito_vacio = "El carrito está vacío";
                request.setAttribute("carrito_vacio", carrito_vacio);
                acceso = menu;
            }
        } else if (action.equalsIgnoreCase("comprar")) {
            acceso = comprar;
        } else if (action.equalsIgnoreCase("menu")) {
            acceso = menu;
        } else if (action.equalsIgnoreCase("direcciones")) {
            acceso = direccion;
        } else if (action.equalsIgnoreCase("agregar_direccion")) {
            Usuario logueado = (Usuario) session.getAttribute("usuario");
            DireccionDAO dao = new DireccionDAO();
            Direccion direccion = new Direccion(request.getParameter("direccion"), request.getParameter("pais"),
                    request.getParameter("ciudad"), request.getParameter("estado"),
                    Integer.parseInt(request.getParameter("codigo_postal")), logueado.getCorreo());
            dao.addDireccion(direccion);
            acceso = cuenta;
        }else if(action.equalsIgnoreCase("show_orden")){
            acceso = orden_completada;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

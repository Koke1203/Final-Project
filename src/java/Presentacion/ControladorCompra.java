package Presentacion;

import Logica.Direccion;
import Logica.Model;
import ModelDAO.DireccionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorCompra extends HttpServlet {
    
    String comprar = "presentacion/compra.jsp"; 
    String menu = "index_menu.jsp";
    String direccion = "presentacion/address_book.jsp";
    String cuenta = "presentacion/mi_cuenta.jsp";
    
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
        
        if(action.equalsIgnoreCase("checkout")) {
            acceso = comprar;
        }else if(action.equalsIgnoreCase("comprar")){
            acceso = menu;
        }else if(action.equalsIgnoreCase("menu")){
            acceso = menu;
        }else if(action.equalsIgnoreCase("direcciones")){
            acceso = direccion;
        }else if(action.equalsIgnoreCase("agregar_direccion")){
            DireccionDAO dao = new DireccionDAO();
            Direccion direccion = new Direccion(request.getParameter("direccion"),request.getParameter("pais"),
                    request.getParameter("ciudad"),request.getParameter("estado"),Integer.parseInt(request.getParameter("codigo_postal")),"");
            dao.addDireccion(direccion);
            acceso = cuenta;
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

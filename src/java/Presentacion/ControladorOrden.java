/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentacion;

import Logica.Orden;
import Logica.Usuario;
import ModelDAO.OrdenDAO;
import ModelDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author groya
 */
public class ControladorOrden extends HttpServlet {

    String listar_ordenes = "presentacion/listado_ordenes.jsp";
    String listar_staff = "presentacion/admin/list_staff.jsp";
    String listar_customer = "presentacion/admin/list_customer.jsp";
    String listar_menu = "presentacion/admin/list_dish.jsp";
    String listar_categorias = "presentacion/admin/list_categories.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorOrden at " + request.getContextPath() + "</h1>");
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

        if (action.equalsIgnoreCase("listarOdenes")) {
            Usuario logueado = (Usuario) session.getAttribute("usuario");
            OrdenDAO ordenDAO = new OrdenDAO();
            List<Orden> ordenes = ordenDAO.listarOrdenes();

            request.setAttribute("listaOrdenes", ordenes);

            acceso = listar_ordenes;
        } else if (action.equalsIgnoreCase("list_customer")) {
            Usuario logueado = (Usuario) session.getAttribute("usuario");
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            List<Usuario> usuarios = usuarioDAO.listCustomer();

            request.setAttribute("listaCustomer", usuarios);

            acceso = listar_customer;
        } else if (action.equalsIgnoreCase("list_staff")) {
            Usuario logueado = (Usuario) session.getAttribute("usuario");
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            List<Usuario> usuarios = usuarioDAO.listStaff();

            request.setAttribute("listaStaff", usuarios);

            acceso = listar_staff;
        } else if (action.equalsIgnoreCase("listarMenu")) {
            acceso = listar_menu;
        } else if (action.equalsIgnoreCase("listarCategorias")) {
            acceso = listar_categorias;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

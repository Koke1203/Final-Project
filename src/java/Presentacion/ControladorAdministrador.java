/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentacion;

import Logica.Categoria;
import Logica.Orden;
import Logica.Platillo;
import ModelDAO.CategoriaDAO;
import ModelDAO.OrdenDAO;
import ModelDAO.PlatilloDAO;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author groya
 */
@WebServlet(name = "ControladorAdministrador", urlPatterns = {"/api/orders/listAll", "/api/categoria/add", "/api/categoria/edit", "/api/platillos/listAll",
    "/api/order/edit", "/api/platillo/add", "/api/platillo/edit", "/api/platillo/get", "/api/platillo/delete"})
public class ControladorAdministrador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/api/orders/listAll":
                this.listarOrdenes(request, response);
                break;
            case "/api/platillos/listAll":
                this.listarPlatillos(request, response);
                break;
            case "/api/order/edit":
                this.editarOrden(request, response);
                break;
            case "/api/categoria/add":
                this.doCategoriaAdd(request, response);
                break;
            case "/api/categoria/edit":
                this.doCategoriaEdit(request, response);
                break;
            case "/api/platillo/add":
                this.doPlatilloAdd(request, response);
                break;
            case "/api/platillo/edit":
                this.doPlatilloEdit(request, response);
                break;
            case "/api/platillo/get":
                this.doPlatilloGet(request, response);
                break;
            case "/api/platillo/delete":
                this.doPlatilloDelete(request, response);
                break;

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

    private void listarOrdenes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            OrdenDAO daoOrden = new OrdenDAO();
            List<Orden> ordenes = daoOrden.listarOrdenes();
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(ordenes));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarPlatillos(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            PlatilloDAO daoPlatillo = new PlatilloDAO();
            List<Platillo> platillos = daoPlatillo.listarPlatillos();
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(platillos));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void editarOrden(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Orden orden = gson.fromJson(reader, Orden.class);
            PrintWriter out = response.getWriter();
            OrdenDAO daoOrden = new OrdenDAO();
            daoOrden.editarOrden(orden);
//            List<Orden> ordenes = daoOrden.listarOrdenes();
//            response.setContentType("application/json; charset=UTF-8");
//            out.write(gson.toJson(ordenes));
            response.setStatus(204); // ok with no content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

    private void doPlatilloGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Platillo platillo = gson.fromJson(reader, Platillo.class);
            PrintWriter out = response.getWriter();
            PlatilloDAO platillo_dao = new PlatilloDAO();
            platillo_dao.edit(platillo);
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(platillo));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

    private void doPlatilloDelete(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Platillo platillo = gson.fromJson(reader, Platillo.class);
            PrintWriter out = response.getWriter();
            PlatilloDAO platillo_dao = new PlatilloDAO();
            platillo_dao.eliminar(platillo.getCodigo());
            List<Platillo> platillos = platillo_dao.listarPlatillos();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(platillos));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

    protected int status(Exception e) {
        if (e.getMessage().startsWith("404")) {
            return 404;
        }
        if (e.getMessage().startsWith("406")) {
            return 406;
        }
        return 400;
    }

    private void doPlatilloAdd(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Platillo platillo = gson.fromJson(reader, Platillo.class);
            PrintWriter out = response.getWriter();
            PlatilloDAO platillo_dao = new PlatilloDAO();
            platillo_dao.add(platillo);
            List<Platillo> platillos = platillo_dao.listarPlatillos();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(platillos));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

    private void doCategoriaAdd(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Categoria categoria = gson.fromJson(reader, Categoria.class);
            PrintWriter out = response.getWriter();
            CategoriaDAO categoria_dao = new CategoriaDAO();
            categoria_dao.add(categoria);
            List<Categoria> categorias = categoria_dao.listarCategorias();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(categorias));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

    private void doCategoriaEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Categoria categoria = gson.fromJson(reader, Categoria.class);
            PrintWriter out = response.getWriter();
            CategoriaDAO categoria_dao = new CategoriaDAO();
            categoria_dao.edit(categoria);
            List<Categoria> categorias = categoria_dao.listarCategorias();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(categorias));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

    private void doPlatilloEdit(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Platillo platillo = gson.fromJson(reader, Platillo.class);
            PrintWriter out = response.getWriter();
            PlatilloDAO platillo_dao = new PlatilloDAO();
            platillo_dao.edit(platillo);
            List<Platillo> platillos = platillo_dao.listarPlatillos();
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(platillos));
            response.setStatus(200); // ok with content
        } catch (Exception e) {
            response.setStatus(status(e));
        }
    }

}

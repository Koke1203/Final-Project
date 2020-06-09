package Presentacion;

import Logica.Adicional;
import Logica.Carrito;
import Logica.Categoria;
import Logica.DetalleOrden;
import Logica.Direccion;
import Logica.Opcion;
import Logica.Orden;
import Logica.Orden_Factura;
import Logica.Platillo;
import Logica.Usuario;
import ModelDAO.AdicionalDAO;
import ModelDAO.CategoriaDAO;
import ModelDAO.OpcionDAO;
import ModelDAO.DireccionDAO;
import ModelDAO.OrdenDAO;
import ModelDAO.PlatilloDAO;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ControladorCliente", urlPatterns = {"/api/categorias/listar", "/api/platillos/listar", "/api/platillo/getAdicionales",
    "/api/platillo/getOpciones", "/api/categorias/getDescripcion","/api/carrito/agregarPlatillo", "/api/carrito/sacarPlatillo", 
    "/api/carrito/listarCarrito", "/api/direccion/listar", "/api/carrito/verificar","/api/usuario/listar", "/api/carrito/total_pagar",
    "/api/orden/guardarOrdenPedido", "/api/orden/listarInfo"})
public class ControladorCliente extends HttpServlet {

    List<Carrito> carrito_general = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        switch (request.getServletPath()) {
            case "/api/categorias/listar":
                this.listarCategorias(request, response);
                break;
            case "/api/platillos/listar":
                this.listarPlatillos(request, response);
                break;
            case "/api/platillo/getAdicionales":
                this.listarAdicionalesPlatillo(request, response);
                break;
            case "/api/platillo/getOpciones":
                this.listarOpcionesAdicional(request, response);
                break;
            case "/api/carrito/agregarPlatillo":
                this.agregarPlatilloCarrito(request, response);
                break;
            case "/api/carrito/sacarPlatillo":
                this.sacarPlatilloCarrito(request, response);
                break;
            case "/api/direccion/listar":
                this.listarDirecciones(request, response);
                break;
            case "/api/carrito/listarCarrito":
                this.listarCarritoInicio(request, response);
                return;
            case "/api/carrito/verificar":
                this.verificarCarritoCuenta(request, response);
                return;
            case "/api/usuario/listar":
                this.listarUsuario(request, response);
                return;
            case "/api/carrito/total_pagar":
                this.listarInfoOrdenFactura(request, response);
                return;
            case "/api/orden/guardarOrdenPedido":
                this.guardarOrdenPedido(request, response);
                return;
            case "/api/orden/listarInfo":
                this.listarInfoOrden(request, response);
                return;
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

    private void listarPlatillos(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Categoria categoria = gson.fromJson(reader, Categoria.class);
            PrintWriter out = response.getWriter();
            PlatilloDAO daoPlatillo = new PlatilloDAO();
            List<Platillo> platillos = daoPlatillo.listForCategoria(categoria.getCodigo());
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(platillos));
            response.setStatus(200); // ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            CategoriaDAO daoCategoria = new CategoriaDAO();
            List<Categoria> categorias = daoCategoria.listarCategorias();
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(categorias));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarAdicionalesPlatillo(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Platillo platillo = gson.fromJson(reader, Platillo.class);
            PrintWriter out = response.getWriter();
            AdicionalDAO daoAdicional = new AdicionalDAO();
            List<Adicional> adicionales = daoAdicional.listForCodPlatillo(platillo.getCodigo());
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(adicionales));
            response.setStatus(200); // ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarOpcionesAdicional(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Adicional adicional = gson.fromJson(reader, Adicional.class);
            PrintWriter out = response.getWriter();
            OpcionDAO daoOpcion = new OpcionDAO();
            List<Opcion> opciones = daoOpcion.listForCodAdicional(adicional.getCodigo_adicional());
            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(opciones));
            response.setStatus(200); // ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    //agrego un platillo al carrito POST
    private void agregarPlatilloCarrito(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(true);
            if ((List<Carrito>) session.getAttribute("carrito") != null) {
                carrito_general = (List<Carrito>) session.getAttribute("carrito");
            }
            
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Carrito carrito_parametro = gson.fromJson(reader, Carrito.class);
            PrintWriter out = response.getWriter();
            
            //actualizar precio total
            double precio_platillo = carrito_parametro.getPlatillo().getPrecio();
            double precio_radio = 0;
            double precio_check = 0;
            double precio_total = 0;

            if (carrito_parametro.getAdicional_radio() != null) {
                int index = carrito_parametro.getOpcion_radio().size() - 1;
                precio_radio += carrito_parametro.getOpcion_radio().get(index).getPrecio();
            }

            if (carrito_parametro.getOpcion_check() != null) {
                for (Opcion o : carrito_parametro.getOpcion_check()) {
                    precio_check += o.getPrecio();
                }
            }

            if (carrito_parametro.getOpcion_check() != null || carrito_parametro.getOpcion_radio() != null) {
                precio_total = (precio_platillo + precio_radio + precio_check) * carrito_parametro.getCantidad();
                carrito_parametro.setPrecio_total(precio_total);
            }

            boolean carrito_esta = false;
            //recorro la lista para ver si esta repetido
            for (Carrito c : carrito_general) {
                if (c.getPlatillo().getCodigo() == carrito_parametro.getPlatillo().getCodigo()) {
                    c.setCantidad(c.getCantidad() + 1);
                    //actualizamos el precio total
                    c.setPrecio_total((c.getPrecio_total() + carrito_parametro.getPrecio_total()));
                    carrito_esta = true;
                }
            }

            if (carrito_esta == false) {
                carrito_general.add(carrito_parametro);
            }

            session.setAttribute("carrito", carrito_general);

            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(carrito_general));
            response.setStatus(200); // ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void sacarPlatilloCarrito(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(true);
            if ((List<Carrito>) session.getAttribute("carrito") != null) {
                carrito_general = (List<Carrito>) session.getAttribute("carrito");
            }
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Platillo platillo_sacar = gson.fromJson(reader, Platillo.class);
            PrintWriter out = response.getWriter();
            Carrito carrito_sacar = null;
            //sacamos al platillo del carrito
            for (Carrito c : carrito_general) {
                if (c.getPlatillo().getCodigo() == platillo_sacar.getCodigo()) {
                    if (c.getCantidad() > 1) {
                        c.setCantidad(c.getCantidad() - 1);
                        //actualizamos el precio total
                        c.setPrecio_total((c.getPrecio_total() - platillo_sacar.getPrecio()));
                    } else {
                        carrito_sacar = c;
                    }
                }
            }

            if (carrito_sacar != null) {
                carrito_general.remove(carrito_sacar);
            }

            session.setAttribute("carrito", carrito_general);

            response.setContentType("application/json; charset=UTF-8");
            out.write(gson.toJson(carrito_general));
            response.setStatus(200); // ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarDirecciones(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            DireccionDAO dao = new DireccionDAO();
            HttpSession session = request.getSession(true);
            List<Direccion> direcciones = new ArrayList<>();
            Usuario logueado = (Usuario)session.getAttribute("usuario");
            direcciones = dao.listarDireccionesXCorreo(logueado.getCorreo());
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(direcciones));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarCarritoInicio(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            List<Carrito> carrito_platillos = new ArrayList<>();
            if ((List<Carrito>) session.getAttribute("carrito") != null) {
                carrito_platillos = (List<Carrito>) session.getAttribute("carrito");
            }
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(carrito_platillos));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void verificarCarritoCuenta(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            List<Carrito> carrito_platillos = null;
            if ((List<Carrito>) session.getAttribute("carrito") != null) {
                carrito_platillos = (List<Carrito>) session.getAttribute("carrito");
            }
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(carrito_platillos));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }
    
    private void listarUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(usuario));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }
    
    private void listarInfoOrdenFactura(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            Orden_Factura orden = new Orden_Factura();
            double total_pagar = 0;
            List<Carrito> carrito = new ArrayList<>();
            int tipo_entrega=0;
            String entrega = (String) session.getAttribute("tipo_entrega");
            
            if ((List<Carrito>) session.getAttribute("carrito") != null) {
                carrito = (List<Carrito>) session.getAttribute("carrito");
            }
            
            for (Carrito c : carrito) {
                total_pagar+=c.getPrecio_total();
            }
            
            if(entrega.equalsIgnoreCase("delivery") ){
                tipo_entrega = 0;
            }else{
                tipo_entrega = 1;
            }
            
            orden.setTipo_entrega(tipo_entrega); 
            orden.setTotal_pagar(total_pagar);
            
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(orden));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }
    
    private void guardarOrdenPedido(HttpServletRequest request, HttpServletResponse response) {
        try {
            BufferedReader reader = request.getReader();
            Gson gson = new Gson();
            Orden orden_agregar = gson.fromJson(reader, Orden.class);
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            OrdenDAO dao_orden = new OrdenDAO(); 
            dao_orden.add(orden_agregar);
            
            //DAO DE DETALLE, LO LLENO CON LA SESION
            List<Carrito> carrito_ordenes = (List<Carrito>) session.getAttribute("carrito");
            for(Carrito c : carrito_ordenes){
                DetalleOrden dao_detalle = new DetalleOrden();
                dao_detalle.setTotal_platillo(0);
                dao_detalle.setTotal_platillo(0);
                dao_detalle.setTotal_platillo(0);
                dao_detalle.setTotal_platillo(0);
                dao_detalle.setTotal_platillo(0);
            }
            //

            //poner en sesion la orden que viene desde la vista 
            session.setAttribute("orden_reciente",orden_agregar);
            
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(""));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }
    
    private void listarInfoOrden(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            Orden orden = (Orden)session.getAttribute("orden_reciente");
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(orden));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
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

}

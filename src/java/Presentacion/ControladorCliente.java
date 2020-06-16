package Presentacion;

import Logica.Adicional;
import Logica.Carrito;
import Logica.CarritoDetalleOrden;
import Logica.CarritoOrden;
import Logica.Categoria;
import Logica.DetalleOrden;
import Logica.Direccion;
import Logica.Opcion;
import Logica.Orden;
import Logica.OrdenClienteDetalle;
import Logica.Orden_Factura;
import Logica.Platillo;
import Logica.Usuario;
import ModelDAO.AdicionalDAO;
import ModelDAO.CategoriaDAO;
import ModelDAO.DetalleOrdenDAO;
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
    "/api/platillo/getOpciones", "/api/categorias/getDescripcion", "/api/carrito/agregarPlatillo", "/api/carrito/sacarPlatillo",
    "/api/carrito/listarCarrito", "/api/direccion/listar", "/api/carrito/verificar", "/api/usuario/listar", "/api/carrito/total_pagar",
    "/api/orden/guardarOrdenPedido", "/api/orden/listarInfo", "/api/tipo_orden/agregarSesion", "/api/detalle/guardarDetalleOrden",
    "/api/orden/listarOrdenesCliente", "/api/cliente/listarOrden", "/api/platillos/listarCodigoPlatillo", "/api/opcion/listarCodigoOpcion"})
public class ControladorCliente extends HttpServlet {

    List<Carrito> carrito_general = new ArrayList<>();
    List<Platillo> codigos_platillos = new ArrayList<>();

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
            case "/api/tipo_orden/agregarSesion":
                this.agregarTipoOrden(request, response);
                return;
            case "/api/detalle/guardarDetalleOrden":
                this.agregarDetalleSesion(request, response);
                return;
            case "/api/orden/listarOrdenesCliente":
                this.listarOrdenCliente(request, response);
                return;
            case "/api/cliente/listarOrden":
                this.listarCarritoCliente(request, response);
                return;
        }
    }

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
            Usuario logueado = (Usuario) session.getAttribute("usuario");
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
            int tipo_entrega = 0;
            String entrega = (String) session.getAttribute("tipo_entrega");

            if ((List<Carrito>) session.getAttribute("carrito") != null) {
                carrito = (List<Carrito>) session.getAttribute("carrito");
            }

            for (Carrito c : carrito) {
                total_pagar += c.getPrecio_total();
            }

            if (entrega.equalsIgnoreCase("delivery")) {
                tipo_entrega = 0;
            } else {
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

            if (dao_orden.listarOrdenes().size() > 0) {
                Orden orden_index = (Orden) dao_orden.listarOrdenes().get(dao_orden.listarOrdenes().size() - 1);
                orden_agregar.setCodigo_orden(orden_index.getCodigo_orden()); //como el codigo es AI, entonces tengo que obtenerlo de la lista
            }
            DetalleOrden detalleSesion = (DetalleOrden) session.getAttribute("detalle_orden");
            //El precio de la opcion lo obtengo por medio del codigo de la sesion
            List<Carrito> carrito_ordenes = (List<Carrito>) session.getAttribute("carrito");
            for (Carrito c : carrito_ordenes) {
                //alamaceno las opciones de radio buttons
                DetalleOrden detalle = new DetalleOrden();
                DetalleOrdenDAO dao = new DetalleOrdenDAO();
                detalle.setTotal_platillo(c.getPrecio_total());
                detalle.setDireccion_cliente(detalleSesion.getDireccion_cliente());
                detalle.setCorreo_cliente(detalleSesion.getCorreo_cliente());
                detalle.setCodigo_orden(orden_agregar.getCodigo_orden());
                detalle.setCodigo_platillo(c.getPlatillo().getCodigo());
                if (c.getOpcion_radio().size() > 0) {
                    detalle.setCodigo_opcion(c.getOpcion_radio().get(c.getOpcion_radio().size() - 1).getCodigo_opcion());
                } else {
                    detalle.setCodigo_opcion(0);
                }
                dao.add(detalle);

                if (c.getOpcion_check().size() > 0) {
                    //almaceno las opciones de checkbox
                    for (Opcion opc : c.getOpcion_check()) {
                        DetalleOrden detalle_opcion = new DetalleOrden();
                        DetalleOrdenDAO dao_1 = new DetalleOrdenDAO();
                        detalle_opcion.setTotal_platillo(c.getPrecio_total());
                        detalle.setDireccion_cliente(detalleSesion.getDireccion_cliente());
                        detalle_opcion.setCorreo_cliente(detalleSesion.getCorreo_cliente());
                        detalle_opcion.setCodigo_orden(orden_agregar.getCodigo_orden());
                        detalle_opcion.setCodigo_platillo(c.getPlatillo().getCodigo());
                        detalle_opcion.setCodigo_opcion(opc.getCodigo_opcion());
                        dao_1.add(detalle_opcion);
                    }
                }
            }
            
            session.setAttribute("orden_reciente", orden_agregar);
            
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(""));
            response.setStatus(200);//Ok with content
            session.removeAttribute("carrito");
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarInfoOrden(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            Orden orden = (Orden) session.getAttribute("orden_reciente");
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(orden));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void agregarTipoOrden(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            Orden_Factura factura = gson.fromJson(reader, Orden_Factura.class);
            if (factura.getTipo_entrega() == 0) {
                session.setAttribute("tipo_entrega", "delivery");
            } else {
                session.setAttribute("tipo_entrega", "pickup");
            }
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(""));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void agregarDetalleSesion(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            DetalleOrden detalle = gson.fromJson(reader, DetalleOrden.class);
            session.setAttribute("detalle_orden", detalle);
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(""));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }

    private void listarOrdenCliente(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(true);
            Usuario logueado = (Usuario) session.getAttribute("usuario");
            String correo = logueado.getCorreo();
            DetalleOrdenDAO detalle_dao = new DetalleOrdenDAO();
            List<DetalleOrden> lista_detalle = new ArrayList<>();
            lista_detalle = detalle_dao.listarDetalleXCorreo(correo);
            List<Orden> ordenes_cliente = new ArrayList<>();

            for (DetalleOrden d : lista_detalle) {
                OrdenDAO dao_orden = new OrdenDAO();
                ordenes_cliente.add(dao_orden.listForCodigoF(d.getCodigo_orden()));
            }

            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(ordenes_cliente));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }
    
    private void listarCarritoCliente(HttpServletRequest request, HttpServletResponse response) {
        try {
            Gson gson = new Gson();
            BufferedReader reader = request.getReader();
            PrintWriter out = response.getWriter();

            HttpSession session = request.getSession(true);
            OrdenClienteDetalle retorno = new OrdenClienteDetalle();
            int id_orden = Integer.parseInt((String) session.getAttribute("id_orden"));
            OrdenDAO dao_orden = new OrdenDAO();
            Orden orden = dao_orden.listForCodigoF(id_orden);
            
            DetalleOrdenDAO detalle_dao = new DetalleOrdenDAO();
            List<DetalleOrden> detalles = new ArrayList<>();
            detalles = detalle_dao.listarDetalleOrdenXCodigo(id_orden);

            retorno.setOrden(orden);
            
            int seleccionado = 0;
            List<CarritoOrden> detalles_lista = new ArrayList<>();
            CarritoDetalleOrden retorno_orden = new CarritoDetalleOrden();
            //solo me tengo que enfocar en detalles
            for (DetalleOrden det : detalles) {
                if (det.getCodigo_platillo() == seleccionado) {
                    seleccionado = 0;
                } else {
                    seleccionado = det.getCodigo_platillo();
                }
                
                if (seleccionado!=0) {
                    CarritoOrden detalle = new CarritoOrden();
                    detalle.setPlatillo(retornaPlatillo(det.getCodigo_platillo()));
                    List<Opcion> opciones = new ArrayList<>();
                    for (DetalleOrden d2 : detalles) {
                        if (d2.getCodigo_platillo() == seleccionado) {
                            opciones.add(retornaOrden(d2.getCodigo_opcion()));
                        }
                    }
                    detalle.setOpciones(opciones);
                    detalles_lista.add(detalle);
                }
                seleccionado = det.getCodigo_platillo();
            }
            
            retorno.setDetalles(detalles_lista);
            
            retorno_orden.setOrden_cliente(retorno);
            retorno_orden.setDireccion(detalles.get(0).getDireccion_cliente());
            
            response.setContentType("application/json; charet=UTF-8");
            out.write(gson.toJson(retorno_orden));
            response.setStatus(200);//Ok with content
        } catch (Exception ex) {
            response.setStatus(status(ex));
        }
    }
    
    private Platillo retornaPlatillo(int codigo_platillo) {
        Platillo retorno = new Platillo();
        retorno.setCodigo(0);
        if (codigo_platillo != 0) {
            PlatilloDAO dao = new PlatilloDAO();
            retorno = dao.listForCodigo(codigo_platillo);
        }
        return retorno;
    }

    private Opcion retornaOrden(int codigo_orden) {
        Opcion retorno = new Opcion();
        OpcionDAO dao = new OpcionDAO();
        retorno = dao.listXCodigoOpcion(codigo_orden);
        return retorno;
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

}

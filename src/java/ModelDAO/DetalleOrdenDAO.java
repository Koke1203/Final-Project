package ModelDAO;

import Config.Conexion;
import Logica.DetalleOrden;
import Logica.Orden;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DetalleOrdenDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listarDetalleOrdenXCodigo(int codigo_orden) {
        ArrayList<DetalleOrden> list = new ArrayList<>();
        String sql = "select * from detalleorden where orden_codigo_orden=" + codigo_orden;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleOrden detalle = new DetalleOrden();
                detalle.setTotal_platillo(rs.getDouble("total_platillo"));
                detalle.setDireccion_cliente(rs.getString("direccion_cliente"));
                detalle.setCodigo_orden(rs.getInt("orden_codigo_orden"));
                detalle.setCodigo_platillo(rs.getInt("platillo_codigo_platillo"));
                detalle.setCodigo_opcion(rs.getInt("opcion_codigo_opcion"));
                detalle.setCorreo_cliente(rs.getString("usuario_correo"));
                list.add(detalle);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }

    public boolean add(DetalleOrden det) {
        String sql = "insert into detalleorden(total_platillo, direccion_cliente, orden_codigo_orden, platillo_codigo_platillo,opcion_codigo_opcion,usuario_correo)"
                + "values(" + det.getTotal_platillo() + ",'" + det.getDireccion_cliente() + "',"
                + det.getCodigo_orden() + "," + det.getCodigo_platillo() + "," + det.getCodigo_opcion() + ",'" + det.getCorreo_cliente() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Ocurrió excepcion a la hora de Agregar un DetalleOrden" + e.getMessage());
        }
        return false;
    }

    public List<DetalleOrden> listarDetalleXCorreo(String usuario_correo) {
        ArrayList<DetalleOrden> list = new ArrayList<>();
        String sql = "select * from detalleorden where usuario_correo='" + usuario_correo + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            int seleccionado = 0;
            while (rs.next()) {
                if (rs.getInt("orden_codigo_orden") == seleccionado) {
                    seleccionado = 0;
                } else {
                    seleccionado = rs.getInt("orden_codigo_orden");
                }
                if (seleccionado != 0) {
                    DetalleOrden detalle = new DetalleOrden();
                    detalle.setTotal_platillo(rs.getInt("total_platillo"));
                    detalle.setDireccion_cliente(rs.getString("direccion_cliente"));
                    detalle.setCorreo_cliente(rs.getString("usuario_correo"));
                    detalle.setCodigo_orden(rs.getInt("orden_codigo_orden"));
                    detalle.setCodigo_platillo(rs.getInt("platillo_codigo_platillo"));
                    detalle.setCodigo_opcion(rs.getInt("opcion_codigo_opcion"));
                    list.add(detalle);
                }
                seleccionado = rs.getInt("orden_codigo_orden");
            }
        } catch (Exception e) {
        }
        return list;
    }

}

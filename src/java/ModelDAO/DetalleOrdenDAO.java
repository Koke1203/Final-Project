package ModelDAO;

import Config.Conexion;
import Logica.DetalleOrden;
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
        String sql = "select * from detalleorden where codigo_orden="+codigo_orden;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleOrden detalle = new DetalleOrden();
                detalle.setTotal_platillo(rs.getDouble("total_platillo"));
                detalle.setTotal_opcion(rs.getDouble("total_opcion"));
                detalle.setCodigo_orden(rs.getInt("codigo_orden"));
                detalle.setCodigo_platillo(rs.getInt("codigo_platillo"));
                detalle.setCodigo_opcion(rs.getInt("codigo_opcion"));
                detalle.setCorreo_cliente(rs.getString("correo_cliente"));
                list.add(detalle);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }

}

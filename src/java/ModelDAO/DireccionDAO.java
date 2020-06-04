package ModelDAO;

import Config.Conexion;
import Logica.Direccion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DireccionDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public boolean addDireccion(Direccion dir) {
        String sql = "insert into direccion(direccion_general, pais, ciudad, estado, codigo_postal,usuario_correo)values('"
                + dir.getDireccion_general()+ "','" + dir.getPais()+ "','" + dir.getCiudad()+ "','" 
                + dir.getEstado()+"',"+ dir.getCodigo_postal()+ ",'"+dir.getCorreo_cliente()+"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
        return false;
    }
    
    public List listarDirecciones() {
        ArrayList<Direccion> list = new ArrayList<>();
        String sql = "select * from direccion";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Direccion dir = new Direccion();
                dir.setDireccion_general(rs.getString("direccion_general"));
                dir.setPais(rs.getString("pais"));
                dir.setCiudad(rs.getString("ciudad"));
                dir.setEstado(rs.getString("estado"));
                dir.setCodigo_postal(rs.getInt("codigo_postal"));
                dir.setCorreo_cliente(rs.getString("usuario_correo"));
                list.add(dir);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    
}

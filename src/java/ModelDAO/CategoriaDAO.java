package ModelDAO;

import Config.Conexion;
import Logica.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List listarCategorias() {
        ArrayList<Categoria> list = new ArrayList<>();
        String sql = "select * from categoria";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setCodigo(rs.getInt("codigo_categoria"));
                categoria.setDescripcion(rs.getString("descripcion"));
                list.add(categoria);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }

    public boolean add(Categoria per) {
        String sql = "insert into categoria(descripcion)values('" + per.getDescripcion() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean edit(Categoria per) {
        String sql = "update categoria set descripcion='" + per.getDescripcion() + "' where (codigo_categoria=" + per.getCodigo() + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("No se ejecuto la consulta");
        }
        return false;
    }

}

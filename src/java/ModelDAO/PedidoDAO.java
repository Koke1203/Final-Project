package ModelDAO;

import Config.Conexion;
import Logica.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Pedido p = new Pedido();
    
    public List listarPedidos() {
        ArrayList<Pedido> list = new ArrayList<>();
        String sql = "select * from pedido";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Pedido per = new Pedido();
                per.setNumero_pedido(rs.getInt("numero_pedido"));
                per.setTipo_pedido(rs.getInt("tipo_pedido"));
                per.setTipo_entrega(rs.getInt("tipo_entrega"));
                per.setFk_codigo_platillo(rs.getInt("fk_codigo_platillo"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public boolean add(Pedido per) {
        String sql = "insert into pedido(numero_pedido, tipo_pedido, tipo_entrega, fk_codigo_platillo)values(" + per.getNumero_pedido()
                + "," + per.getTipo_pedido()+ "," + per.getTipo_entrega()+ "," + per.getFk_codigo_platillo()+ ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
        return false;
    }
    
    public Pedido listForNumPedido(int numero_Pedido) {
        String sql = "select * from pedido where numero_pedido=" + numero_Pedido;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setNumero_pedido(rs.getInt("numero_pedido"));
                p.setTipo_pedido(rs.getInt("tipo_pedido"));
                p.setTipo_entrega(rs.getInt("tipo_entrega"));
                p.setFk_codigo_platillo(rs.getInt("fk_codigo_platillo"));
            }
        } catch (Exception e) {
        }
        return p;
    }
    
    public boolean eliminar(int numero_Pedido) {
        String sql = "delete from pedido where numero_pedido=" + numero_Pedido;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}

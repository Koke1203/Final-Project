/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Logica.Factura;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jorge
 */
public class FacturaDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Factura p = new Factura();
    
    
    public List listarPedidos() {
        ArrayList<Factura> list = new ArrayList<>();
        String sql = "select * from factura";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Factura per = new Factura();
                per.setCodigo_factura(rs.getInt("codigo_factura"));
                per.setFecha(rs.getString("fecha"));
                per.setTotal_pagar(rs.getDouble("total_pagar"));
                per.setTipo_pago(rs.getInt("tipo_pago"));
                per.setFk_numero_pedido(rs.getInt("fk_numero_pedido"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public boolean add(Factura per) {
        String sql = "insert into factura(codigo_factura, fecha, total_pagar, tipo_pago, fk_numero_pedido)values("
                + per.getCodigo_factura()+ ",'" + per.getFecha()+ "'," + per.getTotal_pagar()+ "," 
                + per.getTipo_pago()+","+ per.getFk_numero_pedido()+ ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
        return false;
    }
    
    public Factura listForCodigoF(int codigo_Factura) {
        String sql = "select * from factura where codigo_factura=" + codigo_Factura;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCodigo_factura(rs.getInt("codigo_factura"));
                p.setFecha(rs.getString("fecha"));
                p.setTotal_pagar(rs.getDouble("total_pagar"));
                p.setTipo_pago(rs.getInt("tipo_pago"));
                p.setFk_numero_pedido(rs.getInt("fk_numero_pedido"));
            }
        } catch (Exception e) {
        }
        return p;
    }
    
}

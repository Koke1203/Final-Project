/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Logica.Orden;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jorge
 */
public class OrdenDAO {
    
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Orden p = new Orden();
    
    public List listarOrdenes() {
        ArrayList<Orden> list = new ArrayList<>();
        String sql = "select * from orden";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Orden per = new Orden();
                per.setCodigo_orden(rs.getInt("codigo_orden"));
                per.setNombre_cliente(rs.getString("nombre_cliente"));
                per.setTipo_entrega(rs.getInt("tipo_entrega"));
                per.setHora(rs.getString("hora"));
                per.setFecha(rs.getString("fecha"));
                per.setEstado(rs.getString("estado"));
                per.setTipo_pago(rs.getInt("tipo_pago"));
                per.setTotal_pagar(rs.getDouble("total_pagar"));
      
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public boolean add(Orden per) {
        String sql = "insert into orden(codigo_orden, nombre_cliente, tipo_entrega, hora, fecha,estado,tipo_pago,total_pagar)"
                + "values("+ per.getCodigo_orden()+ ",'" + per.getNombre_cliente()+ "'," + per.getTipo_entrega()+ ",'" 
                + per.getHora()+"','"+ per.getFecha()+ "','"+ per.getEstado()+ "',"+ per.getTipo_pago()+ ","
                + per.getTotal_pagar()+ ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
        return false;
    }
    
    
    public Orden listForCodigoF(int codigo_orden) {
        String sql = "select * from orden where codigo_orden=" + codigo_orden;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCodigo_orden(rs.getInt("codigo_orden"));
                p.setNombre_cliente(rs.getString("nombre_cliente"));
                p.setTipo_entrega(rs.getInt("tipo_entrega"));
                p.setHora(rs.getString("hora"));
                p.setFecha(rs.getString("fecha"));
                p.setEstado(rs.getString("estado"));
                p.setTipo_pago(rs.getInt("tipo_pago"));
                p.setTotal_pagar(rs.getDouble("total_pagar"));
            }
        } catch (Exception e) {
        }
        return p;
    }
    
}

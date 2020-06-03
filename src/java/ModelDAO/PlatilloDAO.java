/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Logica.Platillo;
import Logica.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jorge
 */
public class PlatilloDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Platillo p = new Platillo();
    
    public List listarPlatillos() {
        ArrayList<Platillo> list = new ArrayList<>();
        String sql = "select * from platillo";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Platillo per = new Platillo();
                per.setCodigo(rs.getInt("codigo_platillo"));
                per.setNombre(rs.getString("nombre"));
                per.setPrecio(rs.getDouble("precio"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setCodigo_categoria(rs.getInt("fk_categoria"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public Platillo listForCodigo(int codigo_plato) {
        String sql = "select * from platillo where codigo_platillo=" + codigo_plato;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCodigo(rs.getInt("codigo_platillo"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getDouble("precio"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setCodigo_categoria(rs.getInt("fk_categoria"));
            }
        } catch (Exception e) {
        }
        return p;
    }
    
}

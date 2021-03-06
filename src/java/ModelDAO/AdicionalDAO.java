/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Logica.Adicional;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jorge
 */
public class AdicionalDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Adicional p = new Adicional();

    public List listarAdicionales() {
        ArrayList<Adicional> list = new ArrayList<>();
        String sql = "select * from adicional";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Adicional per = new Adicional();
                per.setCodigo_adicional(rs.getInt("codigo_adicional"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setMultiple(rs.getInt("multiple"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public List listForCodPlatillo(int cod_platillo) {
        ArrayList<Adicional> list = new ArrayList<>();
        String sql = "select a.* from adicional a inner join detalleadicional da on da.fk_codigoAdicional = a.codigo_adicional where da.fk_codigoPlatillo =" + cod_platillo;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Adicional adicional = new Adicional();
                adicional.setCodigo_adicional(rs.getInt("codigo_adicional"));
                adicional.setDescripcion(rs.getString("descripcion"));
                adicional.setMultiple(rs.getInt("multiple"));
                list.add(adicional);
            }
        } catch (Exception e) {
        }
        return list;
    }

}

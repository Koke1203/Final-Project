/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Logica.Adicional;
import Logica.Opcion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jorge
 */
public class OpcionDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Opcion p = new Opcion();

    public List listarOpcionales() {
        ArrayList<Opcion> list = new ArrayList<>();
        String sql = "select * from opcion";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Opcion per = new Opcion();
                per.setCodigo_opcion(rs.getInt("codigo_adicional"));
                per.setDescripcion(rs.getString("descripcion"));
                per.setPrecio(rs.getDouble("precio"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }

    public List listForCodAdicional(int cod_adicional) {
        ArrayList<Opcion> list = new ArrayList<>();
        String sql = "select o.* from opcion o inner join detalleopcion detOpc on detOpc.fk_codigoOpcion = o.codigo_opcion where detOpc.fk_codigoAdicional =" + cod_adicional;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Opcion opc = new Opcion();
                opc.setCodigo_opcion(rs.getInt("codigo_opcion"));
                opc.setDescripcion(rs.getString("descripcion"));
                opc.setPrecio(rs.getDouble("precio"));
                list.add(opc);
            }
        } catch (Exception e) {
        }
        return list;
    }

}

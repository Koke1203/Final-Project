/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
import Logica.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author groya
 */
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

}

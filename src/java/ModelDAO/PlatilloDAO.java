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
                Platillo platillo = new Platillo();
                platillo.setCodigo(rs.getInt("codigo_platillo"));
                platillo.setNombre(rs.getString("nombre"));
                platillo.setPrecio(rs.getDouble("precio"));
                platillo.setDescripcion(rs.getString("descripcion"));
                platillo.setCodigo_categoria(rs.getInt("fk_categoria"));
                list.add(platillo);
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

    public List listForCategoria(int cod_categoria) {
        ArrayList<Platillo> list = new ArrayList<>();
        String sql = "select * from platillo where fk_categoria = " + cod_categoria;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Platillo platillo = new Platillo();
                platillo.setCodigo(rs.getInt("codigo_platillo"));
                platillo.setNombre(rs.getString("nombre"));
                platillo.setPrecio(rs.getDouble("precio"));
                platillo.setDescripcion(rs.getString("descripcion"));
                platillo.setCodigo_categoria(rs.getInt("fk_categoria"));
                list.add(platillo);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean edit(Platillo per) {
        String sql = "update platillo set nombre='" + per.getNombre() + "',precio="
                + per.getPrecio() + ",descripcion='" + per.getDescripcion() + "'where codigo_platillo=" + per.getCodigo();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("No se ejecuto la consulta");
        }
        return false;
    }

    public boolean eliminar(int codigo) {
        String sql1 = "delete from platillo where (codigo_platillo =" + codigo + ")";
        String sql2 = "delete from detalleadicional where (fk_codigoPlatillo =" + codigo + ")";
        try {
            con = cn.getConnection();
            ps = (PreparedStatement) con.prepareStatement(sql2);
            ps = (PreparedStatement) con.prepareStatement(sql1);
            //con.close();
            return (ps.executeUpdate() == 1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    public boolean add(Platillo per) {
        String sql = "insert into platillo(nombre, precio, descripcion, fk_categoria)values('" + per.getNombre()
                + "'," + per.getPrecio() + ",'" + per.getDescripcion() + "'," + per.getCodigo_categoria() + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}

package ModelDAO;

import Config.Conexion;
import Logica.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuario p = new Usuario();

    public List listarUsuarios() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario per = new Usuario();
                per.setCorreo(rs.getString("correo"));
                per.setNombre(rs.getString("nombre"));
                per.setApellido(rs.getString("apellido"));
                per.setContrasenia(rs.getString("password"));
                per.setTipo(rs.getInt("tipo_Usuario"));
                per.setTelefono(rs.getInt("telefono"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public List listStaff() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario where tipo_usuario = 0";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario per = new Usuario();
                per.setCorreo(rs.getString("correo"));
                per.setNombre(rs.getString("nombre"));
                per.setApellido(rs.getString("apellido"));
                per.setContrasenia(rs.getString("password"));
                per.setTipo(rs.getInt("tipo_usuario"));
                per.setTelefono(rs.getInt("telefono"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }
    
    public List listCustomer() {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario where tipo_usuario = 1";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario per = new Usuario();
                per.setCorreo(rs.getString("correo"));
                per.setNombre(rs.getString("nombre"));
                per.setApellido(rs.getString("apellido"));
                per.setContrasenia(rs.getString("password"));
                per.setTipo(rs.getInt("tipo_usuario"));
                per.setTelefono(rs.getInt("telefono"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        System.out.println("Conectado");
        return list;
    }

    public boolean add(Usuario per) {
        String sql = "insert into usuario(correo, nombre, apellido, password, tipo_Usuario, telefono)values('" + per.getCorreo()
                + "','" + per.getNombre() + "','" + per.getApellido() + "','" + per.getContrasenia() + "'," + per.getTipo()
                + "," + per.getTelefono() + ")";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public Usuario listForCorreo(String correo) {
        String sql = "select * from usuario where correo='" + correo + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCorreo(rs.getString("correo"));
                p.setNombre(rs.getString("nombre"));
                p.setApellido(rs.getString("apellido"));
                p.setContrasenia(rs.getString("password"));
                p.setTipo(rs.getInt("tipo_Usuario"));
                p.setTelefono(rs.getInt("telefono"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    public boolean edit(Usuario per) {
        String sql = "update usuario set nombre='" + per.getNombre() + "',apellido='"
                + per.getApellido() + "',password='" + per.getContrasenia() + "',tipo_Usuario="
                + per.getTipo() + ",telefono=" + per.getTelefono() + " where correo='" + per.getCorreo() + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("No se ejecuto la consulta");
        }
        return false;
    }

    public boolean eliminar(String correo) {
        String sql = "delete from usuario where correo='" + correo + "'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModelDAO;

import Config.Conexion;
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
public class UsuarioDAO {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Usuario p = new Usuario();
    
    public List listar() {
        ArrayList<Usuario>list=new ArrayList<>();
        String sql="select * from usuario";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Usuario per=new Usuario();
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
    
    
}

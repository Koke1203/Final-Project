package Logica;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Model {
    
    
    private static Model uniqueInstance;
    
    public static Model instance(){
        if (uniqueInstance == null){
            uniqueInstance = new Model();
        }
        return uniqueInstance;
    }
    
    HashMap<String,Usuario> usuarios;
    
    private Model() {
        //Tipos (codigo,descripcion)
        usuarios = new HashMap();
        usuarios.put("001", new Usuario("joan.corea08@gmail.com", "Joan","Corea","123","administrador",84289652));
        usuarios.put("002", new Usuario("roy.arias@gmail.com", "Roy","Arias","123","administrador",88774589));
        usuarios.put("003", new Usuario("jorge.canales@gmail.com", "Jorge","Canales","123","administrador",88541236));
    }
    
    public List<Usuario> listUsuarios() {
        return new ArrayList(usuarios.values());
    } 
    
}

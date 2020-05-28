package Logica;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Model {

    private static Model uniqueInstance;

    public static Model instance() {
        if (uniqueInstance == null) {
            uniqueInstance = new Model();
        }
        return uniqueInstance;
    }

    HashMap<String, Usuario> usuarios;
    HashMap<Integer, Categoria> categorias;
    HashMap<Integer, Platillo> platillos;

    private Model() {
        //Tipos (codigo,descripcion)
        usuarios = new HashMap();
        usuarios.put("001", new Usuario("joan.corea08@gmail.com", "Joan", "Corea", "123", 1, 84289652));
        usuarios.put("002", new Usuario("roy.arias@gmail.com", "Roy", "Arias", "123", 1, 88774589));
        usuarios.put("003", new Usuario("jorge.canales@gmail.com", "Jorge", "Canales", "123", 1, 88541236));
        
        categorias = new HashMap<>();

        categorias.put(1, new Categoria(1, "Plato Principal"));
        categorias.put(2, new Categoria(2, "Ensaladas"));
        categorias.put(3, new Categoria(3, "Mariscos"));
        categorias.put(4, new Categoria(4, "Vegetariana"));
        categorias.put(5, new Categoria(5, "Sopas"));
        categorias.put(6, new Categoria(6, "Postres"));
        categorias.put(7, new Categoria(7, "Bebidas"));
        categorias.put(8, new Categoria(8, "Especiales"));
        categorias.put(9, new Categoria(9, "Arroces"));

        platillos = new HashMap<>();
    }

    public List<Usuario> listUsuarios() {
        return new ArrayList(usuarios.values());
    }

    public List<Categoria> listarCategorias() {
        return new ArrayList(categorias.values());
    }
    
    public void agregarUsuario(Usuario new_user){
        usuarios.put("004",new_user);
    }
    
}

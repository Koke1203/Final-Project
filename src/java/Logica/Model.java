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
        categorias.put(1, new Categoria(1, "Apptizer"));
        categorias.put(1, new Categoria(2, "Main Couse"));
        categorias.put(2, new Categoria(3, "Salads"));
        categorias.put(3, new Categoria(4, "Seafoods"));
        categorias.put(4, new Categoria(5, "Tradtional"));
        categorias.put(5, new Categoria(6, "Vegetarian"));
        categorias.put(6, new Categoria(7, "Soups"));
        categorias.put(7, new Categoria(8, "Desserts"));
        categorias.put(8, new Categoria(9, "Drinks"));
        categorias.put(9, new Categoria(10, "Specials"));
        categorias.put(9, new Categoria(11, "Rice Dishes"));

        platillos = new HashMap<>();
        platillos.put(1, new Platillo(1, 1, "PUFF-PUFF", "Traditional Nigerian donut ball, rolled in sugar", 4.99));
        //
        platillos.put(2, new Platillo(2, 2, "SCOTCH EGG", "Boiled egg wrapped in a ground meat mixture, coated in breadcrumbs, and deep-fried.", 2.00));
        //
        platillos.put(3, new Platillo(3, 3, "ATA RICE", "Small pieces of beef, goat, stipe, and tendon sautéed in crushed green Jamaican pepper. ", 12.00));

        platillos.put(4, new Platillo(4, 4, "EBS", "Grated cassava", 11.99));
        //
        platillos.put(5, new Platillo(5, 5, "African Salad", "With baked beans, egg, tuna, onion, tomatoes , green peas and carrot with your choice of dressing.", 8.99));
        platillos.put(6, new Platillo(6, 6, "Rice And Beans", "Traditional caribbean food", 5.01));
        //
    }
    
    public List<Usuario> listUsuarios() {
        return new ArrayList(usuarios.values());
    }
    
    public List<Categoria> listarCategorias() {
        return new ArrayList(categorias.values());
    }

    public void agregarUsuario(Usuario new_user) {
        usuarios.put("004", new_user);
    }
    
    public List<Platillo> listarPlatillos(int codigo_categoria) {
        List<Platillo> platillos_retorno = new ArrayList<>();
        if (codigo_categoria == 1) {
            platillos_retorno.add(platillos.get(1));
        } else if (codigo_categoria == 2) {
            platillos_retorno.add(platillos.get(2));
        } else if (codigo_categoria == 3) {
            platillos_retorno.add(platillos.get(3));
        } else if (codigo_categoria == 4) {
            platillos_retorno.add(platillos.get(4));
        } else if (codigo_categoria == 5) {
            platillos_retorno.add(platillos.get(5));
            platillos_retorno.add(platillos.get(6));
        }
        return platillos_retorno;
    }

    public Categoria obtenerCategoria(int codigo) {
        return categorias.get(codigo);
    }
    
}

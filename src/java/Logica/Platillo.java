package Logica;

public class Platillo {
    
    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    
    public int getCodigo() {
        return codigo;
    }
    
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Platillo(int categoria, int codigo, String nombre, String descripcion, double precio) {
        this.categoria = categoria;
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public Platillo() {
        this.categoria = 0;
        this.codigo = 0;
        this.nombre = "";
        this.descripcion = "";
        this.precio = 0.0;
    }
    
    private int codigo;
    private String nombre;
    private String descripcion;
    private double precio;
    private int categoria;
}

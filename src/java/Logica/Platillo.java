package Logica;

public class Platillo {
    
    private int codigo;
    private String nombre;
    private double precio;
    private String descripcion;
    private String categoria_descripcion;
    private int fk_codigo_adicional;

    public Platillo() {
    }

    public Platillo(int codigo, String nombre, double precio, String descripcion, String categoria_descripcion, int fk_codigo_adicional) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.categoria_descripcion = categoria_descripcion;
        this.fk_codigo_adicional = fk_codigo_adicional;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria_descripcion() {
        return categoria_descripcion;
    }

    public void setCategoria_descripcion(String categoria_descripcion) {
        this.categoria_descripcion = categoria_descripcion;
    }

    public int getFk_codigo_adicional() {
        return fk_codigo_adicional;
    }

    public void setFk_codigo_adicional(int fk_codigo_adicional) {
        this.fk_codigo_adicional = fk_codigo_adicional;
    }
    
    
    
    
}

package Logica;

public class Platillo {

    private int codigo;
    private String nombre;
    private double precio;
    private String descripcion;
    private int codigo_categoria;

    public Platillo() {
    }

    public Platillo(int codigo, String nombre, double precio, String descripcion, int codigo_categoria) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.codigo_categoria = codigo_categoria;
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

    public int getCodigo_categoria() {
        return codigo_categoria;
    }

    public void setCodigo_categoria(int codigo_categoria) {
        this.codigo_categoria = codigo_categoria;
    }

    @Override
    public String toString() {
        return "Platillo{" + "codigo=" + codigo + ", nombre=" + nombre + ", precio=" + precio + ", descripcion=" + descripcion + ", codigo_categoria=" + codigo_categoria + '}';
    }
}

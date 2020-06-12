package Logica;

public class DetalleOrden {
    
    double total_platillo;
    String direccion_cliente;
    String correo_cliente;
    int codigo_orden;
    int codigo_platillo;
    int codigo_opcion;
    
    public DetalleOrden() {
    }

    public DetalleOrden(double total_platillo, String direccion_cliente, String correo_cliente, int codigo_orden, int codigo_platillo, int codigo_opcion) {
        this.total_platillo = total_platillo;
        this.direccion_cliente = direccion_cliente;
        this.correo_cliente = correo_cliente;
        this.codigo_orden = codigo_orden;
        this.codigo_platillo = codigo_platillo;
        this.codigo_opcion = codigo_opcion;
    }

    public double getTotal_platillo() {
        return total_platillo;
    }

    public void setTotal_platillo(double total_platillo) {
        this.total_platillo = total_platillo;
    }

    public String getDireccion_cliente() {
        return direccion_cliente;
    }

    public void setDireccion_cliente(String direccion_cliente) {
        this.direccion_cliente = direccion_cliente;
    }

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }

    public int getCodigo_orden() {
        return codigo_orden;
    }

    public void setCodigo_orden(int codigo_orden) {
        this.codigo_orden = codigo_orden;
    }

    public int getCodigo_platillo() {
        return codigo_platillo;
    }

    public void setCodigo_platillo(int codigo_platillo) {
        this.codigo_platillo = codigo_platillo;
    }

    public int getCodigo_opcion() {
        return codigo_opcion;
    }

    public void setCodigo_opcion(int codigo_opcion) {
        this.codigo_opcion = codigo_opcion;
    }
    
}

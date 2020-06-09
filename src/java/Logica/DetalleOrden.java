package Logica;

public class DetalleOrden {
    
    double total_platillo;
    double total_opcion;
    int codigo_orden;
    int codigo_platillo;
    int codigo_opcion;
    String correo_cliente;
    
    public DetalleOrden() {
    }

    public DetalleOrden(double total_platillo, double total_opcion, int codigo_orden, int codigo_platillo, int codigo_opcion, String correo_cliente) {
        this.total_platillo = total_platillo;
        this.total_opcion = total_opcion;
        this.codigo_orden = codigo_orden;
        this.codigo_platillo = codigo_platillo;
        this.codigo_opcion = codigo_opcion;
        this.correo_cliente = correo_cliente;
    }

    public double getTotal_platillo() {
        return total_platillo;
    }

    public void setTotal_platillo(double total_platillo) {
        this.total_platillo = total_platillo;
    }

    public double getTotal_opcion() {
        return total_opcion;
    }

    public void setTotal_opcion(double total_opcion) {
        this.total_opcion = total_opcion;
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

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }
    
}

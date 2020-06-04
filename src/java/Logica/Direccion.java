package Logica;


public class Direccion {
    
    String direccion_general;
    String pais;
    String estado; 
    String codigo_postal;
    String correo_cliente;

    public Direccion() {
    }

    public Direccion(String direccion_general, String pais, String estado, String codigo_postal, String correo_cliente) {
        this.direccion_general = direccion_general;
        this.pais = pais;
        this.estado = estado;
        this.codigo_postal = codigo_postal;
        this.correo_cliente = correo_cliente;
    }

    public String getDireccion_general() {
        return direccion_general;
    }

    public void setDireccion_general(String direccion_general) {
        this.direccion_general = direccion_general;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCodigo_postal() {
        return codigo_postal;
    }

    public void setCodigo_postal(String codigo_postal) {
        this.codigo_postal = codigo_postal;
    }

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }
    
}

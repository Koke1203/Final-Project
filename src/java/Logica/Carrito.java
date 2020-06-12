package Logica;

import java.util.List;

public class Carrito {
    
    Platillo platillo;
    Adicional adicional_radio;
    Adicional adicional_check;
    List<Opcion> opcion_radio;
    List<Opcion> opcion_check;
    int cantidad;
    double precio_total;
    //String usuario_correo;

    public Carrito(Platillo platillo, Adicional adicional_radio, Adicional adicional_check, List<Opcion> opcion_radio, List<Opcion> opcion_check, int cantidad, double precio_total/*, String usuario_correo*/) {
        this.platillo = platillo;
        this.adicional_radio = adicional_radio;
        this.adicional_check = adicional_check;
        this.opcion_radio = opcion_radio;
        this.opcion_check = opcion_check;
        this.cantidad = cantidad;
        this.precio_total = precio_total;
        //this.usuario_correo = usuario_correo;
    }
    
    public Carrito(){}
    
    public Platillo getPlatillo() {
        return platillo;
    }
    
    public void setPlatillo(Platillo platillo) {
        this.platillo = platillo;
    }
    
    public int getCantidad() {
        return cantidad;
    }
    
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public double getPrecio_total() {
        return precio_total;
    }
    
    public void setPrecio_total(double precio_total) {
        this.precio_total = precio_total;
    }

    public List<Opcion> getOpcion_radio() {
        return opcion_radio;
    }

    public void setOpcion_radio(List<Opcion> opcion_radio) {
        this.opcion_radio = opcion_radio;
    }

    public List<Opcion> getOpcion_check() {
        return opcion_check;
    }

    public void setOpcion_check(List<Opcion> opcion_check) {
        this.opcion_check = opcion_check;
    }

    public Adicional getAdicional_radio() {
        return adicional_radio;
    }

    public void setAdicional_radio(Adicional adicional_radio) {
        this.adicional_radio = adicional_radio;
    }

    public Adicional getAdicional_check() {
        return adicional_check;
    }

    public void setAdicional_check(Adicional adicional_check) {
        this.adicional_check = adicional_check;
    }
    
}

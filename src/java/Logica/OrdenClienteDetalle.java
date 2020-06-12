package Logica;

import java.util.List;

public class OrdenClienteDetalle {
    
    Orden orden;
    List<CarritoOrden> detalles;
    
    public OrdenClienteDetalle() {
    }
    
    public OrdenClienteDetalle(Orden orden, List<CarritoOrden> detalles) {
        this.orden = orden;
        this.detalles = detalles;
    }

    public Orden getOrden() {
        return orden;
    }

    public void setOrden(Orden orden) {
        this.orden = orden;
    }

    public List<CarritoOrden> getDetalles() {
        return detalles;
    }
    
    public void setDetalles(List<CarritoOrden> detalles) {
        this.detalles = detalles;
    }
    
}

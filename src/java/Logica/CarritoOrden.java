package Logica;

import java.util.List;

public class CarritoOrden {
    
    Platillo platillo;
    List<Opcion> opciones;

    public CarritoOrden() {
    }

    public CarritoOrden(Platillo platillo, List<Opcion> opciones) {
        this.platillo = platillo;
        this.opciones = opciones;
    }

    public Platillo getPlatillo() {
        return platillo;
    }

    public void setPlatillo(Platillo platillo) {
        this.platillo = platillo;
    }

    public List<Opcion> getOpciones() {
        return opciones;
    }

    public void setOpciones(List<Opcion> opciones) {
        this.opciones = opciones;
    }
    
}

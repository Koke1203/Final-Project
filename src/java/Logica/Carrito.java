package Logica;

public class Carrito {
    
    Platillo platillo;
    int cantidad;
    double precio_total;
    
    public Carrito(Platillo platillo, int cantidad, double precio_total) {
        this.platillo = platillo;
        this.cantidad = cantidad;
        this.precio_total = precio_total;
    }
    
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
       
}

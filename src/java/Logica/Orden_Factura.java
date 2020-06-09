package Logica;

public class Orden_Factura {
    
    int tipo_entrega;
    double total_pagar;
    
    public Orden_Factura() {
    }
    
    public Orden_Factura(int tipo_entrega, double total_pagar) {
        this.tipo_entrega = tipo_entrega;
        this.total_pagar = total_pagar;
    }
    
    public int getTipo_entrega() {
        return tipo_entrega;
    }
    
    public void setTipo_entrega(int tipo_entrega) {
        this.tipo_entrega = tipo_entrega;
    }
    
    public double getTotal_pagar() {
        return total_pagar;
    }
    
    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }
    
}

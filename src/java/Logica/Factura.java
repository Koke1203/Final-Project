/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

/**
 *
 * @author jorge
 */
public class Factura {
    
    int codigo_factura;
    String fecha;
    double total_pagar;
    int tipo_pago;
    int fk_numero_pedido;

    public Factura() {
    }

    public Factura(int codigo_factura, String fecha, double total_pagar, int tipo_pago, int fk_numero_pedido) {
        this.codigo_factura = codigo_factura;
        this.fecha = fecha;
        this.total_pagar = total_pagar;
        this.tipo_pago = tipo_pago;
        this.fk_numero_pedido = fk_numero_pedido;
    }

    public int getCodigo_factura() {
        return codigo_factura;
    }

    public void setCodigo_factura(int codigo_factura) {
        this.codigo_factura = codigo_factura;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getTotal_pagar() {
        return total_pagar;
    }

    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }

    public int getTipo_pago() {
        return tipo_pago;
    }

    public void setTipo_pago(int tipo_pago) {
        this.tipo_pago = tipo_pago;
    }

    public int getFk_numero_pedido() {
        return fk_numero_pedido;
    }

    public void setFk_numero_pedido(int fk_numero_pedido) {
        this.fk_numero_pedido = fk_numero_pedido;
    }
    
    
    
}

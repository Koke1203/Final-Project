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
public class Orden {
    int codigo_orden;
    String nombre_cliente;
    int tipo_entrega;
    String hora;
    String fecha;
    String estado;
    int tipo_pago;
    double total_pagar;

    public Orden() {
    }

    public Orden(int codigo_orden, String nombre_cliente, int tipo_entrega, String hora, String fecha, String estado, int tipo_pago, double total_pagar) {
        this.codigo_orden = codigo_orden;
        this.nombre_cliente = nombre_cliente;
        this.tipo_entrega = tipo_entrega;
        this.hora = hora;
        this.fecha = fecha;
        this.estado = estado;
        this.tipo_pago = tipo_pago;
        this.total_pagar = total_pagar;
    }

    public int getCodigo_orden() {
        return codigo_orden;
    }

    public void setCodigo_orden(int codigo_orden) {
        this.codigo_orden = codigo_orden;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public int getTipo_entrega() {
        return tipo_entrega;
    }

    public void setTipo_entrega(int tipo_entrega) {
        this.tipo_entrega = tipo_entrega;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getTipo_pago() {
        return tipo_pago;
    }

    public void setTipo_pago(int tipo_pago) {
        this.tipo_pago = tipo_pago;
    }

    public double getTotal_pagar() {
        return total_pagar;
    }

    public void setTotal_pagar(double total_pagar) {
        this.total_pagar = total_pagar;
    }
    
    
    
    
}
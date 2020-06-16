/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.List;

public class CarritoDetalleOrden {
    OrdenClienteDetalle orden_cliente;
    String direccion;

    public CarritoDetalleOrden() {
    }

    public CarritoDetalleOrden(OrdenClienteDetalle orden_cliente, String direccion) {
        this.orden_cliente = orden_cliente;
        this.direccion = direccion;
    }

    public OrdenClienteDetalle getOrden_cliente() {
        return orden_cliente;
    }

    public void setOrden_cliente(OrdenClienteDetalle orden_cliente) {
        this.orden_cliente = orden_cliente;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
}

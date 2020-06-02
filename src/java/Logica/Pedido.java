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
public class Pedido {
    int numero_pedido;
    int tipo_pedido;
    int tipo_entrega;
    int fk_codigo_platillo;

    public Pedido() {
    }

    public Pedido(int numero_pedido, int tipo_pedido, int tipo_entrega, int fk_codigo_platillo) {
        this.numero_pedido = numero_pedido;
        this.tipo_pedido = tipo_pedido;
        this.tipo_entrega = tipo_entrega;
        this.fk_codigo_platillo = fk_codigo_platillo;
    }

    public int getNumero_pedido() {
        return numero_pedido;
    }

    public void setNumero_pedido(int numero_pedido) {
        this.numero_pedido = numero_pedido;
    }

    public int getTipo_pedido() {
        return tipo_pedido;
    }

    public void setTipo_pedido(int tipo_pedido) {
        this.tipo_pedido = tipo_pedido;
    }

    public int getTipo_entrega() {
        return tipo_entrega;
    }

    public void setTipo_entrega(int tipo_entrega) {
        this.tipo_entrega = tipo_entrega;
    }

    public int getFk_codigo_platillo() {
        return fk_codigo_platillo;
    }

    public void setFk_codigo_platillo(int fk_codigo_platillo) {
        this.fk_codigo_platillo = fk_codigo_platillo;
    }
    
    
    
}

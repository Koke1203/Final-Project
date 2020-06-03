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
public class Opcion {
    int codigo_opcion;
    String descripcion;
    double precio;

    public Opcion() {
    }

    public Opcion(int codigo_opcion, String descripcion, double precio) {
        this.codigo_opcion = codigo_opcion;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public int getCodigo_opcion() {
        return codigo_opcion;
    }

    public void setCodigo_opcion(int codigo_opcion) {
        this.codigo_opcion = codigo_opcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    
    
    
}

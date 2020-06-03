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
public class Adicional {
    int codigo_adicional;
    String descripcion;
    double precio;
    int multiple;

    public Adicional() {
    }

    public Adicional(int codigo_adicional, String descripcion, double precio, int multiple) {
        this.codigo_adicional = codigo_adicional;
        this.descripcion = descripcion;
        this.precio = precio;
        this.multiple = multiple;
    }

    public int getCodigo_adicional() {
        return codigo_adicional;
    }

    public void setCodigo_adicional(int codigo_adicional) {
        this.codigo_adicional = codigo_adicional;
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

    public int getMultiple() {
        return multiple;
    }

    public void setMultiple(int multiple) {
        this.multiple = multiple;
    }

   
    
    
    
}

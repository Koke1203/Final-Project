package Logica;

import java.util.HashMap;
import java.util.Map;

public class Orden {

    int codigo_orden;
    String nombre_cliente;
    int tipo_entrega;
    String hora;
    String fecha;
    String estado;
    int tipo_pago;
    double total_pagar;

    private static final Map<Integer, String> TIPO_ENTREGA = new HashMap<>();
    private static final Map<Integer, String> TIPO_PAGO = new HashMap<>();

    static {
        TIPO_ENTREGA.put(0, "Delivery");
        TIPO_ENTREGA.put(1, "Pick-up");
    }

    static {
        TIPO_PAGO.put(0, "Cash On Delivery");
        TIPO_PAGO.put(1, "PayPal Express");
        TIPO_PAGO.put(2, "Stripe Payment");
        TIPO_PAGO.put(3, "Mollie Payment");
        TIPO_PAGO.put(4, "Square Payment");
    }

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

    public String getTipoEntrega() {
        return TIPO_ENTREGA.get(getTipo_entrega());
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

    public String getTipoPago() {
        return TIPO_PAGO.get(getTipo_pago());
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

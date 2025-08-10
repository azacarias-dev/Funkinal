package model;

public class CompraDetalle {

    private int idCompra;
    private String nombreProducto;
    private double precioUnitario;
    private int cantidad;
    private double total;
    private String estado;  // Nuevo atributo

    // Constructor con nuevo atributo estado
    public CompraDetalle(String nombreProducto, double precioUnitario, int cantidad, double total, String estado) {
        this.nombreProducto = nombreProducto;
        this.precioUnitario = precioUnitario;
        this.cantidad = cantidad;
        this.total = total;
        this.estado = estado;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    // Getters
    public String getNombreProducto() {
        return nombreProducto;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public double getTotal() {
        return total;
    }

    public String getEstado() {
        return estado;
    }  // Getter para estado
}

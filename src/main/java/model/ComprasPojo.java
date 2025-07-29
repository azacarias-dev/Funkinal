package model;

import java.math.BigDecimal;
import java.util.Date;


public class ComprasPojo {

    private int idCompra;
    private int idUsuario;
    private Date fechaCompra;
    private BigDecimal total;
    private String metodoPago;
    private String estado;

    // Constructor vacío
    public ComprasPojo() {
    }

    // Constructor con lleno
    public ComprasPojo(int idCompra, int idUsuario, Date fechaCompra, BigDecimal total, String metodoPago, String estado) {
        this.idCompra = idCompra;
        this.idUsuario = idUsuario;
        this.fechaCompra = fechaCompra;
        this.total = total;
        this.metodoPago = metodoPago;
        this.estado = estado;
    }

    public ComprasPojo(int idUsuario, BigDecimal total, String metodoPago) {
        this.idUsuario = idUsuario;
        this.total = total;
        this.metodoPago = metodoPago;
        this.fechaCompra = new Date(); 
        this.estado = "Sin pagar"; 
    }

    // Getters y Setters
    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "ComprasPojo{" +
               "idCompra=" + idCompra +
               ", idUsuario=" + idUsuario +
               ", fechaCompra=" + fechaCompra +
               ", total=" + total +
               ", metodoPago='" + metodoPago + '\'' +
               ", estado='" + estado + '\'' +
               '}';
    }
}
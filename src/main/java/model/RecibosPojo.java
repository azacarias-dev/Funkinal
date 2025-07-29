package model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Recibos")
public class RecibosPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRecibo;

    @Column(name = "idCompra", nullable = false)
    private int idCompra;

    @Column(name = "fechaEmision", nullable = false)
    private Timestamp fechaEmision;

    @Column(name = "total", nullable = false)
    private BigDecimal total;

    @Column(name = "metodoPago", nullable = false)
    private String metodoPago;

    @Column(name = "estado")
    private String estado;

    public RecibosPojo() {
    }

    public RecibosPojo(int idCompra, Timestamp fechaEmision, BigDecimal total, String metodoPago, String estado) {
        this.idCompra = idCompra;
        this.fechaEmision = fechaEmision;
        this.total = total;
        this.metodoPago = metodoPago;
        this.estado = estado;
    }

    public int getIdRecibo() {
        return idRecibo;
    }

    public void setIdRecibo(int idRecibo) {
        this.idRecibo = idRecibo;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public Timestamp getFechaEmision() {
        return fechaEmision;
    }

    public void setFechaEmision(Timestamp fechaEmision) {
        this.fechaEmision = fechaEmision;
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
}

package model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "compras")
public class ComprasPojo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCompra")
    private int idCompra;

    @Column(name = "idusuario")
    private int idUsuario;

    @Temporal(TemporalType.DATE)
    @Column(name = "fechaCompra")
    private Date fechaCompra;

    @Column(name = "total")
    private BigDecimal total;

    @Column(name = "metodoPago")
    private String metodoPago;

    @Column(name = "estado")
    private String estado;

    public ComprasPojo() {
    }

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
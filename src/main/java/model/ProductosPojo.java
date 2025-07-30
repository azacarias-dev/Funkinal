package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Lendrock
 */
@Entity(name = "Productos")
@Table(name = "productos")
public class ProductosPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idProducto;
    @Column(name = "idCategoria")
    private int idCategoria; 
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "precio")
    private double precio;
    @Column(name = "descripcion")
    private String descripcion;
    @Column(name = "stock")
    private int stock;
    @Column(name = "estado")
    private String estado;

    public ProductosPojo(int idCategoria, String nombre, double precio, String descripcion, int stock, String estado) {
        this.idCategoria = idCategoria;
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.stock = stock;
        this.estado = estado;
    }

    public ProductosPojo(String nombre, double precio, String descripcion, int stock, String estado) {
        this.nombre = nombre;
        this.precio = precio;
        this.descripcion = descripcion;
        this.stock = stock;
        this.estado = estado;
    }

    public ProductosPojo() {
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}

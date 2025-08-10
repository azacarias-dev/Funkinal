package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.CompraDetalle;

public class ComprasDao {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("funkinalPU");

    public void guardar(ComprasPojo compra) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.persist(compra);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al guardar compra: " + e.getMessage());
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public List<ComprasPojo> listarTodas() {
        String jpql = "SELECT c FROM ComprasPojo c";
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery(jpql, ComprasPojo.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public ComprasPojo buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(ComprasPojo.class, id);
        } finally {
            admin.close();
        }
    }

    public void actualizar(ComprasPojo compra) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.merge(compra);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al actualizar compra " + e.getMessage());
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public void eliminar(int id) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            ComprasPojo compra = admin.find(ComprasPojo.class, id);
            if (compra != null) {
                admin.remove(compra);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al eliminar compra" + e.getMessage());
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public List<CompraDetalle> obtenerComprasPorUsuario(int idUsuario) throws SQLException {
        List<CompraDetalle> listaCompras = new ArrayList<>();

        String sql = "SELECT p.nombre AS nombreProducto, dc.precioUnitario, dc.cantidad, "
                + "(dc.precioUnitario * dc.cantidad) AS total, dc.estado "
                + "FROM detalleCompras dc "
                + "JOIN compras c ON dc.idCompra = c.idCompra "
                + "JOIN productos p ON dc.idProducto = p.idProducto "
                + "WHERE c.idUsuario = ? AND c.estado = 'Pagado'";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/FunKinal_DB?useSSL=false&allowPublicKeyRetrieval=true",
                "quintom", "admin"); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String nombreProducto = rs.getString("nombreProducto");
                    double precioUnitario = rs.getDouble("precioUnitario");
                    int cantidad = rs.getInt("cantidad");
                    double total = rs.getDouble("total");
                    String estado = rs.getString("estado");

                    CompraDetalle detalle = new CompraDetalle(nombreProducto, precioUnitario, cantidad, total, estado);
                    listaCompras.add(detalle);
                }
            }
        }

        return listaCompras;
    }

    public List<CompraDetalle> obtenerComprasSinPagarPorUsuario(int idUsuario) throws SQLException {
        List<CompraDetalle> listaCarrito = new ArrayList<>();

        String sql = "SELECT p.nombre AS nombreProducto, dc.precioUnitario, dc.cantidad, "
                + "(dc.precioUnitario * dc.cantidad) AS total, dc.estado, c.idCompra "
                + "FROM detalleCompras dc "
                + "JOIN compras c ON dc.idCompra = c.idCompra "
                + "JOIN productos p ON dc.idProducto = p.idProducto "
                + "WHERE c.idUsuario = ? AND c.estado = 'Sin pagar'";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/FunKinal_DB?useSSL=false&allowPublicKeyRetrieval=true",
                "quintom", "admin"); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String nombreProducto = rs.getString("nombreProducto");
                    double precioUnitario = rs.getDouble("precioUnitario");
                    int cantidad = rs.getInt("cantidad");
                    double total = rs.getDouble("total");
                    String estado = rs.getString("estado");
                    int idCompra = rs.getInt("idCompra");

                    CompraDetalle detalle = new CompraDetalle(nombreProducto, precioUnitario, cantidad, total, estado);
                    detalle.setIdCompra(idCompra);
                    listaCarrito.add(detalle);
                }
            }
        }
        return listaCarrito;
    }

    public boolean cancelarCompra(int idCompra) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            ComprasPojo compra = admin.find(ComprasPojo.class, idCompra);
            if (compra != null) {
                compra.setEstado("Cancelado");  // Asumiendo que tienes setEstado en ComprasPojo
                admin.merge(compra);
                transaccion.commit();
                return true;
            } else {
                transaccion.rollback();
                return false;
            }
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            admin.close();
        }
    }

}
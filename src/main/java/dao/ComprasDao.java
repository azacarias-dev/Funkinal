package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.ComprasPojo;

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
}
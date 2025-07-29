package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.RecibosPojo;

public class RecibosDao {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("libreriaPU");

    public void guardar(RecibosPojo recibo) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.persist(recibo);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public List<RecibosPojo> listarTodos() {
        String jpql = "SELECT r FROM Recibos r";
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery(jpql, RecibosPojo.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public RecibosPojo buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(RecibosPojo.class, id);
        } finally {
            admin.close();
        }
    }

    public void Actualizar(RecibosPojo recibo) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            admin.merge(recibo);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }

    public void Eliminar(int id) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
        try {
            transaccion.begin();
            RecibosPojo recibo = admin.find(RecibosPojo.class, id);
            if (recibo != null) {
                admin.remove(recibo);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
            e.printStackTrace();
        } finally {
            admin.close();
        }
    }
}

package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.CategoriasPojo;

/**
 * DAO para la entidad CategoriasPojo
 Realiza operaciones CRUD usando JPA
 */
public class CategoriasDao {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("funkinalPU");

    public void guardar(CategoriasPojo categoria) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();

        try {
            transaccion.begin();
            admin.persist(categoria);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
        } finally {
            admin.close();
        }
    }

    public List<CategoriasPojo> listarTodas() {
        String jpql = "SELECT c FROM CategoriasPojo c";
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery(jpql, CategoriasPojo.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public CategoriasPojo buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(CategoriasPojo.class, id);
        } finally {
            admin.close();
        }
    }

    public void actualizar(CategoriasPojo categoria) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();

        try {
            transaccion.begin();
            admin.merge(categoria);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
        } finally {
            admin.close();
        }
    }

    public void eliminar(int id) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();

        try {
            transaccion.begin();
            CategoriasPojo categoria = admin.find(CategoriasPojo.class, id);
            if (categoria != null) {
                admin.remove(categoria);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
        } finally {
            admin.close();
        }
    }
}

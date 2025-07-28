package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.Categoria;

/**
 * DAO para la entidad Categoria
 * Realiza operaciones CRUD usando JPA
 */
public class CategoriaDao {

    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("funkinalPU");

    public void guardar(Categoria categoria) {
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

    public List<Categoria> listarTodas() {
        String jpql = "SELECT c FROM Categoria c";
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery(jpql, Categoria.class).getResultList();
        } finally {
            admin.close();
        }
    }

    public Categoria buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(Categoria.class, id);
        } finally {
            admin.close();
        }
    }

    public void actualizar(Categoria categoria) {
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
            Categoria categoria = admin.find(Categoria.class, id);
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

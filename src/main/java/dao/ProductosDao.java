package dao;
 
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.ProductosPojo;
 
/**
* DAO para la entidad Categoria
* Realiza operaciones CRUD usando JPA
* @author Lendrock
*/
 
public class ProductosDao {
 
    private EntityManagerFactory fabrica = Persistence.createEntityManagerFactory("funkinalPU");
 
    public void guardar(ProductosPojo producto) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
 
        try {
            transaccion.begin();
            admin.persist(producto);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al guardar producto: " + e.getMessage());
        } finally {
            admin.close();
        }
    }
 
    public List<ProductosPojo> listarTodas() {
        String jpql = "SELECT p FROM Productos p";
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.createQuery(jpql, ProductosPojo.class).getResultList();
        } finally {
            admin.close();
        }
    }
 
    public ProductosPojo buscarPorId(int id) {
        EntityManager admin = fabrica.createEntityManager();
        try {
            return admin.find(ProductosPojo.class, id);
        } finally {
            admin.close();
        }
    }
 
    public void actualizar(ProductosPojo producto) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
 
        try {
            transaccion.begin();
            admin.merge(producto);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al actualizar producto: " + e.getMessage());
        } finally {
            admin.close();
        }
    }
 
    public void eliminar(int id) {
        EntityManager admin = fabrica.createEntityManager();
        EntityTransaction transaccion = admin.getTransaction();
 
        try {
            transaccion.begin();
            ProductosPojo producto = admin.find(ProductosPojo.class, id);
            if (producto != null) {
                admin.remove(producto);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al eliminar producto: " + e.getMessage());
        } finally {
            admin.close();
        }
    }
}
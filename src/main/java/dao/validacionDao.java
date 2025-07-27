/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import model.UsuariosPojo;
/**
 *
 * @author informatica
 */
public class validacionDao {
    
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("funkinalPU");
    
    public void agregar(UsuariosPojo usuario){
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();
        
        try {
            transaccion.begin();
            em.persist(usuario);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) {
                transaccion.rollback();
            }
            System.err.println("Error al agregar usuario: " + e.getMessage());
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    public UsuariosPojo buscarPorCorreo(String correo) {
        EntityManager em = emf.createEntityManager();
        UsuariosPojo usuario = null;

        try {
            TypedQuery<UsuariosPojo> query = em.createQuery("SELECT u FROM Usuarios u WHERE u.correo = :correo", UsuariosPojo.class);
            query.setParameter("correo", correo);

            usuario = query.getSingleResult();
        } catch (NoResultException e) {
            usuario = null;
        } catch (Exception e) {
            System.err.println("Error inesperado en buscarPorCorreo: " + e.getMessage());
            e.printStackTrace();
            usuario = null;
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
        return usuario;
    }
}
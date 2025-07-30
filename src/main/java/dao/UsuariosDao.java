/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import model.UsuariosPojo;

/**
 *
 * @author informatica
 */
public class UsuariosDao {
    
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
    
    public List<UsuariosPojo> listarUsuarios(){
        String jpql = "SELECT u FROM Usuarios u WHERE u.estado = 'Activo'";
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery(jpql, UsuariosPojo.class).getResultList();
            
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            em.close();
        }
        return new ArrayList<>();
    }
    
    public UsuariosPojo buscarPorId(int id){
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(UsuariosPojo.class, id);
        } finally {
            em.close();
        }
    }
    
    public void actualizar(UsuariosPojo usuario){
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();
        try {
            transaccion.begin();
            em.merge(usuario);
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
        }finally {
            em.close();
        }
    }
    
    public void eliminar(int id){
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaccion = em.getTransaction();
        try {
            transaccion.begin();
            UsuariosPojo usuarios = em.find(UsuariosPojo.class, id);
            if (usuarios != null){
                usuarios.setEstado("Inactivo");
                em.merge(usuarios);
            }
            transaccion.commit();
        } catch (Exception e) {
            if (transaccion.isActive()) transaccion.rollback();
        }finally {
            em.close();
        }          
    }
}

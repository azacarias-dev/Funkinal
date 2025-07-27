package web;

import dao.validacionDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jbcrypt.Encriptar;
import model.UsuariosPojo;

@WebServlet(name = "ServletRegistrar",urlPatterns = {"/ServletRegistrar"})
public class ServletRegistro extends HttpServlet{
    
    
    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException{
        
        Encriptar e = new Encriptar();
        UsuariosPojo u = new UsuariosPojo();
        u.setContrasena(e.encriptar(solicitud.getParameter("password")));
        
        u.setNombre(solicitud.getParameter("nombre"));
        u.setApellido(solicitud.getParameter("apellido"));
        u.setCorreo(solicitud.getParameter("correo"));
        u.setTelefono(solicitud.getParameter("telefono"));
        
        
        validacionDao vdao = new validacionDao();
        vdao.agregar(u);
        
        solicitud.getRequestDispatcher("index.jsp").forward(solicitud, respuesta);
        
    }
}
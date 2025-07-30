package web;

import dao.validacionDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jbcrypt.Encriptar;
import model.UsuariosPojo;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        String correo = solicitud.getParameter("correo");
        String contrasenaIngresada = solicitud.getParameter("contrasena");

        validacionDao vdao = new validacionDao();
        UsuariosPojo usuario = vdao.buscarPorCorreo(correo);

        if (usuario != null) {
            String contrasenaHasheadaAlmacenada = usuario.getContrasena();
            
            boolean contrasenaCoincide = Encriptar.verificarContrasena(contrasenaIngresada, contrasenaHasheadaAlmacenada);

            if (contrasenaCoincide) {
                HttpSession session = solicitud.getSession();
                session.setAttribute("usuarioLogueado", usuario);
                session.setAttribute("nombreUsuario", usuario.getNombre());
                
                respuesta.sendRedirect("MenuAdministradores.jsp"); 
            } else {
                solicitud.setAttribute("mensajeError", "Contraseña incorrecta. Inténtalo de nuevo.");
                solicitud.getRequestDispatcher("login.jsp").forward(solicitud, respuesta);
            }
        } else {
            solicitud.setAttribute("mensajeError", "El correo electrónico no está registrado.");
            solicitud.getRequestDispatcher("login.jsp").forward(solicitud, respuesta);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
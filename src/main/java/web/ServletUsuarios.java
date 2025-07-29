/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package web;

import dao.UsuariosDao;
import dao.validacionDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jbcrypt.Encriptar;
import model.UsuariosPojo;

/**
 *
 * @author informatica
 */
@WebServlet(name = "ServletUsuarios", urlPatterns = "/ServletUsuarios")
public class ServletUsuarios extends HttpServlet {

    UsuariosDao dao = new UsuariosDao();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {

        String accion = solicitud.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {
            case "listar":
                listarUsuarios(solicitud, respuesta);
                break;

            case "editar":
                editarUsuario(solicitud, respuesta);
                break;

            case "eliminar":
                eliminarUsuario(solicitud, respuesta);
                break;
            default:
                listarUsuarios(solicitud, respuesta);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        String accion = solicitud.getParameter("accion");

        switch (accion) {
            case "editar":
                editarUsuario(solicitud, respuesta);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void listarUsuarios(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        List<UsuariosPojo> listaUsuarios = dao.listarUsuarios();
        solicitud.setAttribute("usuarioListar", listaUsuarios);
        solicitud.getRequestDispatcher("usuarios.jsp").forward(solicitud, respuesta);
    }

    private void mostrarFormEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        int id = Integer.parseInt(solicitud.getParameter("id"));
        UsuariosPojo u = dao.buscarPorId(id);

        solicitud.setAttribute("usuarioEditar", u);
        solicitud.getRequestDispatcher("usuariosEditar.jsp").forward(solicitud, respuesta);
    }

    private void editarUsuario(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        int id = Integer.parseInt(solicitud.getParameter("id"));
        UsuariosPojo usuarios = new UsuariosPojo();
        usuarios = dao.buscarPorId(id);
        usuarios.setNombre(solicitud.getParameter("nombre"));
        usuarios.setApellido(solicitud.getParameter("apellido"));
        usuarios.setCorreo(solicitud.getParameter("correo"));
        usuarios.setTelefono(solicitud.getParameter("telefono"));

        dao.actualizar(usuarios);
        respuesta.sendRedirect("ServletUsuarios");
    }

    private void eliminarUsuario(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        int id = Integer.parseInt(solicitud.getParameter("id"));
        dao.eliminar(id);
        respuesta.sendRedirect("ServletUsuarios");
    }
}

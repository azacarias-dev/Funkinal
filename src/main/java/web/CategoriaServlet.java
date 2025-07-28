package web;

import dao.CategoriaDao;
import model.Categoria;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoriaServlet", urlPatterns = {"/CategoriaServlet"})
public class CategoriaServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) accion = "listar";

        CategoriaDao dao = new CategoriaDao();

        switch (accion) {
            case "listar":
                List<Categoria> lista = dao.listarTodas();
                request.setAttribute("listaCategorias", lista);
                request.getRequestDispatcher("listarCategorias.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Categoria categoriaEditar = dao.buscarPorId(idEditar);
                request.setAttribute("categoriaEditar", categoriaEditar);
                request.getRequestDispatcher("editarCategoria.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("CategoriaServlet?accion=listar");
                break;

            default:
                response.sendRedirect("CategoriaServlet?accion=listar");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        CategoriaDao dao = new CategoriaDao();

        switch (accion) {
            case "insertar":
                Categoria nueva = new Categoria();
                nueva.setNombre(request.getParameter("nombre"));
                nueva.setDescripcion(request.getParameter("descripcion"));
                dao.guardar(nueva);
                response.sendRedirect("CategoriaServlet?accion=listar");
                break;

            case "actualizar":
                int idActualizar = Integer.parseInt(request.getParameter("id"));
                Categoria categoria = dao.buscarPorId(idActualizar);
                categoria.setNombre(request.getParameter("nombre"));
                categoria.setDescripcion(request.getParameter("descripcion"));
                dao.actualizar(categoria);
                response.sendRedirect("CategoriaServlet?accion=listar");
                break;

            default:
                response.sendRedirect("CategoriaServlet?accion=listar");
        }
    }
}

package web;
 
import dao.ProductosDao;
import model.ProductosPojo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
 
/**
*
* @author informatica
*/
@WebServlet(name = "ServletProductos", urlPatterns = {"/ServletProductos"})
public class ServletProductos extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }
 
        ProductosDao dao = new ProductosDao();
 
        switch (accion) {
            case "listar":
                List<ProductosPojo> lista = dao.listarTodas();
                request.setAttribute("listaProductos", lista);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
                break;
 
            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                ProductosPojo productoEditar = dao.buscarPorId(idEditar);
                request.setAttribute("productoEditar", productoEditar);
                request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
                break;
 
            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("ServletProductos?accion=listar");
                break;
 
            default:
                response.sendRedirect("ServletProductos?accion=listar");
        }
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String accion = request.getParameter("accion");
        ProductosDao dao = new ProductosDao();
 
        switch (accion) {
            case "insertar":
                ProductosPojo nuevoProducto = new ProductosPojo();
                nuevoProducto.setNombre(request.getParameter("nombre"));
                nuevoProducto.setPrecio(Double.parseDouble(request.getParameter("precio")));
                nuevoProducto.setDescripcion(request.getParameter("descripcion"));
                nuevoProducto.setStock(Integer.parseInt(request.getParameter("stock")));
                nuevoProducto.setEstado(request.getParameter("estado"));
                dao.guardar(nuevoProducto);
                response.sendRedirect("ServletProductos?accion=listar");
                break;
 
            case "actualizar":
                int idActualizar = Integer.parseInt(request.getParameter("idProducto"));
                ProductosPojo productoExistente = dao.buscarPorId(idActualizar);
 
                if (productoExistente != null) {
                    productoExistente.setNombre(request.getParameter("nombre"));
                    productoExistente.setPrecio(Double.parseDouble(request.getParameter("precio")));
                    productoExistente.setDescripcion(request.getParameter("descripcion"));
                    productoExistente.setStock(Integer.parseInt(request.getParameter("stock")));
                    productoExistente.setEstado(request.getParameter("estado"));
                    dao.actualizar(productoExistente);
                }
                response.sendRedirect("ServletProductos?accion=listar");
                break;
 
            default:
                response.sendRedirect("ServletProductos?accion=listar");
        }
    }
}
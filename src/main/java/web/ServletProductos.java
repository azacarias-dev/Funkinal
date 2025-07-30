package web;

import dao.CategoriasDao; 
import dao.ProductosDao;
import model.CategoriasPojo; 
import model.ProductosPojo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap; 
import java.util.List;
import java.util.Map; 
/**
 *
 * @author Lendrock
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

        ProductosDao productosDao = new ProductosDao();
        CategoriasDao categoriasDao = new CategoriasDao(); 

        switch (accion) {
            case "listar":
                List<ProductosPojo> listaProductos = productosDao.listarTodas();
                List<CategoriasPojo> todasLasCategorias = categoriasDao.listarTodas(); 

                
                Map<Integer, String> mapaCategorias = new HashMap<>();
                for (CategoriasPojo categoria : todasLasCategorias) {
                    mapaCategorias.put(categoria.getIdCategoria(), categoria.getNombre());
                }

                request.setAttribute("listaProductos", listaProductos);
                request.setAttribute("mapaCategorias", mapaCategorias); 
                request.getRequestDispatcher("productos.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                ProductosPojo productoEditar = productosDao.buscarPorId(idEditar);
                List<CategoriasPojo> listaCategoriasEditar = categoriasDao.listarTodas(); 
                request.setAttribute("productoEditar", productoEditar);
                request.setAttribute("listaCategorias", listaCategoriasEditar); 
                request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
                break;

            case "agregar": 
                List<CategoriasPojo> listaCategoriasAgregar = categoriasDao.listarTodas(); 
                request.setAttribute("listaCategorias", listaCategoriasAgregar); 
                request.getRequestDispatcher("agregarProducto.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                productosDao.eliminar(idEliminar);
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
        ProductosDao productosDao = new ProductosDao();

        switch (accion) {
            case "insertar":
                ProductosPojo nuevoProducto = new ProductosPojo();
                nuevoProducto.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
                nuevoProducto.setNombre(request.getParameter("nombre"));
                nuevoProducto.setPrecio(Double.parseDouble(request.getParameter("precio")));
                nuevoProducto.setDescripcion(request.getParameter("descripcion"));
                nuevoProducto.setStock(Integer.parseInt(request.getParameter("stock")));
                nuevoProducto.setEstado(request.getParameter("estado"));
                productosDao.guardar(nuevoProducto);
                response.sendRedirect("ServletProductos?accion=listar");
                break;

            case "actualizar":
                int idActualizar = Integer.parseInt(request.getParameter("idProducto"));
                ProductosPojo productoExistente = productosDao.buscarPorId(idActualizar);

                if (productoExistente != null) {
                    productoExistente.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
                    productoExistente.setNombre(request.getParameter("nombre"));
                    productoExistente.setPrecio(Double.parseDouble(request.getParameter("precio")));
                    productoExistente.setDescripcion(request.getParameter("descripcion"));
                    productoExistente.setStock(Integer.parseInt(request.getParameter("stock")));
                    productoExistente.setEstado(request.getParameter("estado"));
                    productosDao.actualizar(productoExistente);
                }
                response.sendRedirect("ServletProductos?accion=listar");
                break;

            default:
                response.sendRedirect("ServletProductos?accion=listar");
        }
    }
}

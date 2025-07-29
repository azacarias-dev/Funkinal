package web;

import dao.ComprasDao;
import model.ComprasPojo;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.List;
import java.math.BigDecimal; 

@WebServlet(name = "ServletCompras", urlPatterns = {"/ServletCompras"})
public class ServletCompras extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        ComprasDao dao = new ComprasDao();

        switch (accion) {
            case "listar":
                List<ComprasPojo> lista = dao.listarTodas();
                request.setAttribute("listaCompras", lista);
                request.getRequestDispatcher("listarCompras.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                ComprasPojo compraEditar = dao.buscarPorId(idEditar);
                request.setAttribute("compraEditar", compraEditar);
                request.getRequestDispatcher("editarCompra.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("ServletCompras?accion=listar");
                break;

            default:
                response.sendRedirect("ServletCompras?accion=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        ComprasDao dao = new ComprasDao();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        switch (accion) {
            case "insertar":
                ComprasPojo nuevaCompra = new ComprasPojo();
                try {
                    nuevaCompra.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                    
                    Date fecha = formatter.parse(request.getParameter("fechaCompra"));
                    nuevaCompra.setFechaCompra(fecha);
                    
                    // Usar BigDecimal.valueOf() para convertir double a BigDecimal
                    nuevaCompra.setTotal(BigDecimal.valueOf(Double.parseDouble(request.getParameter("total"))));
                    
                    nuevaCompra.setMetodoPago(request.getParameter("metodoPago"));
                    nuevaCompra.setEstado(request.getParameter("estado"));
                    
                    dao.guardar(nuevaCompra);
                } catch (ParseException e) {
                    System.err.println("Error al parsear la fecha: " + e.getMessage());
                } catch (NumberFormatException e) {
                    System.err.println("Error de formato de número en los parámetros: " + e.getMessage());
                }
                response.sendRedirect("ServletCompras?accion=listar");
                break;

            case "actualizar":
                int idActualizar = Integer.parseInt(request.getParameter("idCompra"));
                ComprasPojo compraExistente = dao.buscarPorId(idActualizar);

                if (compraExistente != null) {
                    try {
                        compraExistente.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                        
                        Date fecha = formatter.parse(request.getParameter("fechaCompra"));
                        compraExistente.setFechaCompra(fecha);
                        
                        compraExistente.setTotal(BigDecimal.valueOf(Double.parseDouble(request.getParameter("total"))));
                        
                        compraExistente.setMetodoPago(request.getParameter("metodoPago"));
                        compraExistente.setEstado(request.getParameter("estado"));
                        
                        dao.actualizar(compraExistente);
                    } catch (ParseException e) {
                        System.err.println("Error al parsear la fecha para actualización: " + e.getMessage());
                    } catch (NumberFormatException e) {
                        System.err.println("Error de formato de número en los parámetros de actualización: " + e.getMessage());
                    }
                }
                response.sendRedirect("ServletCompras?accion=listar");
                break;

            default:
                response.sendRedirect("ServletCompras?accion=listar");
        }
    }
}
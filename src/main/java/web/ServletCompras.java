package web;

import dao.ComprasDao;
import model.CompraDetalle;
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
import java.sql.SQLException;

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
                request.getRequestDispatcher("Compras.jsp").forward(request, response);
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                ComprasPojo compraEditar = dao.buscarPorId(idEditar);
                request.setAttribute("compraEditar", compraEditar);
                request.getRequestDispatcher("editarCompras.jsp").forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("ServletCompras?accion=listar");
                break;

            case "verComprasUsuario":
                Integer idUsuario = (Integer) request.getSession().getAttribute("idUsuario");
                if (idUsuario == null) {
                    response.sendRedirect("login.jsp");
                    return;
                }

                try {
                    List<CompraDetalle> compras = dao.obtenerComprasPorUsuario(idUsuario);
                    request.setAttribute("listaCompras", compras);
                    request.getRequestDispatcher("ComprasModal.jsp").forward(request, response); // <-- solo la modal
                } catch (SQLException e) {
                    throw new ServletException("Error al obtener las compras", e);
                }
                break;

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

                    nuevaCompra.setTotal(BigDecimal.valueOf(Double.parseDouble(request.getParameter("total"))));

                    nuevaCompra.setMetodoPago(request.getParameter("metodoPago"));
                    nuevaCompra.setEstado(request.getParameter("estado"));

                    dao.guardar(nuevaCompra);
                } catch (ParseException | NumberFormatException e) {
                    System.err.println("Error al insertar compra: " + e.getMessage());
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
                    } catch (ParseException | NumberFormatException e) {
                        System.err.println("Error al actualizar compra: " + e.getMessage());
                    }
                }
                response.sendRedirect("ServletCompras?accion=listar");
                break;

            default:
                response.sendRedirect("ServletCompras?accion=listar");
        }
    }
}
package web;

import dao.RecibosDao;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.RecibosPojo;

@WebServlet(name = "ServletRecibos", urlPatterns = {"/ServletRecibos"})
public class ServletRecibos extends HttpServlet {

    private RecibosDao recibosDao = new RecibosDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                listarRecibos(request, response);
                break;
            case "eliminar":
                eliminarRecibo(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            default:
                listarRecibos(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        switch (action) {
            case "agregar":
                agregarRecibo(request, response);
                break;
            case "actualizar":
                actualizarRecibo(request, response);
                break;
            default:
                listarRecibos(request, response);
                break;
        }
    }

    private void listarRecibos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<RecibosPojo> lista = recibosDao.listarTodos();
        request.setAttribute("listaRecibos", lista);
        request.getRequestDispatcher("Recibos.jsp").forward(request, response);
    }

private void agregarRecibo(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        int idCompra = Integer.parseInt(request.getParameter("idCompra"));

        String fechaParam = request.getParameter("fechaEmision");
        Timestamp fechaEmision;
        if (fechaParam == null || fechaParam.isEmpty()) {
            fechaEmision = new Timestamp(System.currentTimeMillis());
        } else {
            fechaEmision = Timestamp.valueOf(fechaParam);
        }

        int totalEntero = Integer.parseInt(request.getParameter("total"));
        BigDecimal total = new BigDecimal(totalEntero);

        String metodoPago = request.getParameter("metodoPago");
        String estado = "Emitido";

        RecibosPojo r = new RecibosPojo(idCompra, total, metodoPago, estado);
        r.setFechaEmision(fechaEmision);

        recibosDao.guardar(r);

        response.sendRedirect("ServletRecibos?action=listar");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("ServletRecibos?action=listar");
    }
}


    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idRecibo = Integer.parseInt(request.getParameter("idRecibo"));
        RecibosPojo recibo = recibosDao.buscarPorId(idRecibo);
        request.setAttribute("recibo", recibo);  
        request.getRequestDispatcher("editarRecibo.jsp").forward(request, response);
    }


private void actualizarRecibo(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        int idRecibo = Integer.parseInt(request.getParameter("idRecibo"));
        int idCompra = Integer.parseInt(request.getParameter("idCompra"));
        BigDecimal total = new BigDecimal(request.getParameter("total"));
        String metodoPago = request.getParameter("metodoPago");
        String estado = request.getParameter("estado");

        // Obtener fecha original para no perderla
        RecibosPojo existente = recibosDao.buscarPorId(idRecibo);
        Timestamp fechaEmision = (existente != null) ? existente.getFechaEmision() : new Timestamp(System.currentTimeMillis());

        RecibosPojo r = new RecibosPojo(idCompra, total, metodoPago, estado);
        r.setIdRecibo(idRecibo);
        r.setFechaEmision(fechaEmision);

        recibosDao.Actualizar(r);

        response.sendRedirect("ServletRecibos?action=listar");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("ServletRecibos?action=listar");
    }
}


    private void eliminarRecibo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idRecibo = Integer.parseInt(request.getParameter("idRecibo"));
        recibosDao.Eliminar(idRecibo);
        response.sendRedirect("ServletRecibos?action=listar");
    }
}

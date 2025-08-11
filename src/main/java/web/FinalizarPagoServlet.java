package web;

import dao.ComprasDao;
import model.ComprasPojo;
import model.UsuariosPojo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/FinalizarPagoServlet")
public class FinalizarPagoServlet extends HttpServlet {

    private ComprasDao comprasDao = new ComprasDao();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        String idCompraStr = req.getParameter("idCompra");
        String metodoPago = req.getParameter("pago"); // <-- capturamos el método de pago

        if (idCompraStr == null || accion == null || metodoPago == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Faltan parámetros.");
            return;
        }

        int idCompra = Integer.parseInt(idCompraStr);

        try {
            if (accion.equals("pagar")) {
                ComprasPojo compra = comprasDao.buscarPorId(idCompra);
                if (compra != null) {
                    compra.setEstado("Pagado");
                    compra.setMetodoPago(metodoPago);  // <-- seteamos el método de pago
                    comprasDao.actualizar(compra);
                }
            } else if (accion.equals("cancelar")) {
                comprasDao.eliminar(idCompra);
            }

            resp.sendRedirect("Catalogo/inicio.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error al procesar la acción.");
        }
    }

}

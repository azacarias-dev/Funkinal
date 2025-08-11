package web;

import dao.ComprasDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.ComprasPojo;
import model.UsuariosPojo;

@WebServlet("/ProcesarCompraServlet")
public class ProcesarCompraServlet extends HttpServlet {

    private ComprasDao comprasDao = new ComprasDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            // Usuario no logueado, redirigir a login
            resp.sendRedirect("login.jsp");
            return;
        }

        String idCompraStr = req.getParameter("idCompra");
        if (idCompraStr == null || idCompraStr.isEmpty()) {
            // No hay idCompra, redirigir al carrito o donde prefieras
            resp.sendRedirect("CarritoServlet");
            return;
        }

        int idCompra;
        try {
            idCompra = Integer.parseInt(idCompraStr);
        } catch (NumberFormatException e) {
            // idCompra no es válido, redirigir al carrito
            resp.sendRedirect("CarritoServlet");
            return;
        }

        ComprasPojo compra = comprasDao.buscarPorId(idCompra);
        UsuariosPojo usuario = (UsuariosPojo) session.getAttribute("usuarioLogueado");

        if (compra == null || usuario == null || compra.getIdUsuario() != usuario.getIdUsuario()) {
            resp.sendRedirect("CarritoServlet");
            return;
        }

        // Pasar idCompra a JSP para mostrar info y botón pagar/cancelar
        req.setAttribute("idCompra", idCompra);
        req.getRequestDispatcher("PagoDelProducto.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("usuarioLogueado") == null) {
            // Usuario no logueado
            resp.sendRedirect("login.jsp");
            return;
        }

        String accion = req.getParameter("accion");
        String idCompraStr = req.getParameter("idCompra");

        if (idCompraStr == null || idCompraStr.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de compra no proporcionado");
            return;
        }

        int idCompra;
        try {
            idCompra = Integer.parseInt(idCompraStr);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de compra inválido");
            return;
        }

        UsuariosPojo usuario = (UsuariosPojo) session.getAttribute("usuarioLogueado");
        ComprasPojo compra = comprasDao.buscarPorId(idCompra);

        if (compra == null || usuario == null || compra.getIdUsuario() != usuario.getIdUsuario()) {
            resp.sendRedirect("CarritoServlet");
            return;
        }

        if ("cancelar".equalsIgnoreCase(accion)) {
            boolean exito = comprasDao.cancelarCompra(idCompra);
            if (exito) {
                req.setAttribute("mensaje", "Compra cancelada correctamente.");
                req.getRequestDispatcher("CompraCancelada.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo cancelar la compra.");
            }
        } else if ("pagar".equalsIgnoreCase(accion)) {
            // Aquí va la lógica para procesar el pago
            // Ejemplo: cambiar estado a "Pagado", actualizar stock, etc.

            // Para ejemplo simple:
            compra.setEstado("Pagado");
            comprasDao.actualizar(compra);

            req.setAttribute("mensaje", "Compra realizada con éxito.");
            req.getRequestDispatcher("CompraExitosa.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida");
        }
    }
}

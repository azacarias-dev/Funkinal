
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

/**
 *
 * @author PC
 */
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

        // Pasar idCompra a JSP
        req.setAttribute("idCompra", idCompra);
        req.getRequestDispatcher("PagoDelProducto.jsp").forward(req, resp);
    }
}

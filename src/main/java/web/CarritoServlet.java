/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import dao.ComprasDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CompraDetalle;

/**
 *
 * @author PC
 */
@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {
    // Supón que tienes un método DAO similar a obtenerComprasPorUsuario, pero filtrando 'Sin pagar'

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("idUsuario") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int idUsuario = (int) session.getAttribute("idUsuario");
        ComprasDao dao = new ComprasDao();

        try {
            // Método nuevo que obtenga compras con estado 'Sin pagar'
            List<CompraDetalle> listaCarrito = dao.obtenerComprasSinPagarPorUsuario(idUsuario);
            req.setAttribute("listaCarrito", listaCarrito);
            req.getRequestDispatcher("carritoContenido.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("Error al cargar el carrito.");
        }
    }
}

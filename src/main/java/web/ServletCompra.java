package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.*;
import javax.annotation.Resource;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

@WebServlet("/ServletCompra")
public class ServletCompra extends HttpServlet {

    @Resource(name = "jdbc/fun")
    private DataSource ds;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");  // importante definir tipo texto plano

        try (PrintWriter out = resp.getWriter()) {

            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("idUsuario") == null) {
                out.write("Error: No has iniciado sesión. Por favor, inicia sesión para continuar.");
                return;
            }
            int idUsuario = (int) session.getAttribute("idUsuario");

            String idProductoParam = req.getParameter("idProducto");
            String cantidadParam = req.getParameter("cantidad");

            if (idProductoParam == null || idProductoParam.trim().isEmpty()
                    || cantidadParam == null || cantidadParam.trim().isEmpty()) {
                out.write("Error: Parámetros incompletos. Debes especificar el producto y la cantidad.");
                return;
            }

            int idProducto;
            int cantidad;
            try {
                idProducto = Integer.parseInt(idProductoParam);
                cantidad = Integer.parseInt(cantidadParam);
            } catch (NumberFormatException nfe) {
                out.write("Error: Parámetros inválidos. El id del producto y la cantidad deben ser números.");
                return;
            }

            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("jdbc/fun");
            try (Connection conn = ds.getConnection()) {

                String sqlDatosProducto = "SELECT precio, stock FROM productos WHERE idProducto = ?";
                BigDecimal precioUnitario = null;
                int stockDisponible = 0;
                try (PreparedStatement ps = conn.prepareStatement(sqlDatosProducto)) {
                    ps.setInt(1, idProducto);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        precioUnitario = rs.getBigDecimal("precio");
                        stockDisponible = rs.getInt("stock");
                    } else {
                        out.write("Error: Producto no encontrado.");
                        return;
                    }
                }

                if (cantidad > stockDisponible) {
                    out.write("Error: Stock insuficiente. Solo hay " + stockDisponible + " unidades disponibles.");
                    return;
                }

                BigDecimal total = precioUnitario.multiply(new BigDecimal(cantidad));

                String sqlInsertCompra = "INSERT INTO compras (idUsuario, fechaCompra, total, estado) VALUES (?, NOW(), ?, 'Sin pagar')";
                int idCompra = -1;
                try (PreparedStatement ps = conn.prepareStatement(sqlInsertCompra, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, idUsuario);
                    ps.setBigDecimal(2, total);
                    ps.executeUpdate();
                    ResultSet rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        idCompra = rs.getInt(1);
                    } else {
                        out.write("Error: No se pudo registrar la compra.");
                        return;
                    }
                }

                String sqlInsertDetalle = "INSERT INTO detalleCompras (idCompra, idProducto, cantidad, precioUnitario, estado) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(sqlInsertDetalle)) {
                    ps.setInt(1, idCompra);
                    ps.setInt(2, idProducto);
                    ps.setInt(3, cantidad);
                    ps.setBigDecimal(4, precioUnitario);
                    ps.setString(5, "Sin pagar");
                    ps.executeUpdate();
                }

                // Compra exitosa, en vez de redirect puedes escribir mensaje o sí redirigir:
                resp.sendRedirect("CompraExitosa.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
            try (PrintWriter out = resp.getWriter()) {
                out.write("Error inesperado al procesar la compra.");
            }
        }
    }
}

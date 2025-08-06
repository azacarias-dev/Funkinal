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

    @Resource(name = "jdbc/funkinal1")
    private DataSource ds;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        try {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("idUsuario") == null) {
                out.write("Debes iniciar sesión para realizar una compra.");
                return;
            }
            int idUsuario = (int) session.getAttribute("idUsuario");

            String idProductoParam = req.getParameter("idProducto");
            String cantidadParam = req.getParameter("cantidad");

            System.out.println("idProductoParam: " + idProductoParam);
            System.out.println("cantidadParam: " + cantidadParam);

            if (idProductoParam == null || idProductoParam.trim().isEmpty()
                    || cantidadParam == null || cantidadParam.trim().isEmpty()) {
                out.write("Faltan datos para procesar la compra");
                return;
            }

            int idProducto = Integer.parseInt(idProductoParam);
            int cantidad = Integer.parseInt(cantidadParam);

            // Obtener conexión por JNDI
            InitialContext ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("jdbc/funkinal1");
            try (Connection conn = ds.getConnection()) {

                // Paso 1: Obtener precio y stock del producto
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
                        out.write("Producto no encontrado");
                        return;
                    }
                }

                // Verificar stock
                if (cantidad > stockDisponible) {
                    out.write("Stock insuficiente. Solo hay " + stockDisponible + " unidades disponibles.");
                    return;
                }

                // Calcular total
                BigDecimal total = precioUnitario.multiply(new BigDecimal(cantidad));

                // Paso 2: Insertar la compra
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
                        out.write("No se pudo registrar la compra");
                        return;
                    }
                }

                // Paso 3: Insertar en detalleCompras con estado
                String sqlInsertDetalle = "INSERT INTO detalleCompras (idCompra, idProducto, cantidad, precioUnitario, estado) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(sqlInsertDetalle)) {
                    ps.setInt(1, idCompra);
                    ps.setInt(2, idProducto);
                    ps.setInt(3, cantidad);
                    ps.setBigDecimal(4, precioUnitario);
                    ps.setString(5, "Sin pagar");  // Igual al estado de la compra
                    ps.executeUpdate();
                }

                // Paso 4 (opcional): el trigger puede disminuir el stock automáticamente
                out.write("Compra registrada exitosamente con idCompra: " + idCompra);
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.write("Error al procesar la compra:\n");
            e.printStackTrace(out);
        }
    }
}

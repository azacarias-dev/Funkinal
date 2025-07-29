<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.RecibosPojo"%>
<%
    RecibosPojo recibo = (RecibosPojo) request.getAttribute("recibo");
    if (recibo == null) {
        // Por si alguien entra directo sin datos, redirigir o mostrar error
        response.sendRedirect("ServletRecibos?action=listar");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Recibo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Editar Recibo</h2>
    <form action="ServletRecibos" method="post">
        <input type="hidden" name="action" value="actualizar">
        <input type="hidden" name="idRecibo" value="<%= recibo.getIdRecibo() %>">

        <div class="mb-3">
            <label>ID Compra</label>
            <input type="number" name="idCompra" value="<%= recibo.getIdCompra() %>" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>Total</label>
            <input type="number" name="total" class="form-control" step="0.01" min="0" 
                   value="<%= recibo.getTotal() %>" required>
        </div>

        <div class="mb-3">
            <label>Método de Pago</label>
            <select name="metodoPago" class="form-control" required>
                <option value="Efectivo" <%= "Efectivo".equals(recibo.getMetodoPago()) ? "selected" : "" %>>Efectivo</option>
                <option value="Tarjeta" <%= "Tarjeta".equals(recibo.getMetodoPago()) ? "selected" : "" %>>Tarjeta</option>
            </select>
        </div>

        <div class="mb-3">
            <label>Estado</label>
            <input type="text" name="estado" value="<%= recibo.getEstado() != null ? recibo.getEstado() : "Emitido" %>" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success">Actualizar</button>
        <a href="ServletRecibos?action=listar" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
</body>
</html>

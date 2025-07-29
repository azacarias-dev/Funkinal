<%-- 
    Document   : editarRecibo
    Created on : 29 jul. 2025, 08:57:08
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.RecibosPojo"%>
<%
    RecibosPojo recibo = (RecibosPojo) request.getAttribute("recibo"); // ojo el nombre del atributo que envías en servlet
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Recibo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                <input type="number" step="0.01" name="total" value="<%= recibo.getTotal() %>" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Método de Pago</label>
                <input type="text" name="metodoPago" value="<%= recibo.getMetodoPago() %>" class="form-control" required>
            </div>

            <div class="mb-3">
                <label>Estado</label>
                <input type="text" name="estado" value="<%= recibo.getEstado() %>" class="form-control" required>
            </div>

            <!-- Campo oculto para fecha, opcional -->
            <input type="hidden" name="fechaEmision" value="<%= recibo.getFechaEmision() %>">

            <button type="submit" class="btn btn-success">Actualizar</button>
            <a href="ServletRecibos?action=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>


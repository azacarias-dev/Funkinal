<%-- 
    Document   : editarRecibo
    Created on : 29 jul. 2025, 08:57:08
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.RecibosPojo"%>
<%
    RecibosPojo recibo = (RecibosPojo) request.getAttribute("RecibosEditar");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Categoría</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Editar Categoría</h2>
        <form action="CategoriaServlet" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= recibo.getIdRecibo()%>">

            <div class="mb-3">
                <label>Nombre</label>
                <input type="text" name="idCompra" value="<%= recibo.getIdCompra()%>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Total</label>
                <textarea name="descripcion" class="form-control" rows="4" required><%= recibo.getTotal() %></textarea>
            </div>
            <div class="mb-3">
                <label>Metodo de Pago</label>
                <textarea name="metodoPago" class="form-control" rows="4" required><%= recibo.getMetodoPago()%></textarea>
            </div>

            <button type="submit" class="btn btn-success">Actualizar</button>
            <a href="CategoriaServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>

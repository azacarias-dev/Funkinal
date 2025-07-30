<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ProductosPojo"%>
<%
    ProductosPojo producto = (ProductosPojo) request.getAttribute("productoEditar");
    if (producto == null) {
        response.sendRedirect("ServletProductos?accion=listar");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Editar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/productos.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Editar Producto</h2>
        <form action="ServletProductos" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="idProducto" value="<%= producto.getIdProducto() %>">

            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="<%= producto.getNombre() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio:</label>
                <input type="number" id="precio" name="precio" value="<%= producto.getPrecio() %>" class="form-control" step="0.01" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="4"><%= producto.getDescripcion() %></textarea>
            </div>
            <div class="mb-3">
                <label for="stock" class="form-label">Stock:</label>
                <input type="number" id="stock" name="stock" value="<%= producto.getStock() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="estado" class="form-label">Estado:</label>
                <select id="estado" name="estado" class="form-select" required>
                    <option value="Existencias" <%= "Existencias".equals(producto.getEstado()) ? "selected" : "" %>>Existencias</option>
                    <option value="Agotado" <%= "Agotado".equals(producto.getEstado()) ? "selected" : "" %>>Agotado</option>
                    <option value="Descontinuado" <%= "Descontinuado".equals(producto.getEstado()) ? "selected" : "" %>>Descontinuado</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success">Actualizar Producto</button>
            <a href="ServletProductos?accion=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
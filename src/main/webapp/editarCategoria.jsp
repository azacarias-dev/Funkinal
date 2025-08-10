<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.CategoriasPojo"%>
<%
    CategoriasPojo categoria = (CategoriasPojo) request.getAttribute("categoriaEditar");
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
            <input type="hidden" name="id" value="<%= categoria.getIdCategoria() %>">

            <div class="mb-3">
                <label>Nombre</label>
                <input type="text" name="nombre" value="<%= categoria.getNombre() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Descripción</label>
                <textarea name="descripcion" class="form-control" rows="4" required><%= categoria.getDescripcion() %></textarea>
            </div>

            <button type="submit" class="btn btn-success">Actualizar</button>
            <a href="CategoriaServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>

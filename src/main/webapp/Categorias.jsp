<%@page import="java.util.List"%>
<%@page import="model.CategoriasPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Categorías</title>
        <link rel="stylesheet" href="styles/Categorias.css?<%= System.currentTimeMillis()%>">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb- text">Lista de Categorías</h2>
            <div class="mb-3 text-end">
                <a href="agregarCategoria.jsp" class="btn">Nueva Categoría</a>
            </div>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<CategoriasPojo> listaCategorias = (List<CategoriasPojo>) request.getAttribute("listaCategorias");
                        if (listaCategorias != null && !listaCategorias.isEmpty()) {
                            for (CategoriasPojo cat : listaCategorias) {
                    %>
                    <tr>
                        <td><%= cat.getIdCategoria()%></td>
                        <td><%= cat.getNombre()%></td>
                        <td><%= cat.getDescripcion()%></td>
                        <td>
                            <a href="CategoriaServlet?accion=editar&id=<%= cat.getIdCategoria()%>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="CategoriaServlet?accion=eliminar&id=<%= cat.getIdCategoria()%>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Desea eliminar esta categoría?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="4" class="text-center">No hay categorías registradas.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>

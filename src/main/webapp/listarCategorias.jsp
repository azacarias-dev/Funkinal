<%@page import="java.util.List"%>
<%@page import="model.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Categorías</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4 text-center">Lista de Categorías</h2>
            <div class="mb-3 text-end">
                <a href="agregarCategoria.jsp" class="btn btn-primary">Nueva Categoría</a>
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
                        List<Categoria> listaCategorias = (List<Categoria>) request.getAttribute("listaCategorias");
                        if (listaCategorias != null && !listaCategorias.isEmpty()) {
                            for (Categoria cat : listaCategorias) {
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>

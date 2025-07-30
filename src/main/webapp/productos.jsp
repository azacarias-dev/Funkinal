<%@page import="java.util.List"%>
<%@page import="model.ProductosPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Categorías</title>
        <link rel="stylesheet" href="styles/productos.css">
    </head>

    <body>
        <div class="container mt-4">
            <h2 class="mb- text">Lista de Productos</h2>
            <div class="mb-3 text-end">
                <a href="agregarProducto.jsp" class="btn">Nueva Categoría</a>
            </div>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Descripción</th>
                        <th>Stock</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<ProductosPojo> listaProductos = (List<ProductosPojo>) request.getAttribute("listaProductos");
                        if (listaProductos != null && !listaProductos.isEmpty()) {
                            for (ProductosPojo cat : listaProductos) {
                    %>
                    <tr>
                        <td><%= cat.getIdProducto()%></td>
                        <td><%= cat.getNombre()%></td>
                        <td><%= cat.getPrecio()%></td>
                        <td><%= cat.getDescripcion()%></td>
                        <td><%= cat.getStock()%></td>
                        <td><%= cat.getEstado()%></td>
                        <td>
                            <a href="ServletProductos?accion=editar&id=<%= cat.getIdProducto()%>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="ServletProductos?accion=eliminar&id=<%= cat.getIdProducto()%>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Desea eliminar esta categoría?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No hay productos registrados.</td>
                    </tr>
                    <%    }
                    %>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"

        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>

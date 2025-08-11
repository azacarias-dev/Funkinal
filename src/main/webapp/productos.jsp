<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="model.ProductosPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Productos</title>
        <link rel="stylesheet" href="styles/productos.css">
    </head>

    <body>
        <div class="container mt-4">
            <h2 class="mb- text">Lista de Productos</h2>
            <div class="mb-3 text-end">
                <a href="ServletProductos?accion=agregar" class="btn btn-primary">Nuevo Producto</a>
            </div>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID Producto</th>
                        <th>Categoría</th> 
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
                        Map<Integer, String> mapaCategorias = (Map<Integer, String>) request.getAttribute("mapaCategorias");
                        if (listaProductos != null && !listaProductos.isEmpty()) {
                            for (ProductosPojo prod : listaProductos) {
                                String nombreCategoria = mapaCategorias.getOrDefault(prod.getIdCategoria(), "Desconocida");
                    %>
                    <tr>
                        <td><%= prod.getIdProducto()%></td>
                        <td><%= nombreCategoria%></td> 
                        <td><%= prod.getNombre()%></td>
                        <td><%= String.format("%.2f", prod.getPrecio())%></td>
                        <td><%= prod.getDescripcion()%></td>
                        <td><%= prod.getStock()%></td>
                        <td><%= prod.getEstado()%></td>
                        <td>
                            <a href="ServletProductos?accion=editar&id=<%= prod.getIdProducto()%>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="ServletProductos?accion=eliminar&id=<%= prod.getIdProducto()%>" class="btn btn-danger btn-sm">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="8" class="text-center">No hay productos registrados.</td>
                    </tr>
                    <%  }
                    %>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" xintegrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>

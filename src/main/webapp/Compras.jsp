<%@page import="java.util.List"%>
<%@page import="model.ComprasPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Compras</title>
        
        <%-- You might want to create a specific CSS file for purchases if styling differs --%>
        <link rel="stylesheet" href="styles/Compras.css?<%= System.currentTimeMillis() %>">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4 text-center">Lista de Compras</h2>
            <div class="mb-3 text-end">
                <a href="agregarCompras.jsp" class="btn btn-primary">Nueva Compra</a>
            </div>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID Compra</th>
                        <th>ID Usuario</th>
                        <th>Fecha Compra</th>
                        <th>Total</th>
                        <th>Método Pago</th>
                        <th>Estado</th>
                        <th>Acción</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<ComprasPojo> listaCompras = (List<ComprasPojo>) request.getAttribute("listaCompras");
                        if (listaCompras != null && !listaCompras.isEmpty()) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            for (ComprasPojo compra : listaCompras) {
                    %>
                    <tr>
                        <td><%= compra.getIdCompra()%></td>
                        <td><%= compra.getIdUsuario()%></td>
                        <td><%= dateFormat.format(compra.getFechaCompra())%></td>
                        <td><%= compra.getTotal()%></td>
                        <td><%= compra.getMetodoPago()%></td>
                        <td><%= compra.getEstado()%></td>
                        <td>
                            <a href="ServletCompras?accion=editar&id=<%= compra.getIdCompra()%>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="ServletCompras?accion=eliminar&id=<%= compra.getIdCompra()%>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Desea eliminar esta compra?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No hay compras registradas.</td>
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
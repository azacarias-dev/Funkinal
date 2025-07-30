<%@page import="java.util.List"%>
<%@page import="model.RecibosPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Categorías</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/Recibos.css?<%= System.currentTimeMillis()%>">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4 text-center">Lista de Recibos</h2>
            <div class="mb-3 text-end">
                <a href="agregarRecibo.jsp" class="btn btn-primary">Nuevo Recibo</a>
            </div>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>IDCompra</th>
                        <th>Fecha de Emision</th>
                        <th>Total</th>
                        <th>Metodo de Pago</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<RecibosPojo> listaRecibos = (List<RecibosPojo>) request.getAttribute("listaRecibos");
                        if (listaRecibos != null && !listaRecibos.isEmpty()) {
                            for (RecibosPojo cat : listaRecibos) {
                    %>
                    <tr>
                        <td><%= cat.getIdRecibo()%></td>
                        <td><%= cat.getIdCompra()%></td>
                        <td><%= cat.getFechaEmision()%></td>
                        <td><%= cat.getTotal()%></td>
                        <td><%= cat.getMetodoPago()%></td>
                        <td><%= cat.getEstado()%></td>
                        <td>
                            <a href="ServletRecibos?action=editar&idRecibo=<%= cat.getIdRecibo()%>" class="btn btn-warning btn-sm">Editar</a>
                            <a href="ServletRecibos?action=eliminar&idRecibo=<%= cat.getIdRecibo()%>" class="btn btn-danger btn-sm"
                               onclick="return confirm('¿Desea eliminar este Recibo?')">Eliminar</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="4" class="text-center">Recibos</td>
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
<%-- 
    Document   : ComprasModal
    Created on : 3 ago 2025, 10:49:23
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.CompraDetalle" %>

<!-- Modal -->
<div class="modal fade" id="modalCompras" tabindex="-1" aria-labelledby="modalComprasLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="modalComprasLabel">Historial de Compras</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>

            <div class="modal-body">
                <%
                    List<CompraDetalle> listaCompras = (List<CompraDetalle>) request.getAttribute("listaCompras");
                    if (listaCompras != null && !listaCompras.isEmpty()) {
                %>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>Producto</th>
                                    <th>Precio Unitario</th>
                                    <th>Cantidad</th>
                                    <th>Total</th>
                                    <th>Estado</th> <!-- Columna Estado agregada -->
                                </tr>
                            </thead>
                            <tbody>
                                <% for (CompraDetalle c : listaCompras) { %>
                                    <tr>
                                        <td><%= c.getNombreProducto() %></td>
                                        <td>Q. <%= String.format("%.2f", c.getPrecioUnitario()) %></td>
                                        <td><%= c.getCantidad() %></td>
                                        <td>Q. <%= String.format("%.2f", c.getTotal()) %></td>
                                        <td><%= c.getEstado() %></td> <!-- Mostrar estado -->
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <%
                    } else {
                %>
                    <p class="text-center">No se encontraron compras.</p>
                <%
                    }
                %>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>

        </div>
    </div>
</div>

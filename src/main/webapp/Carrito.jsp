<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Modal de Carrito de Compras -->

<div class="modal fade" id="modalCarrito" tabindex="-1" aria-labelledby="modalCarritoLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="modalCarritoLabel">Carrito de Compras</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>

            <div class="modal-body">
                <c:choose>
                    <c:when test="${empty listaCarrito}">
                        <p class="text-center">No hay productos en el carrito.</p>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Producto</th>
                                        <th>Precio Unitario</th>
                                        <th>Cantidad</th>
                                        <th>Total</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${listaCarrito}">
                                        <tr>
                                            <td>${item.nombreProducto}</td>
                                            <td>Q. ${item.precioUnitario}</td>
                                            <td>${item.cantidad}</td>
                                            <td>Q. ${item.total}</td>
                                            <td>
                                                <form action="ProcesarCompraServlet" method="post" style="display:inline-block;">
                                                    <input type="hidden" name="idCompra" value="${item.idCompra}" />
                                                    <button type="submit" name="accion" value="pagar" class="btn btn-success btn-sm">Pagar</button>
                                                </form>
                                                <form action="ProcesarCompraServlet" method="post" style="display:inline-block;">
                                                    <input type="hidden" name="idCompra" value="${item.idCompra}" />
                                                    <button type="submit" name="accion" value="cancelar" class="btn btn-danger btn-sm">Cancelar</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>

        </div>
    </div>
</div>

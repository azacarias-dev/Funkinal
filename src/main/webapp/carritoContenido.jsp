<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                 <a href="ProcesarCompraServlet?idCompra=${item.idCompra}" class="btn btn-success btn-sm">Pagar</a>

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

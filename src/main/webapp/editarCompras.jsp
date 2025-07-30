<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ComprasPojo"%>
<%
    ComprasPojo compra = (ComprasPojo) request.getAttribute("compraEditar");

    if (compra == null) {
        response.sendRedirect("ServletCompras?accion=listar&error=compraNoEncontrada");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Editar Compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h2>Editar Compra</h2>
                    </div>
                    <div class="card-body">
                        <form action="ServletCompras" method="post">
                            <input type="hidden" name="accion" value="actualizar">
                            <input type="hidden" name="idCompra" value="<%= compra.getIdCompra() %>">

                            <div class="mb-3">
                                <label for="idUsuario" class="form-label">ID Usuario:</label>
                                <input type="number" class="form-control" id="idUsuario" name="idUsuario" min="1" value="<%= compra.getIdUsuario() %>" required>
                            </div>

                            <div class="mb-3">
                                <label for="fechaCompra" class="form-label">Fecha Compra:</label>
                                <input type="date" class="form-control" id="fechaCompra" name="fechaCompra" value="<%= compra.getFechaCompra() %>" required>
                            </div>

                            <div class="mb-3">
                                <label for="total" class="form-label">Total:</label>
                                <input type="number" class="form-control" id="total" name="total" step="0.01" min="0" value="<%= compra.getTotal() %>" required>
                            </div>
                           
                            <div class="mb-3">
                                <label for="metodoPago" class="form-label">Método de Pago:</label>
                                <select class="form-select" id="metodoPago" name="metodoPago" required>
                                    <option value="">Seleccione un método de pago</option>
                                    <option value="Efectivo" <%= "Efectivo".equals(compra.getMetodoPago()) ? "selected" : "" %>>Efectivo</option>
                                    <option value="Tarjeta" <%= "Tarjeta".equals(compra.getMetodoPago()) ? "selected" : "" %>>Tarjeta</option>
                                    <option value="Transferencia" <%= "Transferencia".equals(compra.getMetodoPago()) ? "selected" : "" %>>Transferencia</option>
                                </select>
                            </div>
                           
                            <div class="mb-3">
                                <label for="estado" class="form-label">Estado:</label>
                                <select class="form-select" id="estado" name="estado" required>
                                    <option value="">Seleccione un estado</option>
                                    <option value="Pendiente" <%= "Pendiente".equals(compra.getEstado()) ? "selected" : "" %>>Pendiente</option>
                                    <option value="Completada" <%= "Completada".equals(compra.getEstado()) ? "selected" : "" %>>Completada</option>
                                    <option value="Cancelada" <%= "Cancelada".equals(compra.getEstado()) ? "selected" : "" %>>Cancelada</option>
                                </select>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Actualizar Compra</button>
                                <a href="ServletCompras?accion=listar" class="btn btn-secondary">Cancelar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
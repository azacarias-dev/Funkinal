<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agregar Compra</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Agregar Nueva Compra</h2>
                <form action="ServletCompras" method="post">
                    <input type="hidden" name="accion" value="insertar">

                    <div class="mb-3">
                        <label for="idUsuario" class="form-label">ID Usuario:</label>
                        <input type="number" class="form-control" id="idUsuario" name="idUsuario" min="1" required>
                    </div>

                    <div class="mb-3">
                        <label for="fechaCompra" class="form-label">Fecha Compra:</label>
                        <input type="date" class="form-control" id="fechaCompra" name="fechaCompra" required>
                    </div>

                    <div class="mb-3">
                        <label for="total" class="form-label">Total:</label>
                        <input type="number" class="form-control" id="total" name="total" step="0.01" min="0" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="metodoPago" class="form-label">Método de Pago:</label>
                        <select class="form-select" id="metodoPago" name="metodoPago" required>
                            <option value="">Seleccione un método de pago</option>
                            <option value="Efectivo">Efectivo</option>
                            <option value="Tarjeta">Tarjeta</option>
                            </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="estado" class="form-label">Estado:</label>
                        <select class="form-select" id="estado" name="estado" required>
                            <option value="">Seleccione un estado</option>
                            <option value="sin pagar">Sin pagar</option>
                            </select>
                    </div>

                    <button type="submit" class="btn btn-success">Guardar</button>
                    <a href="ServletCompras?accion=listar" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
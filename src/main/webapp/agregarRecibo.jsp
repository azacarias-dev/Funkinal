<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agregar Recibo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Agregar Nuevo Recibo</h2>
                <form action="ServletRecibos" method="post">
                    <input type="hidden" name="accion" value="insertar">

                    <div class="mb-3">
                        <label class="form-label">IDCompra:</label>
                        <input type="text" name="idCompra" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Total:</label>
                        <input type="number" name="total" class="form-control" required>
                        
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Metodo Pago:</label>
                        <input type="text" name="metodoPago" class="form-control" required>
                    </div>

                    <button type="submit" class="btn btn-success">Guardar</button>
                    <a href="ServletRecibos?accion=listar" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>

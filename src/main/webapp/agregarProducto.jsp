<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agregar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/productos.css">
</head>
<body>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Agregar Nuevo Producto</h2>
                <form action="ServletProductos" method="post">
                    <input type="hidden" name="accion" value="insertar">

                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre:</label>
                        <input type="text" id="nombre" name="nombre" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="precio" class="form-label">Precio:</label>
                        <input type="number" id="precio" name="precio" class="form-control" step="0.01" required>
                    </div>

                    <div class="mb-3">
                        <label for="descripcion" class="form-label">Descripción:</label>
                        <textarea id="descripcion" name="descripcion" class="form-control" rows="4"></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="stock" class="form-label">Stock:</label>
                        <input type="number" id="stock" name="stock" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="estado" class="form-label">Estado:</label>
                        
                        <input type="hidden" id="estado" name="estado" value="Existencias">
                        
                        <input type="text" class="form-control" value="Existencias" readonly>
                    </div>

                    <button type="submit" class="btn btn-success">Guardar Producto</button>
                    <a href="ServletProductos?accion=listar" class="btn btn-secondary">Cancelar</a>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
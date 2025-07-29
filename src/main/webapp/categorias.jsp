<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lista de Categorías</title>
    
    <link rel="stylesheet" href="styles/categorias.css">
</head>

<body>
    <div class="container mt-4">
        <h2 class="mb- text">Lista de Categorías</h2>
        <div class="mb-3 text-end">
            <a href="agregarCategoria.jsp" class="btn">Nueva Categoría</a>
        </div>
        <table class="table table-striped table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><></td>
                    <td><></td>
                    <td><></td>
                    <td>
                        <a href="" class="btn btn-warning btn-sm">Editar</a>
                           <a href="" class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="text-center">No hay categorías registradas.</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>

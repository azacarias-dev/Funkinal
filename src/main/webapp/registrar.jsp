<%-- 
    Document   : Registrar
    Created on : 22/07/2025, 21:10:02
    Author     : MIGUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet" href="styles/registro.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro</title>
    </head>
    <body>

        <div class="fondo">
            <img src="https://funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwbc961a9d/images/funko/svg/site-logo.svg" alt="Logo Pop">
            <div class="TituloContenedor">| Funko Pop Collection</div>
        </div>
        <div class="container">
            <h2>Registro</h2>

            <!-- Aquí va el logo justo debajo del título -->
            <div style="text-align: center; margin-bottom: 20px;">
                <img src="../images/funkos.png" alt="Logo Funko" width="150">
            </div>

            <form action="ServletRegistrar" method="POST">
                <label for="nombre">Nombre</label>
                <input type="text" class="txtRegistro" name="nombre" required>

                <label for="apellido">Apellido</label>
                <input type="text" class="txtRegistro" name="apellido" required>

                <label for="correo">Correo Electrónico</label>
                <input type="email" class="txtRegistro" name="correo" required>

                <label for="telefono">Número Telefónico</label>
                <input type="text" class="txtRegistro" name="telefono" required>

                <label for="password">Contraseña</label>
                <input type="password" class="txtRegistro" name="password" required>

                <button type="submit">Registrarse</button>
            </form>
        </div>
    </body>
</html>
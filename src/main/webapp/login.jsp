<%-- 
    Document   : login
    Created on : 22/07/2025, 15:44:58
    Author     : acord
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>IniciarSesion | FunKinal</title>
        <link rel="icon" type="image/png" href="https://www.funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwdf4d4162/images/favicons/funko-favicon-96x96.png" />
        <link rel="stylesheet" href="styles/login.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="login-container">
            <h2>Iniciar Sesion</h2>

            <%-- Bloque para mostrar mensajes de error --%>
            <% String mensajeError = (String) request.getAttribute("mensajeError");
                if (mensajeError != null && !mensajeError.isEmpty()) {%>
            <p style="color: red; text-align: center; margin-bottom: 10px;"><%= mensajeError%></p>
            <% } %>

            <form action="ServletLogin" method="post">
                <label for="email">Correo electrónico:</label>
                <input type="email" id="email" name="correo" required placeholder="ejemplo@correo.com">

                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="contrasena" required placeholder="********">

                <button type="submit">Ingresar</button>
            </form>
            <p>¿No tienes cuenta? Crea una aqui --> <a href="registrar.jsp">Registrarse</a></p>
        </div>
    </body>
</html>
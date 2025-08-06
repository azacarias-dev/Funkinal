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
        
        <!-- Tu CSS personalizado -->
        <link rel="stylesheet" href="styles/login.css">
        
        <!-- Fuente Roboto -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="login-container">
            <h2>Iniciar Sesión</h2>

            <%-- ✅ Mensaje si la sesión fue cerrada exitosamente --%>
            <%
                String cerrado = request.getParameter("cerrado");
                if ("true".equals(cerrado)) {
            %>
                <div class="alert alert-success text-center" id="mensajeCierre" style="margin-bottom: 10px;">
                    Has cerrado sesión correctamente.
                </div>
            <%
                }
            %>

            <%-- ⚠️ Mensaje de error en login --%>
            <%
                String mensajeError = (String) request.getAttribute("mensajeError");
                if (mensajeError != null && !mensajeError.isEmpty()) {
            %>
                <div class="alert alert-danger text-center" style="margin-bottom: 10px;"><%= mensajeError %></div>
            <%
                }
            %>

            <form action="ServletLogin" method="post">
                <label for="email">Correo electrónico:</label>
                <input type="email" id="email" name="correo" required placeholder="ejemplo@correo.com">

                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="contrasena" required placeholder="********">

                <button type="submit">Ingresar</button>
            </form>
            <p>¿No tienes cuenta? Crea una aquí --> <a href="registrar.jsp">Registrarse</a></p>
        </div>

        <!-- Bootstrap JS (requerido para alertas si usas componentes interactivos) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Script opcional para ocultar mensaje de cierre automáticamente -->
        <script>
            window.onload = function () {
                var mensaje = document.getElementById("mensajeCierre");
                if (mensaje) {
                    setTimeout(function () {
                        mensaje.style.display = "none";
                    }, 4000); // Oculta el mensaje después de 4 segundos
                }
            };
        </script>
    </body>
</html>

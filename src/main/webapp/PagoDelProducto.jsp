<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UsuariosPojo"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Página de Pago - Funko Store</title>
        <link rel="stylesheet" href="styles/pago.css" />
        <!-- Bootstrap CSS (agrega esto en el <head>) -->
        <!-- comment <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">-->

    </head>
    <body>

        <h2>Formulario de Pago</h2>

        <%
            // Obtener datos de usuario desde sesión
            String nombreUsuario = (String) session.getAttribute("nombreUsuario");
            String correoUsuario = (String) session.getAttribute("correoUsuario");
            if (nombreUsuario == null || correoUsuario == null) {
                response.sendRedirect("login.jsp"); // si no hay sesión, redirige a login
                return;
            }
        %>

        <form id="formPago" action="FinalizarPagoServlet" method="post" onsubmit="return validarFormulario()">
            <input type="hidden" name="idCompra" value="<%= request.getAttribute("idCompra")%>">
            <input type="hidden" name="accion" value="pagar">

            <label>Nombre completo:</label>
            <input type="text" value="<%= nombreUsuario%>" readonly />

            <label>Correo electrónico:</label>
            <input type="email" value="<%= correoUsuario%>" readonly />

            <label>Forma de pago:</label>
            <input type="radio" id="efectivo" name="pago" value="efectivo" checked onchange="mostrarOpcionesPago()" />
            <label for="efectivo" style="display:inline;">Efectivo</label>

            <input type="radio" id="tarjeta" name="pago" value="tarjeta" onchange="mostrarOpcionesPago()" />
            <label for="tarjeta" style="display:inline;">Tarjeta</label>

            <!-- Descripción para efectivo -->
            <div id="descripcionEfectivo" class="descripcion-efectivo">
                Por favor, acércate a la tienda Funko más cercana con el pedido ID
                <span id="idCompraTexto"><%= request.getAttribute("idCompra") != null ? request.getAttribute("idCompra") : "N/A"%></span>.
            </div>

            <!-- Formulario para tarjeta -->
            <div id="formTarjeta" class="hidden">
                <label for="numeroTarjeta">Número de tarjeta:</label>
                <input type="text" id="numeroTarjeta" name="numeroTarjeta" maxlength="19" placeholder="XXXX XXXX XXXX XXXX" />

                <label for="nombreTarjeta">Nombre en la tarjeta:</label>
                <input type="text" id="nombreTarjeta" name="nombreTarjeta" />

                <label for="fechaExp">Fecha de expiración:</label>
                <input type="month" id="fechaExp" name="fechaExp" min="2023-01" />

                <label for="cvv">CVV:</label>
                <input type="number" id="cvv" name="cvv" maxlength="4" min="0" max="9999" />
            </div>

            <button type="submit" class="btn btn-success">Terminar Pedido</button>
            <a href="inicio.jsp" class="btn btn-secondary">Cancelar</a>
        </form>


        <script>
    const idCompra = '<%= request.getAttribute("idCompra") != null ? request.getAttribute("idCompra") : "N/A"%>';
    document.getElementById('idCompraTexto').textContent = idCompra;

    function mostrarOpcionesPago() {
        const esEfectivo = document.getElementById('efectivo').checked;
        const descripcion = document.getElementById('descripcionEfectivo');
        const formTarjeta = document.getElementById('formTarjeta');

        if (esEfectivo) {
            descripcion.style.display = 'block';
            formTarjeta.style.display = 'none';
            setCamposTarjetaRequired(false);
        } else {
            descripcion.style.display = 'none';
            formTarjeta.style.display = 'block';
            setCamposTarjetaRequired(true);
        }
    }

    function setCamposTarjetaRequired(estado) {
        document.getElementById('numeroTarjeta').required = estado;
        document.getElementById('nombreTarjeta').required = estado;
        document.getElementById('fechaExp').required = estado;
        document.getElementById('cvv').required = estado;
    }

    function validarFormulario() {
        alert("Pedido terminado. Gracias por tu compra.");
        return true; // <- permite enviar el formulario
    }


    mostrarOpcionesPago();
        </script>

    </body>
</html>

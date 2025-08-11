<%-- 
    Document   : index
    Created on : 21 jul 2025, 19:37:53
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="https://www.funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwdf4d4162/images/favicons/funko-favicon-96x96.png" />
        <link rel="stylesheet" href="../styles/Producto.css?<%= System.currentTimeMillis()%>">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">


        <title>Funko Pop</title>
    </head>

    <body>

        <%
            String nombreUsuario = (String) session.getAttribute("nombreUsuario");
            if (nombreUsuario == null) {
                nombreUsuario = "Invitado";
            }
            String correoUsuario = (String) session.getAttribute("correoUsuario");
            if (correoUsuario == null) {
                correoUsuario = "Sin correo";
            }
        %>

        <!-- Modal perfil usuario -->
        <div class="modal fade" id="modalPerfil" tabindex="-1" aria-labelledby="modalPerfilLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="modalPerfilLabel">Información de Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>

                    <div class="modal-body">
                        <p><strong>Nombre:</strong> <%= nombreUsuario%></p>
                        <p><strong>Correo:</strong> <%= correoUsuario%></p>
                    </div>

                    <div class="modal-footer">
                        <!-- Botón: Cambiar de cuenta (redirige a login.jsp después de cerrar sesión) -->
                        <form action="../CambiarCuenta.jsp" method="post">
                            <button type="submit" class="btn btn-warning">Cambiar de Cuenta</button>
                        </form>

                        <!-- Botón: Cerrar sesión (redirige a logout.jsp si lo haces por separado) -->
                        <form action="../CerrarSesion.jsp" method="post">
                            <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
                        </form>

                        <!-- Botón: Cancelar -->
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    </div>

                </div>
            </div>
        </div>


        <!-- Encabezado -->
        <div class="fondo">
            <img src="https://funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwbc961a9d/images/funko/svg/site-logo.svg" alt="Logo Pop">
            <div class="TituloContenedor">| Funko Pop Collection</div>
        </div>

        <!-- Botón redondo solo en móvil -->
        <div class="toggle-button" id="toggleButton">☰</div>

        <!-- Icono lupa para móvil (oculto en escritorio) -->
        <div class="icono-lupa-movil" id="iconoLupaMovil" title="Busqueda">
            <img src="data:image/png;base64,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" alt="Busqueda" id="iconoBusqueda"/>
            <!-- Buscador oculto inicialmente -->
            <div class="buscador" id="buscadorMovil">
                <input type="text" placeholder="Buscar...">
                <button onclick="cerrarBuscador()">X</button>
            </div>
        </div>

        <!-- Menú desplegable tipo flotante -->
        <div class="menu-flotante" id="menuFlotante">
            <ul>
                <li><a href="#" id="btnPerfil2">Mi Perfil</a></li>
                <li><a href="#" id="btnCarrito2">Carrito</a></li>
                <li><a href="#" id="btnVerCompras2">Historial de Compras</a></li>
            </ul>
        </div>

        <!-- Isla (solo escritorio) -->
        <ul class="isla">
            <li data-title="Busqueda" class="perfil-contenedor">
                <img src="https://cdn-icons-png.flaticon.com/128/2697/2697422.png" alt="Imagen 2" class="img-isla" id="iconoPerfil">      
                <!-- Buscador oculto inicialmente -->
                <div class="buscador2" id="buscadorPerfil">
                    <input type="text" placeholder="Buscar...">
                    <button onclick="cerrarBuscador()">X</button>
                </div>
            </li>


            <li data-title="Perfil">
                <img src="https://cdn-icons-png.flaticon.com/128/64/64572.png" alt="Imagen 2" class="img-isla" id="btnPerfil">      
            </li>

            <li data-title="Carrito">
                <img src="https://cdn-icons-png.flaticon.com/128/1170/1170678.png" alt="Carrito" class="img-isla" id="btnCarrito">
            </li>


            <li data-title="Historial">
                <img src="https://cdn-icons-png.flaticon.com/128/8302/8302434.png" alt="Imagen 4" class="img-isla" id="btnVerCompras">
            </li>
        </ul>

        <div class="Menu">
            <img src="https://funko.com/dw/image/v2/BGTS_PRD/on/demandware.static/-/Sites-funko-master-catalog/default/dw5ee43693/images/funko/upload/85342_POP_Star-Wars-Retro_Admiral-Ackbar_GLAM-WEB.png?sw=800&sh=800" alt="Kylo Ren">

            <p class="Titule"><strong>Admiral Ackbar</strong><br>Star Wars</p>

            <%
                // Obtener el parámetro id de la URL
                String idProducto = request.getParameter("id");
                if (idProducto == null) {
                    idProducto = "4"; // valor por defecto si no viene el parámetro
                }
            %>

            <form action="../ServletCompra" method="post" id="formCompra">
                <input type="hidden" id="idProducto" name="idProducto" value="<%= idProducto%>">

                <div class="cantidad">
                    <div class="fila">
                        <label for="cantidad">Cantidad:</label>
                        <input type="number" id="cantidad" name="cantidad" class="alineacion" min="1" required>
                    </div>
                </div>

                <div class="botonesPagoYtarde">
                    <button type="submit" class="btns" id="btnPagar"> Agregar a Carrito </button>
                    <a href="inicio.jsp"><button type="button" class="btns" id="btnGuardarMasTarde">Seguir viendo</button></a>
                </div>
            </form>
        </div>


        <!-- Modal Confirmación -->
        <div class="modal fade" id="confirmacionModal" tabindex="-1" aria-labelledby="confirmacionModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmacionModalLabel">Confirmar compra</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body">
                        ¿Deseas confirmar la compra?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="btnConfirmarCompra">Confirmar</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Resultado -->
        <div class="modal fade" id="modalResultado" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Resultado de la compra</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body" id="contenidoModalResultado">
                        <!-- Aquí se inserta el mensaje desde JS -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="modalCarrito" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Carrito de Compras</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body" id="contenidoCarrito">
                        <!-- Aquí se cargará dinámicamente el contenido de carrito (tabla) -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>



        <div id="contenedorModalCompras"></div>

        <!-- Pie de página / Información general -->
        <footer class="footer2">
            <div class="footer-contenido2">
                <p>&copy; 2025 Funko Pop Collection. Todos los derechos reservados.</p>
                <p>Contacto: info@funkocollection.com | Tel: +502 1234-5678</p>
                <p>Dirección: Ciudad de Guatemala, Guatemala</p>
            </div>
        </footer>


        <!-- Bootstrap JS (requerido para que funcione el modal) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


        <script>
                        window.onload = function () {
                            var myModal = new bootstrap.Modal(document.getElementById('usuarioModal'));
                            myModal.show();
                        };
        </script>

        <script>
            const toggleButton = document.getElementById("toggleButton");
            const menu = document.getElementById("menuFlotante");

            let abierto = false;

            toggleButton.addEventListener("click", () => {
                abierto = !abierto;

                if (abierto) {
                    toggleButton.textContent = "X";
                    menu.classList.add("show");
                } else {
                    toggleButton.textContent = "☰";
                    menu.classList.remove("show");
                }
            });

            // Cerrar el menú si la ventana cambia de tamaño
            window.addEventListener("resize", () => {
                if (abierto) {
                    abierto = false;
                    toggleButton.textContent = "☰";
                    menu.classList.remove("show");
                }
            });

            // Opcional: cerrar el menú si se hace clic fuera del menú y el botón
            document.addEventListener("click", (event) => {
                const esClickFuera = !menu.contains(event.target) && event.target !== toggleButton;
                if (abierto && esClickFuera) {
                    abierto = false;
                    toggleButton.textContent = "☰";
                    menu.classList.remove("show");
                }
            });
        </script>

        <script>
            const iconoPerfil = document.getElementById("iconoPerfil");
            const buscadorPerfil = document.getElementById("buscadorPerfil");

            iconoPerfil.addEventListener("click", () => {
                if (buscadorPerfil.style.display === "block") {
                    buscadorPerfil.style.display = "none";
                } else {
                    buscadorPerfil.style.display = "block";
                }
            });

            function cerrarBuscador() {
                buscadorPerfil.style.display = "none";
            }

            // Cierra el buscador si se hace clic fuera
            document.addEventListener("click", (e) => {
                if (!buscadorPerfil.contains(e.target) && e.target !== iconoPerfil) {
                    buscadorPerfil.style.display = "none";
                }
            });
        </script>
        <script>
            const iconoBusqueda = document.getElementById("iconoBusqueda");
            const buscadorMovil = document.getElementById("buscadorMovil");

            iconoBusqueda.addEventListener("click", () => {
                if (buscadorMovil.style.display === "block") {
                    buscadorMovil.style.display = "none";
                } else {
                    buscadorMovil.style.display = "block";
                }
            });

            function cerrarBuscador() {
                buscadorMovil.style.display = "none";
            }

            // Cierra el buscador si se hace clic fuera
            document.addEventListener("click", (e) => {
                if (!buscadorMovil.contains(e.target) && e.target !== iconoBusqueda) {
                    buscadorMovil.style.display = "none";
                }
            });
        </script>
        <!-- Bootstrap JS -->
        <!-- Bootstrap JS Bundle (incluye Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Obtener referencia al botón y al modal
            const btnPerfil = document.getElementById("btnPerfil");
            const btnPerfil2 = document.getElementById("btnPerfil2");
            const modalPerfil = new bootstrap.Modal(document.getElementById("modalPerfil"));

            // Abrir modal al hacer clic en el botón
            btnPerfil.addEventListener("click", () => {
                modalPerfil.show();
            });
            // Abrir modal al hacer clic en el botón
            btnPerfil2.addEventListener("click", () => {
                modalPerfil.show();
            });
        </script>

        <script>
            ["btnVerCompras", "btnVerCompras2"].forEach(id => {
                const btn = document.getElementById(id);
                if (btn) {
                    btn.addEventListener("click", function () {
                        fetch("../ServletCompras?accion=verComprasUsuario")
                                .then(response => response.text())
                                .then(html => {
                                    document.getElementById("contenedorModalCompras").innerHTML = html;
                                    const modal = new bootstrap.Modal(document.getElementById("modalCompras"));
                                    modal.show();
                                })
                                .catch(error => console.error("Error al cargar la modal:", error));
                    });
                }
            });
        </script>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#btnCarrito, #btnCarrito2').on('click', function () {
                    // Opcional: Mostrar spinner o mensaje temporal
                    $('#modalCarrito .modal-body').html('<p class="text-center">Cargando carrito...</p>');

                    // Llama al servlet para obtener el contenido del carrito
                    $.get('../CarritoServlet', function (data) {
                        $('#modalCarrito .modal-body').html(data);
                        $('#modalCarrito').modal('show');
                    }).fail(function () {
                        $('#modalCarrito .modal-body').html('<p class="text-danger text-center">Error al cargar el carrito.</p>');
                        $('#modalCarrito').modal('show');
                    });
                });
            });
        </script>
    </body>
</html>
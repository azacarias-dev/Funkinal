<%-- 
    Document   : Inicio
    Created on : 21 jul 2025, 19:39:29
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="https://www.funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwdf4d4162/images/favicons/funko-favicon-96x96.png" />
        <title>Funko Pop</title>
        <link rel="stylesheet" href="styles/inicio.css">

    </head>

    <body>
        <!-- Encabezado -->
        <div class="fondo">
            <img src="https://funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwbc961a9d/images/funko/svg/site-logo.svg" alt="Logo Pop">
            <div class="TituloContenedor">| Funko Pop Collection</div>

            <div class="container-botones">
                <button class="btns" onclick="location.href='login.jsp'"><span> Iniciar Sesion </span> </button>
                <button class="btns" onclick="location.href='registrar.jsp'"><span> Registrarse </span> </button>
            </div>
        </div>

        <div class="Promocion">
            <img class="imagenb" src="https://funko.com/on/demandware.static/-/Sites-FunkoUS-Library/default/dwc2f80c39/images/funko/page-designer/hero/2025/07.%20July/PY_MLB_WEB_HOMEBANNER_CHAR.png" alt="imagen">
        </div>


        <!-- Botón redondo solo en móvil -->
        <div class="toggle-button" id="toggleButton">☰</div>

        <!-- Menú desplegable tipo flotante -->
        <div class="menu-flotante" id="menuFlotante">
            <ul>
                <li><a href="login.jsp"> Inicio De Sesion </a></li>
                <li><a href="Registrar.jsp"> Registrarse </a></li>
                <li><a href="#"> Soporte </a></li>
            </ul>
        </div>


        <div class="container">
            <h1 class="titulo">Funkos</h1>
            <div class="cuadro">
                <p style="font-size: 40px;padding: 30px;">Datos Sobre Funkos</p>
                <div class="texto">Los Funko Pop! son figuras coleccionables creadas por la empresa estadounidense Funko Inc. Su diseño característico incluye 
                    cabezas grandes, ojos negros y cuerpos pequeños.
                    Desde su lanzamiento en 2010, se han producido miles de modelos inspirados en personajes de películas, series, videojuegos, deportes y cultura pop.
                    Gracias a sus ediciones limitadas y colaboraciones exclusivas, los Funkos se han convertido en objetos muy buscados por coleccionistas alrededor del mundo.</div>
                <p style="font-size: 20px;padding: 20px;">Somos la mejor tienda de Venta de Funkos en Guatemala</p>
                <button class="btn-conocenos">Conócenos</button>
            </div>
        </div>
        <!-- From Uiverse.io by kamehame-ha --> 
        <div class="main-content">   
            <button class="btn-cssbuttons">
                <span>Contáctanos</span>
                <span>
                    <svg height="24" width="24" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" class="icon">
                    <path fill="#ffffff" d="M767.99994 585.142857q75.995429 0 129.462857 53.394286t53.394286 129.462857-53.394286 129.462857-129.462857 53.394286-129.462857-53.394286-53.394286-129.462857q0-6.875429 1.170286-19.456l-205.677714-102.838857q-52.589714 49.152-124.562286 49.152-75.995429 0-129.462857-53.394286t-53.394286-129.462857 53.394286-129.462857 129.462857-53.394286q71.972571 0 124.562286 49.152l205.677714-102.838857q-1.170286-12.580571-1.170286-19.456 0-75.995429 53.394286-129.462857t129.462857-53.394286 129.462857 53.394286 53.394286 129.462857-53.394286 129.462857-129.462857 53.394286q-71.972571 0-124.562286-49.152l-205.677714 102.838857q1.170286 12.580571 1.170286 19.456t-1.170286 19.456l205.677714 102.838857q52.589714-49.152 124.562286-49.152z"></path>
                    </svg>
                </span>
                <ul>
                    <li>
                        <a href="https://github.com/JavierGomez0/Funkinal.git" target="_blank">
                            <!-- GitHub -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 1024 1024" class="icon">
                            <path fill="white" d="M512 76C267 76 64 279 64 524c0 198 128 365 306 424 22 4 30-10 30-22v-78c-124 28-150-52-150-52-20-50-48-64-48-64-40-28 2-28 2-28 44 4 68 46 68 46 40 68 104 48 130 36 4-30 16-48 28-58-98-12-202-50-202-222 0-48 18-88 46-120-4-12-20-60 4-124 0 0 38-12 126 46 38-10 78-14 118-14s80 4 118 14c88-58 126-46 126-46 24 64 8 112 4 124 28 32 46 72 46 120 0 172-104 210-202 222 16 14 30 42 30 86v128c0 12 8 26 30 22 178-60 306-226 306-424 0-245-203-448-448-448z"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://api.whatsapp.com/message/RXTLF5DUIDDIE1?autoload=1&app_absent=0" target="_blank">
                            <!-- WhatsApp -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 32 32" class="icon">
                            <path fill="white" d="M16 .6C7.2.6.2 7.6.2 16.4c0 2.9.8 5.7 2.3 8.1L.2 31.4l7.2-2.3c2.3 1.3 4.9 2 7.6 2 8.8 0 15.8-7.2 15.8-16S24.8.6 16 .6zM16 29c-2.3 0-4.6-.7-6.6-1.9l-.5-.3-4.3 1.3 1.3-4.2-.3-.5c-1.4-2-2.1-4.3-2.1-6.7 0-7.2 5.8-13 13-13s13 5.8 13 13-5.8 13.1-13 13.1zm7.6-9.8c-.4-.2-2.2-1.1-2.5-1.2-.3-.1-.5-.2-.7.2s-.8 1.2-1 1.4c-.2.2-.4.3-.8.1-.4-.2-1.5-.6-2.8-1.9-1-1.1-1.7-2.3-1.9-2.7-.2-.4 0-.6.2-.8.2-.2.4-.4.6-.6.2-.2.3-.4.5-.6.2-.2.2-.3.3-.5.1-.2 0-.4 0-.6s-.7-1.6-1-2.2c-.2-.5-.5-.4-.7-.4s-.4 0-.6 0c-.2 0-.6.1-.9.5-.3.4-1.1 1.1-1.1 2.6s1.1 3 1.3 3.2c.2.3 2.2 3.4 5.4 4.8.8.4 1.5.6 2 .7.8.2 1.6.2 2.2.1.7-.1 2.2-.9 2.5-1.8.3-.9.3-1.6.2-1.8-.2-.1-.4-.2-.6-.3z"/>
                            </svg>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/originalfunko/" target="_blank">
                            <!-- Instagram -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" class="icon">
                            <path fill="white" d="M12 2.2c3.2 0 3.6 0 4.8.1 1.2.1 2 .2 2.5.4.6.2 1.1.5 1.6 1 .5.5.8 1 .9 1.6.2.5.3 1.3.4 2.5.1 1.2.1 1.6.1 4.8s0 3.6-.1 4.8c-.1 1.2-.2 2-.4 2.5-.2.6-.5 1.1-1 1.6-.5.5-1 .8-1.6.9-.5.2-1.3.3-2.5.4-1.2.1-1.6.1-4.8.1s-3.6 0-4.8-.1c-1.2-.1-2-.2-2.5-.4-.6-.2-1.1-.5-1.6-1-.5-.5-.8-1-.9-1.6-.2-.5-.3-1.3-.4-2.5C2.2 15.6 2.2 15.2 2.2 12s0-3.6.1-4.8c.1-1.2.2-2 .4-2.5.2-.6.5-1.1 1-1.6.5-.5 1-.8 1.6-.9.5-.2 1.3-.3 2.5-.4C8.4 2.2 8.8 2.2 12 2.2M12 0C8.7 0 8.3 0 7.1.1 5.9.2 4.9.4 4.1.7c-.8.3-1.5.7-2.2 1.4-.7.7-1.1 1.4-1.4 2.2C.4 5.9.2 6.9.1 8.1 0 9.3 0 9.7 0 12s0 2.7.1 3.9c.1 1.2.3 2.2.6 3 .3.8.7 1.5 1.4 2.2.7.7 1.4 1.1 2.2 1.4.8.3 1.8.5 3 .6C8.3 24 8.7 24 12 24s3.7 0 4.9-.1c1.2-.1 2.2-.3 3-.6.8-.3 1.5-.7 2.2-1.4.7-.7 1.1-1.4 1.4-2.2.3-.8.5-1.8.6-3 .1-1.2.1-1.6.1-4.9s0-3.7-.1-4.9c-.1-1.2-.3-2.2-.6-3-.3-.8-.7-1.5-1.4-2.2-.7-.7-1.4-1.1-2.2-1.4-.8-.3-1.8-.5-3-.6C15.7 0 15.3 0 12 0zM12 5.8a6.2 6.2 0 1 0 0 12.4 6.2 6.2 0 0 0 0-12.4zm0 10.2a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm6.4-11.6a1.44 1.44 0 1 0 0 2.88 1.44 1.44 0 0 0 0-2.88z"/>
                            </svg>
                        </a>
                    </li>
                </ul>
            </button>
        </div>
        <!-- Pie de página / Información general -->
        <footer class="footer2">
            <div class="footer-contenido2">
                <p>© 2025 Funko Pop Collection. Todos los derechos reservados.</p>
                <p>Contacto: info@funkocollection.com | Tel: +502 1234-5678</p>
                <p>Dirección: Ciudad de Guatemala, Guatemala</p>
            </div>
        </footer>
        <script>
            const toggleButton = document.getElementById("toggleButton");
            const menu = document.getElementById("menuFlotante");

            toggleButton.addEventListener("click", (e) => {
                e.stopPropagation(); // Para evitar que el clic se propague
                menu.classList.toggle("show");
                toggleButton.textContent = menu.classList.contains("show") ? "X" : "☰";
            });

            // Cerrar al hacer clic fuera
            document.addEventListener("click", (event) => {
                if (!menu.contains(event.target) && event.target !== toggleButton) {
                    if (menu.classList.contains("show")) {
                        menu.classList.remove("show");
                        toggleButton.textContent = "☰";
                    }
                }
            });

            // Cerrar al redimensionar
            window.addEventListener("resize", () => {
                if (menu.classList.contains("show")) {
                    menu.classList.remove("show");
                    toggleButton.textContent = "☰";
                }
            });
        </script>

    </body>
</html>
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
        <title>Funko Pop</title>
        <link rel="stylesheet" href="styles/inicio.css">
    </head>

    <body>
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

        <div class="carrusel-container">
            <div class="carrusel" id="carrusel">
                <img src="https://kawaii.gt/image/cache/catalog/Artes%20/SLIDER/NENDOROID-BANNER-WEB-1350x640.jpg" alt="Nendoroid">
                <img src="https://kawaii.gt/image/cache/catalog/Artes%20/SLIDER/TLOZTOTK-COVER-1350x640.jpg" alt="Zelda">
                <img src="https://kawaii.gt/image/cache/catalog/Artes%20/SLIDER/GOLDEN-SNITCH-1350x640.jpg" alt="Snitch">
            </div>
            <button class="boton-carrusel anterior" onclick="moverCarrusel(-1)">‹</button>
            <button class="boton-carrusel siguiente" onclick="moverCarrusel(1)">›</button>
        </div>

        <div class="menu-funkos">
            <h2>Colección de Funkos</h2>
            <div class="contenedor-funkos">

                <div class="funko-item">
                    <img src="https://funko.com/dw/image/v2/BGTS_PRD/on/demandware.static/-/Sites-funko-master-catalog/default/dw3d9e8732/images/funko/upload/86537a_POPMOVIES_Terrifier_S2_POP1_GLAM-WEB.png?sw=800&sh=800" alt="The Clown with Candy Filled Head">
                    <p><strong>The Clown with Candy Filled Head</strong><br>Terrifier S2</p>
                    <!-- From Uiverse.io by andrew-demchenk0 --> 

                    <button type="button" class="button">
                        <span class="button__text">Agregar</span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                </div>

                <div class="funko-item">
                    <img src="https://funko.com/on/demandware.static/-/Sites-FunkoUS-Library/default/dwd106aa9a/images/funko/banners/exclusives/July%202025/BeltBanner-TheSimpsons-74105.png" alt="Krusty Doll">
                    <p><strong>Krusty Doll</strong><br>The Simpsons</p>
                    <button type="button" class="button">
                        <span class="button__text">Agregar</span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                </div>

                <div class="funko-item">
                    <img src="https://funko.com/dw/image/v2/BGTS_PRD/on/demandware.static/-/Sites-funko-master-catalog/default/dw22dd9cdd/images/funko/upload/87137_Godzilla_SpaceGodzilla_POP-PREMIUM_EDIT_T7_GLAM-WEB.png?sw=800&sh=800" alt="SpaceGodzilla">
                    <p><strong>SpaceGodzilla</strong><br>Godzilla Saga</p>
                    <button type="button" class="button">
                        <span class="button__text">Agregar</span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                </div>

                <div class="funko-item">
                    <img src="https://funko.com/dw/image/v2/BGTS_PRD/on/demandware.static/-/Sites-funko-master-catalog/default/dwc530d702/images/funko/upload/1/88220_POP_LOTR_Dunharrow-King(GITD)_GLAM-1-WEB.png?sw=800&sh=800" alt="Blade">
                    <p><strong>Dunharrow King</strong><br>El Señor de los Anillos</p>
                    <button type="button" class="button">
                        <span class="button__text">Agregar </span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                </div>

                <div class="funko-item">
                    <img src="https://funko.com/dw/image/v2/BGTS_PRD/on/demandware.static/-/Sites-funko-master-catalog/default/dw160ed8f8/images/funko/upload/86447_Saw_Billy_POPJumbo_GLAM-1-WEB.png?sw=800&sh=800" alt="Billy">
                    <p><strong>Billy</strong><br>Saw</p>
                    <button type="button" class="button">
                        <span class="button__text">Agregar</span>
                        <span class="button__icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" viewBox="0 0 24 24" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor" height="24" fill="none" class="svg"><line y2="19" y1="5" x2="12" x1="12"></line><line y2="12" y1="12" x2="19" x1="5"></line></svg></span>
                    </button>
                </div>

            </div>
        </div>

       <!-- Menú desplegable tipo flotante -->
       <div class="menu-flotante" id="menuFlotante">
           <ul>
               <li><a href="#">Mi Perfil</a></li>
               <li><a href="#">Carrito</a></li>
               <li><a href="#">Historial de Compras</a></li>
           </ul>
       </div>


        <!-- Isla (solo escritorio) -->
        <ul class="isla">
            <li data-title="Busqueda" class="perfil-contenedor">
                <img src="https://cdn-icons-png.flaticon.com/128/2697/2697422.png" alt="Imagen 2" class="img-isla">      
                <!-- Buscador oculto inicialmente -->
                <div class="buscador2" id="buscadorPerfil">
                    <input type="text" placeholder="Buscar...">
                    <button onclick="cerrarBuscador()">X</button>
                </div>
            </li>


            <li data-title="Perfil">
                <img src="https://cdn-icons-png.flaticon.com/128/64/64572.png" alt="Imagen 2" class="img-isla">      
            </li>

            <li data-title="Carrito">
                <img src="https://cdn-icons-png.flaticon.com/128/1170/1170678.png" alt="Imagen 4" class="img-isla">
            </li>
            
            <li data-title="Historial">
                <img src="https://cdn-icons-png.flaticon.com/128/8302/8302434.png" alt="Imagen 4" class="img-isla">
            </li>

       

        </ul>

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

        <!-- Pie de página / Información general -->
        <footer class="footer">
            <div class="footer-contenido">
                <p>&copy; 2025 Funko Pop Collection. Todos los derechos reservados.</p>
                <p>Contacto: info@funkocollection.com | Tel: +502 1234-5678</p>
                <p>Dirección: Ciudad de Guatemala, Guatemala</p>
            </div>
        </footer>



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

        <script>
            let indice = 0;

            function moverCarrusel(direccion) {
                const carrusel = document.getElementById("carrusel");
                const total = carrusel.children.length;
                indice = (indice + direccion + total) % total;
                carrusel.style.transform = `translateX(-${indice * 100}%)`;
            }
        </script>

        <script>
            function abrirMenuFlotante() {
                const menu = document.querySelector('.menu-flotante2');
                menu.classList.toggle('show');
            }
        </script>

    </body>
</html>
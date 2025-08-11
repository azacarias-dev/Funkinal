<%-- 
    Document   : usuariosEditar
    Created on : 29/07/2025, 6:22:32 p. m.
    Author     : zackl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.UsuariosPojo"%>
<%
    UsuariosPojo usuario = (UsuariosPojo) request.getAttribute("usuarioEditar");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Usuario</title>
    <link rel="stylesheet" href="styles/usuariosEditar.css"/>
    <link rel="icon" type="image/png" href="https://www.funko.com/on/demandware.static/Sites-FunkoUS-Site/-/default/dwdf4d4162/images/favicons/funko-favicon-96x96.png" />
</head>
<body>
    <h2>Editar Usuario</h2>
    <form action="ServletUsuarios" method="post">
        <input type="hidden" name="accion" value="actualizar">
        <input type="hidden" name="id" value="<%= usuario.getIdUsuario() %>">
        
        <label>Nombre: </label>
        <input type="text" name="nombre" value="<%= usuario.getNombre() %>">
        <label>Apellido: </label>
        <input type="text" name="apellido" value="<%= usuario.getApellido() %>">
        <label>Correo: </label>
        <input type="email" name="correo" value="<%= usuario.getCorreo() %>">
        <label>Telefono: </label>
        <input type="text" name="telefono" value="<%= usuario.getTelefono() %>">

        <button type="submit">Actualizar</button>
    </form>
</body>
</html>


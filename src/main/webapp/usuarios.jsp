<%-- 
    Document   : Usuarios
    Created on : 29/07/2025, 09:11:26
    Author     : informatica
--%>

<%@page import="java.util.List"%>
<%@page import="model.UsuariosPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Clientes</title>
        <link rel="stylesheet" href="styles/usuarios.css"/>
    </head>
    <body>

        <div class="container">
            <div class="row">
                <div class="col-4">
                    <h2 class="mb-4 text-center">Lista de clientes</h2>
                    <table class="table table-striped table-bordered table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Correo</th>
                                <th>Contraseña</th>
                                <th>Telefono</th>
                                <th>Acción</th>
                            </tr>                          
                        </thead>
                        <tbody>
                            <%
                                List<UsuariosPojo> listaCliente = (List<UsuariosPojo>) request.getAttribute("usuarioListar");
                                if (listaCliente != null && !listaCliente.isEmpty()) {
                                    for (UsuariosPojo c : listaCliente) {
                                        //Llene la tabla, fila -> columna de Cliente
%>
                            <tr>
                                <td><%= c.getIdUsuario()%></td>
                                <td><%= c.getNombre()%></td>
                                <td><%= c.getApellido()%></td>
                                <td><%= c.getCorreo()%></td>
                                <td><%= c.getContrasena()%></td>
                                <td><%= c.getTelefono()%></td>
                                <td>
                                    <a href="ServletUsuarios?accion=editar&id=<%= c.getIdUsuario()%>"
                                       class="btn btn-warning btn-sm">Editar</a>
                                    <a href="ServletUsuarios?accion=eliminar&id=<%= c.getIdUsuario()%>"
                                       class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar este Cliente?')">Eliminar</a>
                                </td>
                            </tr>

                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="7" class="text-center">No hay usuarios registrados.</td>
                            </tr>
                            <%
                                }
                            %>


                        </tbody>
                    </table>

                </div>              
            </div>                    
        </div>          
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>

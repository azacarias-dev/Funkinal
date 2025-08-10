<%-- 
    Document   : CerrarSesion.jsp
    Created on : 2 ago 2025
    Author     : PC
    Descripción: Invalida la sesión del usuario y redirige al login
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Invalida la sesión actual
    session.invalidate();

    // Redirige al formulario de login con un mensaje opcional
    response.sendRedirect("index.jsp?cerrado=true");
%>

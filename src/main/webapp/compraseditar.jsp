<%-- 
    Document   : ComprasEditar
    Created on : 29/07/2025, 16:55:29
    Author     : MIGUEL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Actualizar Metodo De Pago</title>
  <link rel="stylesheet" href="styles/Compraseditar.css">
</head>
<body>

  <h2>Agregar Pago</h2>

  <form action="tu_controlador" method="post">
    <label for="fecha">Fecha de pago:</label>
    <input type="date" id="fecha" name="fecha" required>

    <label for="metodo_pago">Método de pago:</label>
    <select id="metodo_pago" name="metodo_pago" required>
      <option value="">Seleccione...</option>
      <option value="efectivo">Efectivo</option>
      <option value="tarjeta_credito">Tarjeta de crédito</option>

    </select>

    <button type="#">Guardar Pago</button>
  </form>

</body>
</html>


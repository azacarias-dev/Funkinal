<%-- 
    Document   : CompraExitosaModal
    Created on : 4 ago 2025
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal Compra Exitosa -->
<div class="modal fade" id="modalCompraExitosa" tabindex="-1" aria-labelledby="modalCompraExitosaLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm modal-dialog-centered">
        <div class="modal-content text-center p-3">

            <div class="modal-body">
                <!-- Imagen check -->
                <img src="https://www.kadi-int.com/imagenes/check-circle.gif" alt="Compra Exitosa" style="width: 80px; margin-bottom: 20px;">
                
                <!-- Título -->
                <h4 id="modalCompraExitosaLabel" class="mb-3">¡Compra Exitosa!</h4>

                <!-- Mensaje -->
                <p>Gracias por su compra. Su pedido ha sido procesado correctamente.</p>
            </div>

            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">Aceptar</button>
            </div>

        </div>
    </div>
</div>

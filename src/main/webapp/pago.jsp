<%@ page import="java.util.*, com.productos.negocio.Producto" %>
<%@ page session="true" %>
<%
    Map<Integer, Integer> carrito = (Map<Integer, Integer>) session.getAttribute("carrito");
    Producto producto = new Producto();
    String resumen = "";
    String mensaje = "";

    if (carrito != null && !carrito.isEmpty()) {
        resumen = producto.mostrarContenidoCarrito(carrito);
    } else {
        resumen = "<p>No hay productos en el carrito.</p>";
    }
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String nombreCliente = request.getParameter("nombrePropietario");

        if (nombreCliente != null && !nombreCliente.isEmpty()) {
            Producto p = new Producto();
            p.registrarVentas(carrito, nombreCliente);

            // Redirige automáticamente al JSP de confirmación
            response.sendRedirect("confirmacion.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pago con Tarjeta</title>
    <link href="css/pago.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="formulario-pago">
    <h2>Resumen de la compra</h2>

    <div class="resumen-productos">
        <%= resumen %>
    </div>

    <h2>Datos de la tarjeta</h2>
<form action="pago.jsp" method="post">
    <label>Tipo de tarjeta</label>
    <select name="tipoTarjeta" required>
        <option value="">Seleccione</option>
        <option value="Visa">Visa</option>
        <option value="MasterCard">MasterCard</option>
        <option value="Amex">American Express</option>
    </select>

    <label>Número de tarjeta</label>
    <input type="text" name="numeroTarjeta" maxlength="16" pattern="\d{16}" required>

    <label>CVC</label>
    <input type="text" name="cvc" maxlength="3" pattern="\d{3}" required>

    <label>Fecha de vencimiento</label>
    <input type="month" name="vencimiento" required>

    <label>Nombre del propietario</label>
    <input type="text" name="nombrePropietario" required>

    <button type="submit" class="btn-pagar">Confirmar pago</button>
</form>
<form action="carrito.jsp" method="get">
    <button type="submit" class="btn-pagar" style="margin-top: 10px; background-color: #007bff;">
        Volver al carrito
    </button>
</form>
</div>
</body>
</html>

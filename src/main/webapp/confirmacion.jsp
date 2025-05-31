<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Elimina el carrito después del registro exitoso
    session.removeAttribute("carrito");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmación de Compra</title>
    <link href="css/conf.css" rel="stylesheet" type="text/css">
    <style>

    </style>
</head>
<body>
    <div class="mensaje">
        <h2>✅ Compra realizada con éxito</h2>
        <p>Gracias por su compra. Su pedido ha sido registrado correctamente.</p>
        <a href="Menu.jsp">Volver al Menu</a>
    </div>
</body>
</html>

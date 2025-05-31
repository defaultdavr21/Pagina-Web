<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
    <%
    String mensaje = "";
    int idProducto = 0;
    String nombreProducto = "";
    String categoria = "";

    // Si llega por GET
    if (request.getParameter("id") != null) {
        idProducto = Integer.parseInt(request.getParameter("id"));
        Producto pr = new Producto();
        Object[] datos = pr.obtenerProductoPorId(idProducto);

        if (datos != null) {
            nombreProducto = (String) datos[0];
            categoria = (String) datos[1];
        } else {
            mensaje = "❌ Producto no encontrado.";
        }
    }

    // Si el usuario confirma la eliminación (POST)
    if (request.getParameter("confirmar") != null && request.getParameter("id") != null) {
        idProducto = Integer.parseInt(request.getParameter("id"));
        Producto pr = new Producto();
        mensaje = pr.eliminarProductoPorId(idProducto);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Producto</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <h2>Eliminar Producto</h2>

    <% if (!mensaje.equals("")) { %>
        <p><strong><%= mensaje %></strong></p>
        <a href="adminproducto.jsp">Volver a la lista de productos</a>
    <% } else if (nombreProducto != null && !nombreProducto.equals("")) { %>
        <p>¿Estás seguro de que deseas eliminar el siguiente producto?</p>
        <ul>
            <li><strong>ID:</strong> <%= idProducto %></li>
            <li><strong>Nombre:</strong> <%= nombreProducto %></li>
            <li><strong>Categoría:</strong> <%= categoria %></li>
        </ul>

        <form method="post" action="eliminar.jsp">
            <input type="hidden" name="id" value="<%= idProducto %>">
            <input type="submit" name="confirmar" value="Sí, eliminar">
            <a href="adminproducto.jsp">Cancelar</a>
        </form>
    <% } else { %>
        <p>No se ha especificado un producto válido para eliminar.</p>
        <a href="adminproducto.jsp">Volver</a>
    <% } %>
</body>
</html>
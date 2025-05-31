<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*"%>
<%
    String mensaje="";
    Producto producto=new Producto();
    Categoria categoria=new Categoria();

    String idStr=request.getParameter("id");
    if (idStr==null) {
        response.sendRedirect("adminproducto.jsp");
        return;
    }
    int idProducto = Integer.parseInt(idStr);

    String nombre=" ";
    int idCat=0;
    int cantidad=0;
    double precio=0.0;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            nombre = request.getParameter("txtNombre");
            idCat = Integer.parseInt(request.getParameter("cmbCategoria"));
            cantidad = Integer.parseInt(request.getParameter("cantidad"));
            precio = Double.parseDouble(request.getParameter("precio"));

            mensaje = producto.actualizarProducto(idProducto,nombre,idCat,cantidad,precio);

            if(!mensaje.startsWith("❌")) {
                mensaje="✔ Producto actualizado correctamente.";
            }
        } catch(Exception e) {
            mensaje="❌ Error al actualizar el producto: "+e.getMessage();
        }
    }
    // Cargar datos actuales si no es POST o hubo error
    if (!"POST".equalsIgnoreCase(request.getMethod()) || mensaje.startsWith("❌")) {
        Object[] datos = producto.obtenerProductoCompletoPorId(idProducto);
        if (datos != null) {
            nombre = (String) datos[0];
            idCat = (Integer) datos[1];
            cantidad = (Integer) datos[2];
            precio = (Double) datos[3];
        } else {
            response.sendRedirect("adminproducto.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Producto</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>

<h2>Actualizar Producto</h2>

<% if (!mensaje.isEmpty()) { %>
    <p style="color: <%= mensaje.startsWith("❌") ? "red" : "green" %>;"><strong><%= mensaje %></strong></p>
<% } %>

<form action="actualizar.jsp?id=<%= idProducto %>" method="post">
    <label for="txtNombre">Nombre:</label><br>
    <input type="text" name="txtNombre" id="txtNombre" value="<%= nombre %>" required><br><br>

    <label for="cmbCategoria">Categoría:</label><br>
    <%
        String combo = categoria.mostrarCategoria();
        combo = combo.replaceAll("<option value=" + idCat + ">", "<option value=" + idCat + " selected>");
        out.print(combo);
    %>
    <br><br>

    <label for="cantidad">Cantidad:</label><br>
    <input type="number" name="cantidad" id="cantidad" min="1" value="<%= cantidad %>" required><br><br>

    <label for="precio">Precio (USD):</label><br>
    <input type="number" name="precio" id="precio" step="0.01" min="0" value="<%= precio %>" required><br><br>

    <button type="submit">Confirmar</button>
    <button type="button" onclick="window.location='producto.jsp'">Cancelar</button>
</form>

</body>
</html>
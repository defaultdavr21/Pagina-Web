<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorías</title>
    <link href="css/Cat.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- Encabezado -->
    <header>
        <h1>Productos por categoria</h1>
    </header>

    <!-- Navegación -->
    <nav>
        <a href="index.jsp">Inicio</a>
        <a href="categorias.jsp">Buscar por Categoría</a>
        <a href="login.jsp">Login</a>
    </nav>

    <!-- Contenedor principal -->
    <div>
        <h3>Categorías de productos</h3>

        <!-- Formulario para seleccionar categoría -->
        <form method="get" action="categorias.jsp">
            <%
                Categoria cat = new Categoria();
                out.print(cat.mostrarCategoria());
            %>
            <input type="submit" value="Buscar productos">
        </form>

        <hr>

        <!-- Mostrar productos si se selecciona una categoría -->
        <%
            String catParam = request.getParameter("cmbCategoria");
            if (catParam != null) {
                try {
                    int idCat = Integer.parseInt(catParam);
                    Producto prod = new Producto();
                    out.print("<h3>Productos en la categoría seleccionada:</h3>");
                    out.print(prod.buscarProductoCategoria(idCat));
                } catch (NumberFormatException e) {
                    out.print("<p class='error-message'>❌ ID de categoría no válido.</p>");
                }
            }
        %>
    </div>

    <!-- Pie de página -->
    <footer>
        <ul class="redes-sociales">
            <li>
                <a href="https://facebook.com" target="_blank">
                    <img src="imagenes/iconos/facebook.png" alt="Facebook">
                </a>
            </li>
            <li>
                <a href="https://instagram.com" target="_blank">
                    <img src="imagenes/iconos/instagram.png" alt="Instagram">
                </a>
            </li>
            <li>
                <a href="https://tiktok.com" target="_blank">
                    <img src="imagenes/iconos/tiktok.png" alt="TikTok">
                </a>
            </li>
        </ul>
    </footer>
</body>
</html>
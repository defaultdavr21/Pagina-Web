<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.negocio.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link href="css/productos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- Contenedor principal -->
    <div>
        <h1 class="titulo">Productos disponibles</h1>
        <!-- Mostrar productos -->
        <div>
            <%
                Producto pr = new Producto();
                out.print(pr.consultarTodo());
            %>
        </div>
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

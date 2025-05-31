<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.productos.seguridad.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bitácora de Auditoría</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <!-- Contenedor principal -->
    <div class="contenedor">
        <h1 class="titulo">Bitácora de Auditoría</h1>
        
        <!-- Mostrar la tabla con la información de la auditoría -->
        <div class="tabla-container">
            <%
                Pagina pr = new Pagina();
                out.print(pr.consultarbitacoraaud());
            %>
        </div>

    </div>

    <!-- Pie de página -->
    <footer>
 
    </footer>
</body>
</html>

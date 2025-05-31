<%@ page import="java.util.*, com.productos.negocio.Producto,com.productos.datos.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>

<%
    if (request.getParameter("clear") != null) {
        session.removeAttribute("carrito");
    }

    Producto producto = new Producto();
    Map<Integer, Integer> carrito = (Map<Integer, Integer>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new HashMap<Integer, Integer>();
        session.setAttribute("carrito", carrito);
    }

    String idAgregar = request.getParameter("add");
    String cantParam = request.getParameter("cant");
    if (idAgregar != null) {
        int id = Integer.parseInt(idAgregar);
        int cantidad = 1;
        if (cantParam != null) {
            try {
                cantidad = Integer.parseInt(cantParam);
                if (cantidad < 1) cantidad = 1;
            } catch (NumberFormatException e) {
                cantidad = 1;
            }
        }
        carrito.put(id, carrito.getOrDefault(id, 0) + cantidad);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/carrito.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="container-fluid mt-4">
    <h1 class="text-center mb-4">🛒 Productos disponibles</h1>
    
    <div class="row">
        <div class="col-md-8">
            <div class="row">
                <%= producto.mostrarCatalogoCarrito() %>
            </div>
        </div>

        <div class="col-md-4 carrito-lateral shadow p-4 bg-light rounded">
            <h2 class="mb-3">🧺 Carrito</h2>
            <%= producto.mostrarContenidoCarrito(carrito) %>
            <div class="mt-3 d-grid gap-2">
                <a href="carrito.jsp?clear=1" class="btn btn-danger">Vaciar carrito</a>
                <a href="pago.jsp" class="btn btn-success">Pagar</a>
                <a href="Menu.jsp" class="btn btn-success">Volver al menu</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>

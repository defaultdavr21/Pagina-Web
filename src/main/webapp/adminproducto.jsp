<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"  import="com.productos.negocio.*"%>
    <%
    String mensaje = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String nombre = request.getParameter("txtNombre");
            int idCategoria = Integer.parseInt(request.getParameter("cmbCategoria"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double precio = Double.parseDouble(request.getParameter("precio"));

            Producto prInsert = new Producto();
            mensaje = prInsert.insertarProducto(nombre,idCategoria,cantidad,precio);
        } catch (Exception e) {
            mensaje = "❌ Error al insertar el producto: " + e.getMessage();
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Formulario de Producto</h2>
        <form>
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Producto</label>
                <input type="text" class="form-control" id="nombre" name="txtNombre" required>
            </div>
            <div class="mb-3">
                <label for="categoria" class="form-label">Categoría</label>
                <select class="form-select" id="categoria" name="cmbCategoria" required>
                    <option value="" selected disabled>Selecciona una categoría</option>
                    <option value="1">Bebidas</option>
                    <option value="2">Vegetales</option>
                    <option value="3">Frutas</option>
			    	<option value="4">Alimentos</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="cantidad" class="form-label">Cantidad</label>
                <input type="number" class="form-control" id="cantidad" name="cantidad" required>
            </div>
            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="number" step="0.01" class="form-control" id="precio" name="precio" required>
            </div>
            <div class="mb-3">
                <label for="foto" class="form-label">Foto</label>
                <input type="file" class="form-control" id="foto" >
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary">Enviar</button>
                <button type="reset" class="btn btn-secondary">Borrar</button>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<div>
	<%
       Producto pr = new Producto();
       out.print(pr.reporteProducto());
     %>
	</div>
</body>
</html>

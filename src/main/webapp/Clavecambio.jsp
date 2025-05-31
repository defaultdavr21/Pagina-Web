<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.seguridad.*" %>
<%
    String correo = (String) session.getAttribute("correo");

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String claveAnterior = request.getParameter("claveAnterior");
        String claveNueva = request.getParameter("claveNueva");
        String repetirClave = request.getParameter("repetirClave");

        System.out.println("Correo desde sesión: " + correo);
        System.out.println("==> Cambiando clave...");
        System.out.println("Clave anterior: " + claveAnterior);
        System.out.println("Nueva clave: " + claveNueva);
        System.out.println("Repetida: " + repetirClave);

        if (claveAnterior != null && claveNueva != null && repetirClave != null) {
            Usuario u = new Usuario();

            if (u.verificarClave(claveAnterior)) {
                if (u.coincidirClaves(claveNueva, repetirClave)) {
                    boolean cambioExitoso = u.cambiarClave(correo, claveNueva);
                    if (cambioExitoso) {
%>
                    <script>alert("✅ Contraseña actualizada correctamente.");
                    window.location.href = 'Menu.jsp';</script>
<%
                    } else {
%>
                        <script>alert("❌ Error al actualizar la contraseña.");</script>
<%
                    }
                } else {
%>
                    <script>alert("⚠️ Las contraseñas no coinciden.");</script>
<%
                }
            } else {
%>
                <script>alert("🔒 La contraseña actual es incorrecta.");</script>
<%
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cambio de Clave</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
	    <div class="container mt-4">
        <div class="card shadow p-4">
            <h3 class="card-title">Cambio de Contraseña</h3>
            <form method="post">
                <div class="mb-3">
                    <label for="claveAnterior" class="form-label">Clave Anterior</label>
                    <input type="password" name="claveAnterior" id="claveAnterior" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="claveNueva" class="form-label">Nueva Clave</label>
                    <input type="password" name="claveNueva" id="claveNueva" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="repetirClave" class="form-label">Repetir Nueva Clave</label>
                    <input type="password" name="repetirClave" id="repetirClave" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Confirmar</button>
            </form>
        </div>
    </div>
</body>
</html>
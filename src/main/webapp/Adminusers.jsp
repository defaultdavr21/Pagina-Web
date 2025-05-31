<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.productos.negocio.*,com.productos.seguridad.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Administrador de usuarios</title>
	<link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
        <h2>Registro de empelados y administradores</h2>
        <form action="Mostrar.jsp" method="post" class="form-box">
            <label for="txtNombre">Nombre y Apellido</label>
            <input type="text" name="txtNombre" required>
            <label for="txtCedula">Cédula</label>
            <input type="text" name="txtCedula" maxlength="10" required>
            <label for="txtCorreo">Correo</label>
            <input type="email" name="txtCorreo" placeholder="usuario@dominio.com" required>
            <label for="cmbECivil">Estado Civil</label>
            <select name="cmbECivil" required>
                <option value="1">Soltero</option>
                <option value="2">Casado</option>
                <option value="3">Divorciado</option>
                <option value="4">Unión Libre</option>
            </select>
            <label for="cmbPerfil">Perfil</label>
            <select name="cmbPerfil" required>
                <option value="1">Administrador</option>
                <option value="3">Empleado</option>
            </select>
            <input type="submit" value="Registrar Usuario">
        </form>
    </div>
</body>
</html>
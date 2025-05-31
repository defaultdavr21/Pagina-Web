<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrarse</title>
    <link href="css/estilos.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="form-image fade-in">
            <img class="imagen-transicion" src="imagenes/imagen2.jpg" alt="Registro">
        </div>
        <form action="respuesta.jsp" method="post" class="form-box">
            <h2>Formulario de Registro</h2>
            <label for="txtNombre">Nombre</label>
            <input type="text" name="txtNombre" required>

            <label for="txtCedula">Cédula</label>
            <input type="text" name="txtCedula" maxlength="10" required>
            
            <label for="txtCorreo">Correo</label>
            <input type="email" name="txtCorreo" placeholder="usuario@nombreProveedor.dominio" required>
            
			<label for="txtpw">Contraseña</label>
            <input type="password" name="txtpw" required>
            
            <label for="cmbECivil">Estado Civil</label>
          	<select name="cmbECivil">
	    		<option value="1">Soltero</option>
	    		<option value="2">Casado</option>
		    	<option value="3">Divorciado</option>
		    	<option value="4">Unión Libre</option>
			</select>

            <label>Residencia</label>
            <div class="radios">
                <label><input type="radio" name="rdResidencia" value="Sur"> Sur</label>
                <label><input type="radio" name="rdResidencia" value="Norte"> Norte</label>
                <label><input type="radio" name="rdResidencia" value="Centro"> Centro</label>
            </div>
            
            <label for="fileFoto">Subir Foto</label>
            <input type="file" name="fileFoto">

            <label for="fecha">Mes y Año de nacimiento</label>
            <input type="month" name="fecha">

            <label for="colorFavorito">Color Favorito</label>
            <input type="color" name="colorFavorito">

            <input type="submit" value="Entrar/Registro">
        </form>
    </div>
</body>
</html>

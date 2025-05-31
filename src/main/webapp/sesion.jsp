<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Fuente moderna -->
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e2e6cc;
        }
        .login-container {
            max-width: 450px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 20px;
        }
        .form-text {
            font-size: 0.9rem;
            color: #6c757d;
        }
    </style>
</head>
<body>

<main>
    <div class="login-container">
        <h1>Inicia sesión con nuestro servicio</h1>
        <h2>Ingresa tus datos</h2>

        <form action="validaruser.jsp" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Correo Electrónico *</label>
                <input type="email" class="form-control" id="email" name="usuario" placeholder="usuario@dominio.com" required>
            </div>

            <div class="mb-3">
                <label for="clave" class="form-label">Clave *</label>
                <input type="password" class="form-control" id="clave" name="clave" required>
            </div>

            <p class="form-text">* Campo Obligatorio</p>

            <div class="d-flex justify-content-between">
                <button type="submit" name="btnEnviar" id="btnEnviar" class="btn btn-success">Enviar registro</button>
                <button type="reset" class="btn btn-secondary">Limpiar</button>
            </div>
        </form>
		<div class="mt-4 text-center">
		    <a href="registro.jsp" class="btn btn-primary">
		        Registrarse como nuevo cliente
		    </a>
		</div>
    </div>
</main>

</body>
</html>

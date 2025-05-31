<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*, java.util.Date"%>
<%
 String usuario;
 HttpSession sesion=request.getSession();
 if (sesion.getAttribute("usuario")==null){
%>
    <jsp:forward page="login.jsp">
        <jsp:param name="error" value="Debe registrarse en el sistema."/>
    </jsp:forward>
<%
 } else {
     usuario=(String) sesion.getAttribute("usuario"); 
     int perfil=(Integer) sesion.getAttribute("perfil");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Menú Principal</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Menu.css" rel="stylesheet" type="text/css">
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Sistema Productos</a>
        </div>
    </nav>
    <div class="container mt-4">
        <div class="card shadow p-4">
            <h3 class="card-title">Bienvenido,<strong><%=usuario%></strong></h3>
            <div class="card-body">
            <h5>Menú:</h5>
            	<%
                    Pagina pag = new Pagina();
                    String menu = pag.mostrarMenu(perfil);
                    out.print(menu);
                    if (perfil ==1){
                %>
                    <a href="Adminusers.jsp" class="btn btn-primary">Registrar nuevo usuario</a>                <%
                    }else if(perfil ==3){
                %>
                    <a href="Clavecambio.jsp" class="btn btn-primary">Cambiar contraseña</a>                    
                <%
                    }
                %><br>
                <p><strong>ID de sesión:</strong><%=sesion.getId() %></p>
                <p><strong>Creación:</strong><%=new Date(sesion.getCreationTime()) %></p>
                <p><strong>Último acceso:</strong><%= new Date(sesion.getLastAccessedTime()) %></p>
                <p><strong>Duración de la sesión en milisegundos:</strong><%=sesion.getMaxInactiveInterval() %></p>    
                <hr>
            </div>
        </div>
    </div>

</body>
</html>
<% } %>

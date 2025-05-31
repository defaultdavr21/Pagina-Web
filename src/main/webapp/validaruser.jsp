<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" session="true" import="com.productos.seguridad.*" %>

<%
	Usuario user=new Usuario();
	String nlogin=request.getParameter("usuario");
	String nclave=request.getParameter("clave");
	HttpSession sesion=request.getSession();
	boolean respuesta=user.verificarUsuario(nlogin,nclave);
	if (respuesta){
	sesion.setAttribute("usuario", user.getNombre());
	sesion.setAttribute("perfil", user.getPerfil());
	sesion.setAttribute("correo", user.getCorreo());
	response.sendRedirect("Menu.jsp");
	}else{
%>
<jsp:forward page="Menu.jsp">
<jsp:param name="error" value="Datos incorrectos.<br/>Vuelva a intentarlo."/>
</jsp:forward>
<%
}
%>
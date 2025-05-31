package com.productos.seguridad;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.Conexion;
public class Pagina{
	
	private int id;
	private String nombre;
	private String path;
	public Pagina() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String mostrarMenu(Integer nperfil){ 
		String menu=""; 
		String sql="SELECT * FROM tb_pagina pag, tb_perfil per, " 
		+ "tb_perfilpagina pper " + 
		"WHERE pag.id_pag=pper.id_pag AND pper.id_per=per.id_per " 
		+ "AND pper.id_per= "+nperfil;  
		Conexion con = new Conexion(); 
		ResultSet rs=null; 
		try { 
			rs=con.Consulta(sql); 
			while(rs.next()) { 
				String url = rs.getString(3) + "?accesskey=" + rs.getInt(1);
				System.out.println("URL generada: " + url);
				menu += "<a class='btn btn-primary m-1' href='" + url + "'>" + rs.getString(2) + "</a>";

			}  	 
		}catch(SQLException e){ 
			System.out.print(e.getMessage());
			
		}  
		return menu; 
	 }
	public String consultarbitacoraaud() {
	    String sql = "SELECT * FROM auditoria.tb_auditoria ORDER BY id_aud";  // Asegúrate de que id_aud esté bien escrito
	    Conexion con = new Conexion();
	    String tabla = "<table border='2'>"
	        + "<tr><th>ID</th><th>Tabla</th><th>Operación</th><th>Valor Anterior</th><th>Valor Nuevo</th>"
	        + "<th>Fecha</th><th>Usuario</th><th>Esquema</th><th>Activar</th><th>Trigger</th></tr>";
	    ResultSet rs = con.Consulta(sql);

	    if (rs == null) {
	        return "Error: No se pudo ejecutar la consulta.";
	    }

	    try {
	        while (rs.next()) {
	            tabla += "<tr><td>" + rs.getInt("ID_AUD") + "</td>"
	                    + "<td>" + rs.getString("TABLA_AUD") + "</td>"
	                    + "<td>" + rs.getString("OPERACION_AUD") + "</td>"
	                    + "<td>" + rs.getString("VALORANTERIOR_AUD") + "</td>"
	                    + "<td>" + rs.getString("VALORNUEVO_AUD") + "</td>"
	                    + "<td>" + rs.getDate("FECHA_AUD") + "</td>"
	                    + "<td>" + rs.getString("USUARIO_AUD") + "</td>"
	                    + "<td>" + rs.getString("ESQUEMA_AUD") + "</td>"
	                    + "<td>" + rs.getBoolean("ACTIVAR_AUD") + "</td>"
	                    + "<td>" + rs.getBoolean("TRIGGER_AUD") + "</td></tr>";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "Error al procesar los datos: " + e.getMessage();
	    }

	    tabla += "</table>";
	    return tabla;
	}

}
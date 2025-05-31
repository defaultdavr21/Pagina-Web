package com.productos.seguridad;
import java.sql.ResultSet;
import com.productos.datos.Conexion;


public class Usuario {
	private int id;
	private int perfil;
	private int estadoCivil;
	private String cedula;
	private String nombre;
	private String correo;
	private String Clave;
	public Usuario() {
		// TODO Auto-generated constructor stub
	
	}
	public Usuario(int nperfiles,int nestado,String nnombre, String ncedula, String ncorreo, String nclave) {
		// TODO Auto-generated constructor stub
		this.perfil = nperfiles;
		this.estadoCivil = nestado;
		this.nombre = nnombre;
		this.cedula = ncedula;
		this.correo = ncorreo;
		this.Clave = nclave;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public int getEstadoCivil() {
		return estadoCivil;
	}
	public void setEstadoCivil(int estadoCivil) {
		this.estadoCivil = estadoCivil;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getClave() {
		return Clave;
	}
	public void setClave(String clave) {
		Clave = clave;
	}
	public boolean verificarUsuario(String ncorreo,String nclave){ 
		boolean respuesta=false; 
		String sentencia= "Select * from tb_usuario where correo_us='"+ncorreo+ 
		"' and clave_us='"+nclave+"';"; 
		System.out.print(sentencia);
		
		try { 
			ResultSet rs; 
			Conexion clsCon=new Conexion(); 
			rs=clsCon.Consulta(sentencia); 
			if(rs.next()){  
				respuesta=true; 
				this.setCorreo(ncorreo); 
				this.setClave(nclave); 
				this.setPerfil(rs.getInt("id_per"));  		 
				this.setNombre(rs.getString("nombre_us"));
			}else{ 
				respuesta=false; 
				rs.close(); 
			} 
		}catch(Exception ex){ 
			System.out.println( ex.getMessage()); 
		} 
		return respuesta; 
	}
	public boolean ingresarEmpleado(Integer nperfil,int nestado,String nnombre,String ncedula,String ncorreo){ 
		boolean respuesta=false;
		String nclave="653421";
		String sentencia = "INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) " +
                "VALUES (" + nperfil + ", " + nestado + ", '" + nnombre + "', '" +
                ncedula + "', '" + ncorreo + "', '" + nclave + "');";
		System.out.print(sentencia);
		ResultSet rs; 
		Conexion clsCon=new Conexion(); 
		String resultado=clsCon.Ejecutar(sentencia);
		return respuesta; 
	}
	 public Boolean verificarClave(String aclave){
		 boolean respuesta=false;
		 String sentencia= "Select * from tb_usuario where clave_us='"+aclave+"';"; 
		 try { 
				ResultSet rs; 
				Conexion clsCon=new Conexion(); 
				rs=clsCon.Consulta(sentencia); 
				if(rs.next()){  
					respuesta=true; 
				}else{ 
					respuesta=false; 
					rs.close(); 
				} 
			}catch(Exception ex){ 
				System.out.println( ex.getMessage()); 
			} 
			return respuesta;
	 }
	 public Boolean coincidirClaves(String nclave,String nrepetir){
		 boolean respuesta=false;
		 if(nclave.equals(nrepetir)) {
			 respuesta=true; 
		 }else {
			 respuesta=false; 
		 }
		 return respuesta;
	 }
	 public Boolean cambiarClave(String ncorreo,String nclave){
		 boolean respuesta=false;
		String sentencia= "UPDATE tb_usuario SET clave_us='"+nclave+"' where correo_us='"+ncorreo+"';";
		System.out.println("Correo recibido: " + ncorreo);
		System.out.println("Update SQL: " + sentencia);
		Conexion clsCon = new Conexion();
	    String resultado = clsCon.Ejecutar(sentencia);
	    if (resultado != null) {
	        respuesta = true;
	    }
	    return respuesta;
	 }
}

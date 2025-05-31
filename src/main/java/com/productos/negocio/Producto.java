package com.productos.negocio;
import java.util.List;
import java.util.Map;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.productos.datos.Conexion;
import java.util.ArrayList;

public class Producto {
	
	public String consultarTodo() {
		String sql = "SELECT * FROM tb_producto ORDER BY id_pr";
		Conexion con = new Conexion();
		String tabla = "<table border=2><th>ID</th><th>Producto</th><th>Cantidad</th><th>Precio</th>";
		ResultSet rs = null;
		rs = con.Consulta(sql);

		if (rs == null) {
			return "Error: No se pudo ejecutar la consulta.";
		}
		try {
			while (rs.next()) {
				tabla += "<tr><td>" + rs.getInt(1) + "</td>"
						+ "<td>" + rs.getString(3) + "</td>"
						+ "<td>" + rs.getInt(4) + "</td>"
						+ "<td>" + rs.getDouble(5) + "</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Error al procesar los datos: " + e.getMessage();
		}
		tabla += "</table>";
		return tabla;
	}
	public String buscarProductoCategoria(int cat){
	String sentencia="SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_cat="+cat;
	Conexion con=new Conexion();
	ResultSet rs=null;
	String resultado="<table border=3>";
	try{
	rs=con.Consulta(sentencia);
	while(rs.next())
	{
	resultado+="<tr><td>"+ rs.getString(1)+"</td>"
	 + "<td>"+rs.getDouble(2)+"</td></tr>";
	}
	resultado+="</table>";
	}
	catch(SQLException e){
	System.out.print(e.getMessage());
	}
	System.out.print(resultado);
	return resultado;
	}
	public String eliminarProducto(String id) {
	String sql="DELETE FROM tb_producto WHERE id_pr="+id;
	Conexion con=new Conexion();
	String msg=con.Ejecutar(sql);
	return msg;
	}

    public String reporteProducto() {
        String sql = "SELECT pr.id_pr, pr.nombre_pr, cat.descripcion_cat, pr.cantidad_pr, pr.precio_pr " +
                     "FROM tb_producto pr, tb_categoria cat WHERE pr.id_cat = cat.id_cat";
        Conexion con = new Conexion();
        ResultSet rs = null;
        rs = con.Consulta(sql);

        String tabla = "<table class='tabla-productos'><thead><tr>"
                     + "<th>Id</th>"
                     + "<th>Nombre</th>"
                     + "<th>Categoría</th>"
                     + "<th>Cantidad</th>"
                     + "<th>Precio</th>"
                     + "<th>Modificar</th>"
                     + "<th>Eliminar</th>"
                     + "</tr></thead><tbody>";

        try {
            while (rs.next()) {
                tabla += "<tr>"
                       + "<td>" + rs.getInt(1) + "</td>"
                       + "<td>" + rs.getString(2) + "</td>"
                       + "<td>" + rs.getString(3) + "</td>"
                       + "<td>" + rs.getInt(4) + "</td>"
                       + "<td>" + rs.getDouble(5) + "</td>"
                       + "<td><a href='actualizar.jsp?id=" + rs.getInt(1) + "'>Actualizar</a></td>"
                       + "<td><a href='eliminar.jsp?id=" + rs.getInt(1) + "'>Eliminar</a></td>"
                       + "</tr>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al procesar los datos: " + e.getMessage());
            return "<p>Error al procesar los datos: " + e.getMessage() + "</p>";
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        tabla += "</tbody></table>";
        return tabla;
    }
    
    public String eliminarProductoPorId(int id) {
        String sql = "DELETE FROM tb_producto WHERE id_pr = " + id;
        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }

    public Object[] obtenerProductoPorId(int id) {
        String sql = "SELECT pr.nombre_pr, cat.descripcion_cat " +
                     "FROM tb_producto pr, tb_categoria cat " +
                     "WHERE pr.id_cat = cat.id_cat AND pr.id_pr = " + id;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);
        try {
            if (rs.next()) {
                return new Object[]{ rs.getString(1), rs.getString(2) };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public String insertarProducto(String nombre, int idCategoria, int cantidad, double precio) {
        String sql = "INSERT INTO tb_producto(id_cat, nombre_pr, cantidad_pr, precio_pr) " +
                     "VALUES(" + idCategoria + ", '" + nombre + "', " + cantidad + ", " + precio + ")";
        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }
    
    public String actualizarProducto(int id, String nombre, int idCategoria, int cantidad, double precio) {
        String sql = "UPDATE tb_producto SET "
                   + "nombre_pr = '" + nombre + "', "
                   + "id_cat = " + idCategoria + ", "
                   + "cantidad_pr = " + cantidad + ", "
                   + "precio_pr = " + precio + " "
                   + "WHERE id_pr = " + id;
        Conexion con = new Conexion();
        return con.Ejecutar(sql);
    }
    public Object[] obtenerProductoCompletoPorId(int id) {
        String sql = "SELECT nombre_pr, id_cat, cantidad_pr, precio_pr FROM tb_producto WHERE id_pr = " + id;
        Conexion con = new Conexion();
        ResultSet rs = con.Consulta(sql);
        try {
            if (rs.next()) {
                return new Object[]{
                    rs.getString("nombre_pr"),
                    rs.getInt("id_cat"),
                    rs.getInt("cantidad_pr"),
                    rs.getDouble("precio_pr")
                };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public String mostrarCatalogoCarrito() {
        StringBuilder html = new StringBuilder();
        try {
            Conexion con = new Conexion();
            String sql = "SELECT id_pr, nombre_pr, precio_pr, foto_pr FROM tb_producto";
            ResultSet rs = con.Consulta(sql);
            while (rs.next()) {
                int id = rs.getInt("id_pr");
                String nombre = rs.getString("nombre_pr");
                double precio = rs.getDouble("precio_pr");
                String imagen = rs.getString("foto_pr");

                if (imagen == null || imagen.trim().isEmpty()) {
                    imagen = "default.jpg"; // una imagen genérica que tengas
                }

                System.out.println("Ruta de imagen: imagenes/" + imagen);

                html.append("<div class='producto'>")
                .append("<img src='imagenes/").append(imagen).append("' alt='Producto'>")
                .append("<h3>").append(nombre).append("</h3>")
                .append("<p>Precio: $").append(precio).append("</p>")
                .append("<form method='get' action='carrito.jsp'>")
                .append("<input type='hidden' name='add' value='").append(id).append("'>")
                .append("<label>Cantidad: </label>")
                .append("<input type='number' name='cant' value='1' min='1' class='input-cantidad'>") // CAMBIO AQUÍ
                .append("<input type='submit' value='Agregar al carrito' class='btn-agregar'>") // CAMBIO AQUÍ
                .append("</form>")
                .append("</div>");
            }
            rs.close();
        } catch (Exception e) {
            html.append("<p>Error al mostrar productos: ").append(e.getMessage()).append("</p>");
        }
        return html.toString();
    }
    public String mostrarContenidoCarrito(Map<Integer, Integer> carrito) {
        StringBuilder html = new StringBuilder();
        double total = 0.0;

        try {
            Conexion con = new Conexion();

            for (Map.Entry<Integer, Integer> entry : carrito.entrySet()) {
                int id = entry.getKey();
                int cantidad = entry.getValue();

                String sql = "SELECT nombre_pr, precio_pr FROM tb_producto WHERE id_pr = " + id;
                ResultSet rs = con.Consulta(sql);
                if (rs.next()) {
                    String nombre = rs.getString("nombre_pr");
                    double precio = rs.getDouble("precio_pr");
                    double subtotal = precio * cantidad;
                    total += subtotal;

                    html.append(nombre)
                        .append(" x ").append(cantidad)
                        .append(" - $").append(String.format("%.2f", subtotal))
                        .append("<br>");
                }
                rs.close();
            }

            html.append("<hr><strong>Total: $").append(String.format("%.2f", total)).append("</strong><br>");

        } catch (Exception e) {
            html.append("<p>Error al mostrar carrito: ").append(e.getMessage()).append("</p>");
        }

        return html.toString();
    }
    public void registrarVentas(Map<Integer, Integer> carrito, String nombreCliente) {
        Conexion con = new Conexion();

        try {
            for (Map.Entry<Integer, Integer> entry : carrito.entrySet()) {
                int idProducto = entry.getKey();
                int cantidad = entry.getValue();

                // CORREGIDO: incluye cantidad_pr
                String sqlProducto = "SELECT nombre_pr, precio_pr, cantidad_pr FROM tb_producto WHERE id_pr = " + idProducto;
                ResultSet rs = con.Consulta(sqlProducto);

                if (rs.next()) {
                    String nombreProducto = rs.getString("nombre_pr");
                    int stockActual = rs.getInt("cantidad_pr"); // ahora sí existe
                    double precioUnitario = rs.getDouble("precio_pr");
                    double precioTotal = precioUnitario * cantidad;

                    // Seguridad mínima: escapamos comillas simples
                    nombreCliente = nombreCliente.replace("'", "''");
                    nombreProducto = nombreProducto.replace("'", "''");

                    String insertVenta = "INSERT INTO tb_ventas (nombre_ve, fecha_ve, producto_ve, cantidad_ve, preciot_ve) VALUES ("
                            + "'" + nombreCliente + "', "
                            + "CURRENT_DATE, "
                            + "'" + nombreProducto + "', "
                            + cantidad + ", "
                            + precioTotal + ")";

                    con.Ejecutar(insertVenta);

                    int nuevoStock = stockActual - cantidad;
                    String sqlUpdateStock = "UPDATE tb_producto SET cantidad_pr = " + nuevoStock + " WHERE id_pr = " + idProducto;
                    con.Ejecutar(sqlUpdateStock);
                }

                rs.close();
            }

        } catch (Exception e) {
            e.printStackTrace(); // imprime el error completo
        }
    }




}

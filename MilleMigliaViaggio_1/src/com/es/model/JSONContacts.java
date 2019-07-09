package com.es.model;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class JSONServlet
 */
@WebServlet("/JSONContacts")
public class JSONContacts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    Connection con;
    public JSONContacts() {
    	con = null;
    	try 
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		String url = "jdbc:mysql://localhost:3306/prog_web";
   			String username = "root"; 
   			String pwd = "p4p3r0"; 
   			con = (Connection) DriverManager.getConnection(url,username,pwd);
   		}
   		catch(Exception e)
   		{
   			System.out.println("Connessione fallita");
   		}
   }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.getWriter().write(genereteJSon());
	}
	
	@SuppressWarnings("null")
	public String genereteJSon() {
		int i = 1;
		StringBuffer re = new StringBuffer();
		re.append("[");
		Statement query;
		try {
			query = (Statement) con.createStatement();
			ResultSet result = (ResultSet) query.executeQuery("select email from cliente;");
			
			result.last();
			int r = result.getRow();
			result.beforeFirst();
			
			while(result.next())
			{
				if(i == r) {re.append("{\"email\": \""+result.getString("email")+"\"}");}
				else {re.append("{\"email\": \""+result.getString("email")+"\"},");}
				i++;
			}
		}
		catch (SQLException e) {e.printStackTrace();}
		re.append("]");
		return re.toString();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.es.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.model.DBManager;

/**
 * Servlet implementation class Email
 */
@WebServlet("/Email-Contatti.html")
public class Email extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public Email() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessione = request.getSession();
		request.setAttribute("riq", "ok");
		String e = request.getParameter("email"); 
		String mex = request.getParameter("mex");
		String nome = request.getParameter("nome");
		
		DBManager db = new DBManager();
		try 
		{
			db.SendEmail(e, mex, nome);
		} 
		catch (SQLException e1) {}
		RequestDispatcher view = request.getRequestDispatcher("contatti.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

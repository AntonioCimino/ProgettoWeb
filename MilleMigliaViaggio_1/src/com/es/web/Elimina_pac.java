package com.es.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.es.model.DBManager;

@WebServlet("/Elimina_pac-Home.html")
public class Elimina_pac extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Elimina_pac() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = (String) request.getParameter("namePage");
		
		String cod = (String) request.getParameter("cod");
		DBManager db = new DBManager();
		db.Elimina_pac(cod);
	
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

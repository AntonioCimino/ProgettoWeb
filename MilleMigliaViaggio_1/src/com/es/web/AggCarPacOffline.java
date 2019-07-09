package com.es.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.model.DBManager;

@WebServlet("/AggCarPacOffline")
public class AggCarPacOffline extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AggCarPacOffline() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("ciao");
		String page = request.getParameter("namePage");
		System.out.print(page);
		Cookie c;
		int i=0,l=0;
		Cookie[] cookies = request.getCookies();
		if(cookies.length > 0){l = cookies.length;}
		HttpSession sessione = request.getSession();
		String e = (String) sessione.getAttribute("email");
		DBManager db = new DBManager();
		while(i < l){
			c = cookies[i];
			String val = c.getValue();
			if(val.length() == 6)
			{
				try {db.AggiungiC(val, e);} catch (SQLException e1) {}
			}
			i++;
		}
		sessione.setAttribute("primo", "no");

		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

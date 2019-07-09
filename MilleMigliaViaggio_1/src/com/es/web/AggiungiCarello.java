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

@WebServlet("/AggiungiCarello-Pacchetti.html")
public class AggiungiCarello extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public AggiungiCarello() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int l=0,i=0;
		boolean agg = true;
		HttpSession sessione = request.getSession();
		String e = (String) sessione.getAttribute("email");
		String cod = (String) request.getParameter("cod");
		if(e == null || e == "") {
			Cookie[] cookies = request.getCookies();
			if(cookies.length > 0){l = cookies.length;}
			while(i < l){
				Cookie c;
				c = cookies[i];
				String val = c.getValue();
				if(cod.equals(val)) {agg=false;}
				i++;
			}
			
			if(agg == true) {
				String a = "pac"+cod;
				Cookie pacchetto = new Cookie(a, cod);
				response.addCookie(pacchetto);
			}
		}
		else {
			DBManager db = new DBManager();
			try {db.AggiungiC(cod,e);} catch (SQLException e1) {}
		}
		RequestDispatcher view = request.getRequestDispatcher("pacchetti.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

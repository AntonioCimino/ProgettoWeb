package com.es.web;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.es.model.DBManager;

@WebServlet("/RisultatoRicerca.html")
public class Ricerca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public Ricerca() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data =(String)request.getParameter("data");
		String arr =(String)request.getParameter("arrivi");

		int m = 0,a = 0,l;
		if(data != "") 
		{
				l = data.length();
		
				if(l == 7) 
				{
					m = Integer.parseInt(data.substring(0,2));
					a = Integer.parseInt(data.substring(3,7));
				}
				else
				{
					m = Integer.parseInt(data.substring(0,1));
					a = Integer.parseInt(data.substring(2,6));
				}
		}
		
		DBManager db = new DBManager();
		List<String> info_p = db.Ricerca(arr, m, a);
		request.setAttribute("info_p", info_p);
		
		RequestDispatcher view = request.getRequestDispatcher("risultato_ricerca.jsp");
		view.forward(request, response);
		
	}


}

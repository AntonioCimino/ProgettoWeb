package com.es.web;

import java.io.*;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.es.model.DBManager;
import com.es.model.DatiAccesso;



@WebServlet("/Memorizza-Home.html")
public class Memorizza extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		int cell = Integer.parseInt(request.getParameter("cell"));
		String nazione = request.getParameter("nazione");
	
		DatiAccesso d = new DatiAccesso();
		d.setNome(nome);
		d.setCognome(cognome);
		d.setEmail(email);
		d.setPass(pass);
		d.setCell(cell);
		d.setNazione(nazione);
		
		String data = request.getParameter("data");
		
		int g,m,a,l;
		l = data.length();
		
		String anno = data.substring(0,4);
		if(anno.contains("/")) {a = Integer.parseInt(data.substring(0,3));data = data.substring(4,l);l = l - 4;}
		else{a = Integer.parseInt(anno);data = data.substring(5,l);l = l - 5;}
		
		String mese = data.substring(0,2);
		if(mese.contains("/")) {m = Integer.parseInt(data.substring(0,1));data = data.substring(2,l); l = l - 2;}
		else{m = Integer.parseInt(mese);data = data.substring(3,l); l = l - 3;}
		
		g = Integer.parseInt(data.substring(0,l));
		
		GregorianCalendar cc = new GregorianCalendar();
		cc.set(Calendar.DATE, g);
		cc.set(Calendar.MONTH, m - 1);
		cc.set(Calendar.YEAR, a);
		Date data_n = new Date(cc.getTimeInMillis());
		d.setData_nascita(data_n);
	
		DBManager db = new DBManager();
		try {db.registrazione(d);} catch (SQLException e) {e.printStackTrace();}
		
		
		RequestDispatcher view;
		view = request.getRequestDispatcher("home.jsp");
		view.forward(request, response);
		
	}
}
package com.es.web;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.es.model.DBManager;
import com.es.model.DatiAccesso;

@WebServlet("/PageAccess.html")
public class Accedo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String page = (String) request.getParameter("namePage");
    	
    	DatiAccesso d = new DatiAccesso();
    	boolean test = false;
    	String e = null;
    	String p = null;
    	
    	Cookie[] c = request.getCookies();   
		if (c!=null) { 
			for(int i=0;i<c.length;i++) {
				if (c[i].getName().equals("usr")) 
					e = c[i].getValue();
				if (c[i].getName().equals("pass")) 
					p = c[i].getValue();	
			}
		} 	
		if (e == null || p == null){
			if(e == null) {e = request.getParameter("email");}
			if(p == null) {p = request.getParameter("pass");}   		
		}
		
		if(e != null && p != null) {
			d.setEmail(e);
			d.setPass(p);
			DBManager db = new DBManager();
			test = db.accesso(d);
		}
		
		if(test == true) {
			Cookie usr = new Cookie("email", e);
		    response.addCookie(usr);
		    Cookie psw = new Cookie("password", p);
		    response.addCookie(psw);
			
			HttpSession sessione = request.getSession();
			sessione.setAttribute("email", e);  
			sessione.setAttribute("tipo", d.getTipo());
			if(d.getTipo().equals("u")) {sessione.setAttribute("primo", "si");}
			request.setAttribute("test", "true");
		}
		else 
		{
			request.setAttribute("test", "false");
		}
		RequestDispatcher view;
		if(d.getTipo()=="a") {view = request.getRequestDispatcher("home.jsp");}
		else {view = request.getRequestDispatcher(page);}
		view.forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

package com.es.model;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/JSONAcquisti")
public class JSONAcquisti extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public JSONAcquisti() {
	    super();
	    // TODO Auto-generated constructor stub
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int i = 1;
		response.setContentType("text/html");
		response.getWriter().append("[");
		DBManager db = new DBManager();
		HttpSession sessione = request.getSession();
		String e = (String) sessione.getAttribute("email"); 
		List<String> a = db.PacAcquisti(e);
		int n = a.size()/6;
		response.getWriter().append("{\"lunghezza\": \""+n+"\"},");
		Iterator it = a.iterator();
		while(it.hasNext())
		{
			if(i!=n) {
			response.getWriter().append("{\"img\": \""+it.next()+"\",");
			response.getWriter().append("\"descrizione_pacchetto\": \""+it.next()+"\",");
			response.getWriter().append("\"prezzo\": \""+it.next()+"\",");
			response.getWriter().append("\"destinazione\": \""+it.next()+"\",");
			response.getWriter().append("\"codice_pacchetto\": \""+it.next()+"\",");
			response.getWriter().append("\"numero\": \""+it.next()+"\"},");
			}
			else {
			response.getWriter().append("{\"img\": \""+it.next()+"\",");
			response.getWriter().append("\"descrizione_pacchetto\": \""+it.next()+"\",");
			response.getWriter().append("\"prezzo\": \""+it.next()+"\",");
			response.getWriter().append("\"destinazione\": \""+it.next()+"\",");
			response.getWriter().append("\"codice_pacchetto\": \""+it.next()+"\",");
			response.getWriter().append("\"numero\": \""+it.next()+"\"}");
			}
			i++;
		}
		response.getWriter().append("]");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

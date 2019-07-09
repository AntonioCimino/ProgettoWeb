package com.es.web;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Logout-Home.html")
public class Logout extends HttpServlet {
	    
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cookie usr = new Cookie("email", "");
	    usr.setMaxAge(0);
	    response.addCookie(usr);
	    Cookie psw = new Cookie("password", "");
	    psw.setMaxAge(0);
	    response.addCookie(psw);
	    request.getSession().invalidate();
	    HttpSession sessione = request.getSession();
		sessione.setAttribute("email", "");  
		sessione.setAttribute("pass", "");
	    response.sendRedirect("home.jsp");
	}
}
package com.es.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.es.model.DBManager;

/**
 * Servlet implementation class ReadEmail
 */
@WebServlet("/ReadEmail.html")
public class ReadEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReadEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			DBManager db = new DBManager();
			List<String> a = db.ReadEmail();
			request.setAttribute("email", a);
			RequestDispatcher view = request.getRequestDispatcher("leggi_mex.jsp");
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.es.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.es.model.DBManager;
import com.es.model.DatiAllogio;
import com.es.model.DatiPacchetti;
import com.es.model.DatiVolo;

@WebServlet("/Crea_pagina_pacchetto.html")
public class Crea_pagina_pacchetto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String va = request.getParameter("v");
		
		String id = request.getParameter("id");
		DatiPacchetti d = new DatiPacchetti();
		DatiVolo v = new DatiVolo();
		DatiAllogio a = new DatiAllogio();
		DBManager db = new DBManager();
		db.Pagina_pacc(id,d,v,a);
		
		request.setAttribute("cod",id);
		request.setAttribute("data_fine",d.getData_f());
		request.setAttribute("data_inizio",d.getData_i());
		request.setAttribute("descrizione_luogo",d.getDescrluogo());
		request.setAttribute("descrizione_pacchetto",d.getDescrPacc());
		request.setAttribute("destinazione",d.getDestinazione());
		request.setAttribute("immagine",d.getImmagine());
		request.setAttribute("numero_acquisti",d.getN_acquisti());
		request.setAttribute("nazione",d.getNazione());
		request.setAttribute("prezzo",d.getPrezzo());
		
		request.setAttribute("compagnia_v",v.getCompagnia());
		request.setAttribute("ora_partenza",v.getOra_a());
		request.setAttribute("ora_ritorno",v.getOra_r());
		request.setAttribute("prezzo_v",v.getPrezzo());
		
		request.setAttribute("indirizzo",a.getIndirizzo());
		request.setAttribute("prezzo_a",a.getPrezzo());
		request.setAttribute("servizi",a.getServizio());
		request.setAttribute("tipo_a",a.getTipo());
		
		request.setAttribute("v",va);
		
		RequestDispatcher view = request.getRequestDispatcher("pagina_pacchetto.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

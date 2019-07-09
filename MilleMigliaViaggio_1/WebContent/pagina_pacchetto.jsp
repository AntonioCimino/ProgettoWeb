<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
<script type = "text/javascript" src="js/jquery3.js"></script>
</head>
<body style="background:#e8e1e1;">
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>

<%
			String v = (String) request.getAttribute("v");
			out.print("<script>var v = '"+v+"';</script>");

			String cod = (String) request.getAttribute("cod");
			String immagine = (String) request.getAttribute("immagine");
			String descrizione_p = (String) request.getAttribute("descrizione_pacchetto");
			String prezzo = (String) request.getAttribute("prezzo");
			String data_i = (String) request.getAttribute("data_inizio");
			String data_f = (String) request.getAttribute("data_fine");
			String destinazione = (String) request.getAttribute("destinazione");
			String descrizione_l = (String) request.getAttribute("descrizione_luogo");
			String n_a = (String) request.getAttribute("numero_acquisti");
			String nazione = (String) request.getAttribute("nazione");
			
			String compagnia = (String) request.getAttribute("compagnia");
			String prezzo_v = (String) request.getAttribute("prezzo_v");
			String ora_p = (String) request.getAttribute("ora_partenza");
			String ora_r = (String) request.getAttribute("ora_ritorno");
						
			String prezzo_a = (String) request.getAttribute("prezzo_a");
			String indirizzo = (String) request.getAttribute("indirizzo");
			String servizi = (String) request.getAttribute("servizi");
			String tipo = (String) request.getAttribute("tipo");
%>

	<script type="text/javascript" src="js/jquery3.js"></script>
	<div style="margin-left:15%; width:50%; background:#e8e1e1;">
		<img style="width:100%; height:400px"; src="<%=immagine%>">
		<h3><%=descrizione_p%></h3>
		<hr style="border:1px solid black;">
		<h4>Descrizione pacchetto:</h4>
		<p>Il prezzo del pacchetto è di soli <b><%=prezzo%></b>.Il pacchetto comprende dal <b><%=data_i%> al <%=data_f%></b> nella splendida città di <b><%=destinazione %></b> situata in <%=nazione %>.</p>
		<h4>Su <%=destinazione %>:</h4>
		<p><%=descrizione_l %></p>
		<span style="font-size:20px;font-weight: bold;"><img src="IMG/icona_aereo.png" style="width:20px;height:20px;"/> Il volo</span>
		<div>Il trasporto è affidato alla compagnia <b><%=compagnia%> </b>,  l'orario di partenza è alle ore: <b><%=ora_p %> </b>, mentre al ritorno è alle ore: <b><%=ora_r %> </b>, il prezzo del volo A/R è di <b><%=prezzo_v%>euro</b> gia' compreso nel prezzo del pacchetto</div>
		<span style="font-size:20px;font-weight: bold;"><img src="IMG/icona_casa.jpg" style="width:20px;height:20px;"/> Dove alloggiare</span>
		<div>Il pacchetto comprende l'allogio in un/a <b><%=tipo %> </b>che si trova in<b> <%=indirizzo %></b>, il prezzo ammonta sui <b><%=prezzo_a %></b> euro. Esso comprende come servizo: <b><%=servizi %></b></div>
		<br>
		<p>Ad ora il pacchetto è stato prenotato da <%=n_a %> utenti</p>
		<form action="AggiungiCarello-Pacchetti.html">
		<input type="text" name="cod" value=<%=cod%> style="display:none;">
		<div id="b"></div>
		<script>
			if(v == "true"){
				document.getElementById("b").innerHTML = "<input style='width:50%;margin-left:20%;' type='submit' value='Aggiungi a carrello'>"
			}
		</script>
		</form>
		<hr style="border:0px solid black;">
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.util.*" %>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
</head>
<body class="grey lighten-2">
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
<div class="container" id="demo">
<%
			int i = 0,l = 0;
			Cookie c;
			Cookie[] cookies = request.getCookies();
			if(cookies.length > 0){l = cookies.length;}
			out.print("<script>var l = '"+l+"';</script>");
			out.print("<script>var cod = new Array();</script>");
			while(i < l){
				c = cookies[i];
				String valore = c.getValue();
				out.print("<script>cod.push('"+valore+"');</script>");
				i++;
			}
%> 
	<script type = "text/javascript" src="js/jquery3.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".Accedi-form>form>p").css({"margin-bottom":"-15px","margin-top": "-10px"});
			$(".Accedi-form>form>#er").css({"margin-bottom":"-20px","margin-top": "-10px"});
			if(e!="" && e!=null){
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {myFunction1(this);}
				};
				xmlhttp.open("GET", "JSONCarrello", true);
				xmlhttp.send();
			}
			else{
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {myFunction1_o(this);}
				};
				xmlhttp.open("GET", "PacchettiJSON", true);
				xmlhttp.send();
			}	
		});
			
		function myFunction1(xmlhttp) {
			var i,j;
			var data = JSON.parse(xmlhttp.responseText);
			l=data[0].lunghezza+1
			for(i=1;i<l;i++){
				if(data[i].img != null){
						document.getElementById("demo").innerHTML +="<form action='Acquista-Home.html' method='get' name='form_a'><div class='col s12 m7'><div class='card horizontal'><div class='card-image'><img src='"+data[i].img+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content' style='font-size:12px;'><span class='card-title'>"+data[i].destinazione+"</span><p>"+data[i].descrizione_pacchetto+".<br/>Prezzo: "+data[i].prezzo+"$</p><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'></input></div><div class='card-action'><input type='submit' value='Acquista' style='width:250px;height:25px;'> &nbspQuantità:&nbsp <input type='number' name='q' value='1' min='1' max='5' style='width:50px;height:25px;'></form><hr style='color:trasparent; border-width: 0px;'><form action='Crea_pagina_pacchetto.html' method='get' name='form_e'><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'><input type='submit' value='Vai a pagina pacchetto' style='height:25px;'></form><hr style='color:trasparent; border-width: 0px;'><form action='Elimina-Pacchetti.html' method='get' name='form_e'><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'><input type='submit' value='Elimina' style='height:25px;'></form></div></div></div>";
				}
			}
		}
			
		function myFunction1_o(xmlhttp) {
			var i,j,x;
			var data = JSON.parse(xmlhttp.responseText);
			for(j=0;j<l;j++){
				x=data[0].lunghezza;
				for(i=0;i<x;i++){
					if(data[i].codice_pacchetto == cod[j]){
						document.getElementById("demo").innerHTML +="<div class='col s12 m7'><div class='card horizontal' id='a'><div class='card-image'><img src='"+data[i].img+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content'><span class='card-title'>"+data[i].destinazione+"</span><p>"+data[i].descrizione_pacchetto+".<br/>Prezzo: "+data[i].prezzo+"$</p><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'></input></div><div class='card-action'><form action='Crea_pagina_pacchetto.html' method='get' name='form_e'><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'><input type='submit' value='Vai a pagina pacchetto'></form><hr style='color:trasparent; border-width: 0px;'><form action='Elimina-Pacchetti.html' method='get' name='form_e'><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'><input type='submit' value='Elimina'></form></div></div></div>";
					}
				}
			}
		};
	</script>
	</div>
</body>
</html>
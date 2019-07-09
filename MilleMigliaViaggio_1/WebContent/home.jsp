<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.*" %>
<head>
<title>MilleMigliaInViaggio</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
<link rel="stylesheet"	href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
	<script type="text/javascript" src="js/jquery3.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {myFunction1(this);}
			};
			xmlhttp.open("GET", "PacchettiJSON", true);
			xmlhttp.send();
		});
		function myFunction1(xmlhttp) {
			var max = 0
			var max_all = 10000
			var i,j,x,s;
			var data = JSON.parse(xmlhttp.responseText);
			s=data[0].lunghezza
			for(i=0;i<6;i++){
				max=0;
				for(j=1;j<s;j++){
					if(data[j].n_pacchetti_acquistati > max && data[j].n_pacchetti_acquistati < max_all){x=j;max=data[j].n_pacchetti_acquistati}
				}
				max_all = max;
				document.getElementById("card").innerHTML +="<form action='Crea_pagina_pacchetto.html' method='get'><div class='card' style='margin-top:10px; width:350px; margin-left:20px; margin-bottom:20px;'><img class='card-img-top' src='"+data[x].img+"'><div class='card-body'><h5 class='card-title'>"+data[x].destinazione+"</h5><p class='card-text'>"+data[x].descrizione_pacchetto+"</p><input type='text' name='id' value='"+data[x].codice_pacchetto+"' style='display: none;'></input><input type='submit' value='Vai a pagina pacchetto'><input type='text' name='v' value='true' style='display:none;'></input></div></div></form>";
			}
		}
	</script>
	<div id="demo" class="carousel slide" data-ride="carousel" >
		<ol class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
			<li data-target="#demo" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="IMG/ungheria.jpg" width="100%" height="20%">
				<div class="carousel-caption">
					<h3>Ungheria</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="IMG/turchia.jpg" width="100%" height="20%">
				<div class="carousel-caption">
					<h3>Turchia</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="IMG/giappone.jpg" width="100%" height="20%">
				<div class="carousel-caption">
					<h3>Giappone</h3>
				</div>
			</div>
			<div class="carousel-item">
				<img src="IMG/russia.jpg" width="100%" height="20%">
				<div class="carousel-caption">
					<h3>Russia</h3>
				</div>
			</div>
		</div>
	</div>
	<br>
	<h4 align="center" style="color:#0c6274"><font face="Tahoma"><b>PACCHETTI PIU' VENDUTI</b></font></h1>
	<br>
	<div id ="card" class="card-deck" style="width: 100%;padding-left:5%;"></div>
	<form action="AggCarPacOffline" method ="get" name="pac_c"></form>
	<nav style="height:20px;"></nav>
</body>
</html>
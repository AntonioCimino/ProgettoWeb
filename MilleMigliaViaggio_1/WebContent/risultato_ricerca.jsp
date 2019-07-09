<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
<style>
.fadedfx {
  background-color: #fe5652;
  visibility: hidden;
}

.fadeIn {
  animation-name: fadeIn;
  -webkit-animation-name: fadeIn;
  animation-duration: 1.5s;
  -webkit-animation-duration: 1.5s;
  animation-timing-function: ease-in-out;
  -webkit-animation-timing-function: ease-in-out;
  visibility: visible !important;
}

@keyframes fadeIn {
  0% {
    opacity: 0.0;
  }
  100% {
    opacity: 1;
  }
}

@-webkit-keyframes fadeIn {
  0% {
    opacity: 0.0;
  }
  100% {
    opacity: 1;
  }
}
</style>
</head>
<body style="background-color:	#b0c4de">
<script type = "text/javascript" src="js/jquery3.js"></script>
<script type="text/javascript">
			$(document).ready(function(){
				$(".Accedi-form>form>p").css({"margin-bottom":"-15px","margin-top": "-10px"});
				$(".Accedi-form>form>#er").css({"margin-bottom":"-20px","margin-top": "-10px"});
			});
</script>
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
	<h4>Pacchetti trovati:</h4>
	<div class="container" id="demo">
	<%
			int i = 0;
			List ris = (List) request.getAttribute("info_p");
			Iterator it = ris.iterator();
			out.print("<script>var cod = new Array();</script>");
			while(it.hasNext())
			{
				String a = (String) it.next();
				out.print("<script>cod.push('"+a+"');</script>");	
				a = (String) it.next();
				out.print("<script>cod.push('"+a+"');</script>");
				a = (String) it.next();
				out.print("<script>cod.push('"+a+"');</script>");
				a = (String) it.next();
				out.print("<script>cod.push('"+a+"');</script>");
				a = (String) it.next();
				out.print("<script>cod.push('"+a+"');</script>");
				i++;
			}
			out.print("<script>var i ="+ i +"</script>");
	%>
	<script>
		var j = 0;
		i = i * 5;
		while(j<i){
			document.getElementById("demo").innerHTML +="<form action='Crea_pagina_pacchetto.html' method='get'><div class='col s12 m7' ><div class='card horizontal' id='a'><div class='card-image'><img src='"+cod[j]+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content'><span class='card-title'>"+cod[j+1]+"</span><p>"+cod[j+2]+".<br/>"+cod[j+3]+"$</p><input type='text' name='id' value='"+cod[j+4]+"' style='display: none;'></input></div><div class='card-action'><input type='submit' value='Vai a pagina pacchetto'><input type='text' name='v' value='true' style='display:none;'></input></div></div></div></form>";
			j=j+5;
		}
	</script>
	</div>
</body>
</html>
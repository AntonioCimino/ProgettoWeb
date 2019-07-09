<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.Elimina-form {
	position: absolute;
	width: 380px;
	height: 140px;
	background: white;	
	right: 20%;
	top: 60px;
	border-radius: 3px;
	border-bottom: 5px solid gray;
	display: none;
	color:black;
}

.Elimina-form>form {
	font-size: 12px;
	color: gray;
	font-family: coming-sans, sans-serif, Arial;
}

#El {
	width: 100px;
	height: 50px;
	background: white;
	font-size: 15px;
	font-weight: bold;
	color: black;
	font-family: coming-sans, sans-serif, Arial;
	outline: none;
	border-radius: 3px;
}

#freccia {
	width: 0;
	height: 0;
	position: absolute;
	border-left: 15px solid transparent;
	border-right: 15px solid transparent;
	border-bottom: 15px solid #fff;
	left: 20%;
	top: 45px;
	display: none;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 	
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		out.print("<script>var page = '"+pageName+"';</script>");
%>
<%
		if(session.getAttribute("email") != null){
			String e = (String) session.getAttribute("email");
			out.print("<script>var e = '"+e+"';</script>");
			String t = (String) session.getAttribute("tipo");
			out.print("<script>var t = '"+t+"';</script>");
			String pr = (String) session.getAttribute("primo");
			out.print("<script>var pr = '"+pr+"';</script>");
		}
		else {
			out.print("<script>var e = null;</script>");
		}
		String test = (String)request.getAttribute("test");
		out.print("<script>var test = '"+test+"';</script>");
%>
	<script type="text/javascript" src="js/jquery3.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var state1 = 0;
			if(test == "false"){
				$(".arrow-up").show();
				$(".Accedi-form").show();
				state=1;
				$("#a").css({"z-index" : "-1"});
				$("#demo").css({"z-index" : "-1"});
				document.getElementById("er").innerHTML = "Password o/e E-mail errate!"
			}
			document.getElementById("nome").innerHTML += "<input name='namePage' type='text' value='"+page+"' style='display:none;'></input>";
			if(e != null && e != ""){
				if(t == "a"){
					document.getElementById("div4").innerHTML = "<form action='ReadEmail.html' method='get'><span><a href='home.jsp'>HOME&nbsp&nbsp&nbsp </a><a href='#' id='b2' onclick = 'load()'> ELIMINA PACCHETTO&nbsp&nbsp&nbsp </a><a href='aggiungi_pacchetto.jsp'>INSERISCI PACCHETTO </a><input type='submit' value='MESSAGGI' id='Mex'></input></form></span><div class='arrow-up' id='freccia'></div><div class='Elimina-form'><form action='Elimina_pac-Home.html' method='get' ><div><label>&nbsp&nbsp&nbspSelezionare codice del pacchetto da eliminare</label></div><div style='margin-left:5%;margin-top:-20px;'><select id='cod' name='cod' ></select></div><div><input type = 'submit' value='Elimina' id='El'></input><input name='namePage' type='text' value='"+page+"' style='display:none;'></div></div></form></div>";
					document.getElementById("div3").innerHTML = "<form action='Logout-Home.html' method='get'><span align='right'>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"+e +"<input type='submit' value='Logout' id='logout'></input></form></span>";				}
				else{
					document.getElementById("div3").innerHTML = "<form action='Logout-Home.html' method='get'><span>"+e +"<input type='submit' value='Logout' id='logout'></input><a href='carrello.jsp'>Carrello</a><a href='Acquisti.jsp'>&nbsp&nbsp&nbsp Acquisti</a></form></span>";
				}
				if(pr == "si"){
					var r = confirm('Vuoi aggiungere al carrello personale i pacchetti aggiunti offline?');      
				    if (r == true) {
						document.getElementById("div3").innerHTML = "<form  name='pac_c' action='AggCarPacOffline' method='get' ><input name='namePage' type='text' value='"+page+"' style='display:none;'></form>";
				    	document.pac_c.submit(); 
				    	alert("Pacchetti aggiunti al tuo carrello");
				    } 
				    else {}
				}
			    else {<% session.setAttribute("primo", "no"); %>}
			}
			
			
			$("#b2").click(function(){
				if(state1 == 1){
					$("#freccia").hide();
					$(".Elimina-form").hide();
					state1=0;
					$("#a").css({"z-index" : "0"});
					$("#demo").css({"z-index" : "0"});
				}
				else {
					$("#freccia").show();
					$(".Elimina-form").show();
					state1=1;
					$("#a").css({"z-index" : "-1"});
					$("#demo").css({"z-index" : "-1"});
				}
			})
		});
		
		function load(){
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) 
				{
					var data = JSON.parse(xmlhttp.responseText);
					var s = data[0].lunghezza
					for(i=1;i<=s;i++){
						document.getElementById("cod").innerHTML +="<option>"+data[i].codice_pacchetto+"</option>"
					}
				}
			}
			xmlhttp.open("GET", "PacchettiJSON", true);
			xmlhttp.send();
		}	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form action="Elimina_pac-Home.html" method="get">
	<select id="cod" name="cod"></select>
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
			var data = JSON.parse(xmlhttp.responseText);
			var s = data[0].lunghezza
			for(i=1;i<=s;i++){
				document.getElementById("cod").innerHTML +="<option>"+data[i].codice_pacchetto+"</option>"
			}
		}	
	</script>
	<input type="submit">
	</form>
</body>
</html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
</head>
<body class="grey lighten-2">
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
	<div class="container" id="demo"  style=" z-index: -1;"></div>
		<div class="container" id="b"></div>
		<script type = "text/javascript" src="js/jquery3.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {myFunction1(this);}
				};
				xmlhttp.open("GET", "JSONAcquisti", true);
				xmlhttp.send();
			});
			function myFunction1(xmlhttp) {
				var i,j;
				var data = JSON.parse(xmlhttp.responseText);
				for(i=1;i<5;i++){
					if(i%2==0){document.getElementById("demo").innerHTML +="<form action='Crea_pagina_pacchetto.html' method='get'><div class='col s12 m7' ><div class='card horizontal'><div class='card-image'><img src='"+data[i].img+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content'><span class='card-title'>"+data[i].destinazione+"</span><p>"+data[i].descrizione_pacchetto+".<br/>Numero pacchetti acquistati: "+data[i].numero+"</p><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'></input></div><div class='card-action'><input type='submit' value='Info' style='background-color:orange;color:white;border:solid'><input type='text' name='v' value='false' style='display:none;'></div></div></div></form></form>";}
					else{document.getElementById("demo").innerHTML +="<form action='Crea_pagina_pacchetto.html' method='get'><div class='col s12 m7' ><div class='card horizontal'><div class='card-image'><img src='"+data[i].img+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content'><span class='card-title'>"+data[i].destinazione+"</span><p>"+data[i].descrizione_pacchetto+".<br/> Numero pacchetti acquistati: "+data[i].numero+"</p><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'></input></div><div class='card-action'><input type='submit' value='Info' style='background-color:orange;color:white;border:solid'><input type='text' name='v' value='false' style='display:none;'></div></div></div></form></form>";}
				}
				i=data[0].lunghezza/4
				for(j=0;j<i;j++){
					document.getElementById("b").innerHTML += "<button type='buttom' id='"+(j+1)+"' onclick='load.call(this)' class='btn btn-primary'>"+(j+1)+"</button>"
				}
			}
			function load(){
				var n;
				var num = this.id;
				n = parseInt(num) + ((num-1)*3)
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {myFunction2(this,n);}};
				xmlhttp.open("GET", "JSONAcquisti", true);
				xmlhttp.send();
			};
			function myFunction2(xmlhttp,n) {
				document.getElementById("demo").innerHTML = "";
				var i;
				var data = JSON.parse(xmlhttp.responseText);
				for(i=n;i<n+4;i++){
					if(data[i].img != null){
						if(i%2==0){document.getElementById("demo").innerHTML +="<form action='Acquista' method='get' name='form_a'><form action='Elimina' method='get' name='form_e'><div class='col s12 m7' ><div class='card horizontal'><div class='card-image'><img src='"+data[i].img+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content'><span class='card-title'>"+data[i].destinazione+"</span><p>"+data[i].descrizione_pacchetto+".<br/>"+data[i].prezzo+"$</p><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'></input></div><div class='card-action'><input type='submit' value='Acquista' onclick='document.form_e.submit()'></input><input type='submit' value='Elimina' onclick='document.form_e.submit()'></input></div></div></div></form></form>";}
						else{document.getElementById("demo").innerHTML +="<form action='Acquista' method='get' name='form_a'><form action='Elimina' method='get' name='form_e'><div class='col s12 m7' ><div class='card horizontal'><div class='card-image'><img src='"+data[i].img+"' class='fadeIn'></div><div class='card-stacked'><div class='card-content'><span class='card-title'>"+data[i].destinazione+"</span><p>"+data[i].descrizione_pacchetto+".<br/>"+data[i].prezzo+"$</p><input type='text' name='id' value='"+data[i].codice_pacchetto+"' style='display: none;'></input></div><div class='card-action'><input type='submit' value='Acquista' onclick='document.form_e.submit()'></input><input type='submit' value='Elimina' onclick='document.form_e.submit()'></input></div></div></div></form></form>";}
					}
			}

		}
		</script>
</body>
</html>
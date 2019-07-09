<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
legend {
    padding: 3px 6px;
}

.output {
    font: 1rem 'Fira Sans', sans-serif;
}

label {
    margin-top: 1rem;
    display: block;
    font-size: .8rem;
}
</style>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body style="background:#00bfff;">
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
<form enctype="multipart/form-data" action="AggiungiPacchetto-Home.html" method="post">
<div class='col s12 m7' style="background:#00bfff;">
<div class='card horizontal' id='a'style="background:#00bfff;box-shadow: inset 0 0 0px;">
<div style="width:50%;line-height: 32px;margin-left:25%;">
<fieldset style="border-style:solid;border-color:black;border-width: 5px;">
    <legend>Info pacchetto</legend>

    <div id ="div">
        <label for="codice">Codice pacchetto:</label>
        <input type="text" id="codice" name="codice" onKeyUp="myFunction5.call(this)" required/>
        <span id ="codice_span"></span>
    </div>
    <div>
        <label for="descr_p">Descrizione pacchetto:</label>
        <textarea id="descr_p" name="descr_p" required></textarea>
    </div>
    <div>
        <label for="prezzo">Prezzo:</label>
        <input type="text" id="prezzo" name="prezzo" onKeyUp="myFunction4.call(this)" required/>
    	<span id ="prezzo_span"></span>
    </div>
    <div>
        <label for="data_p">Data partenza:</label>
        <input type="date" id="data_p" name="data_p" value="AAAA/MM/GG" required>
    </div>
    <div>
        <label for="data_r">Data ritorno:</label>
        <input type="date" id="data_r" name="data_r"  value="AAAA/MM/GG" required>
    </div>
    <div>
        <label for="descr_l">Descrizione luogo:</label>
        <textarea id="descr_l" name="descr_l" required></textarea>
    </div>
    <div>
        <label for="dest">Destinazione:</label>
        <input type="text" id="dest" name="dest" onKeyUp="myFunction3.call(this)" required/>
    	<span id ="dest_span"></span>
    </div>
    <div>
        <label for="naz">Nazione:</label>
        <select id="naz" name="naz" required></select>
    </div>
    <div>
        <label for="file">Immagine:</label>
        <input type="file" id="file" name="file" required>
    </div>
</fieldset>
</div>
<div style="width:50%;margin-left:25%;">
<fieldset style="border-style:solid;border-color:black;border-width: 5px;">
    <legend>Info struttura</legend>

    <div>
        <label for="codice_s">Codice struttura:</label>
        <input type="text" id="codice_s" name="codice_s" onKeyUp="myFunction5.call(this)" required/>
         <span id ="codice_s_span"></span>
    </div>
    <div>
        <label for="indirizzo">Indirizzo:</label>
        <input type="text" id="indirizzo" name="indirizzo" onKeyUp="myFunction5.call(this)" required>
    	<span id ="indirizzo_span"></span>
    </div>
    <div>
        <label for="tipo">Tipo:</label>
        <input type="text" id="tipo" name="tipo" onKeyUp="myFunction3.call(this)" required/>
    	<span id ="tipo_span"></span>
    </div>
    <div>
        <label for="prezzo_s">Prezzo:</label>
        <input type="text" id="prezzo_s" name="prezzo_s" onKeyUp="myFunction4.call(this)" required/>
    	<span id ="prezzo_s_span"></span>
    </div>
    <div>
        <label for="servizio">Servizio:</label>
        <textarea id="servizio" name="servizio" required></textarea>
    	<span id ="servizio_span"></span>
    </div>
</fieldset>
<fieldset style="border-style:solid;border-color:black;border-width: 5px;">
    <legend>Info Volo</legend>

    <div>
        <label for="codice_v">Codice volo:</label>
        <input type="text" id="codice_v" name="codice_v" onKeyUp="myFunction5.call(this)" required/>
        <span id ="codice_v_span"></span>
    </div>
    <div>
        <label for="compagnia">Compagnia:</label>
        <input type="text" id="compagnia" name="compagnia" onKeyUp="myFunction3.call(this)" required>
        <span id ="compagnia_span"></span>
    </div>
    <div>
        <label for="prezzo_v">Prezzo:</label>
        <input type="text" id="prezzo_v" name="prezzo_v" onKeyUp="myFunction4.call(this)" required/>
        <span id ="prezzo_v_span"></span>
    </div>
    <div>
        <label for="ora_p">Ora partenza:</label>
        <input type="time" id="ora_p" name="ora_p" value="99:99" required/>
    </div>
    <div>
        <label for="ora_r">Ora ritorno:</label>
        <input type="time" id="ora_r" name="ora_r" value ="99:99" required/>
    </div>
</fieldset>
</div>
</div>
<hr style="border:0px solid #00bfff;">
<input type ="submit" value="Inserisci pacchetto" style="background-color:black;width:200px;border-radius: 0px;font-size: 16px;margin-left:40%;">
<br>
<p></p>
</form>
<script type="text/javascript" src="js/jquery3.js"></script>
	<script type="text/javascript">
		$(document).ready(function() 
		{	
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {if (this.readyState == 4 && this.status == 200) {myFunction2(this);}};
			xmlhttp.open("GET", "XML/paesi.xml");
			xmlhttp.send();
		});
		function myFunction2(xml) {
			document.getElementById("naz").innerHTML = "<option></option>";
			var xmlDoc = xml.responseXML;
			var x = xmlDoc.getElementsByTagName("continente");
			for(i=0;i<x.length;i++){
				var p = x[i].getElementsByTagName("paese");
				for(j=1;j<p.length;j++){
					document.getElementById("naz").innerHTML += "<option>"+p[j].childNodes[0].nodeValue+"</option>";
				}	
		}
	}
	function myFunction5() {
			var codice = this.id;
			var test = /^[0-9a-zA-Z]+$/;
			if (document.getElementById(codice).value.match(test)){document.getElementById(codice + "_span").innerHTML = "";}
			else {document.getElementById(codice + "_span").innerHTML = "Formato non corretto";}
	}
	function myFunction4() {
		var prezzo = this.id;
		var test = /^[0-9]+$/;
		if (document.getElementById(prezzo).value.match(test)){document.getElementById(prezzo + "_span").innerHTML = "";}
		else {document.getElementById(prezzo + "_span").innerHTML = "Formato non corretto";}
	}
	function myFunction3() {
		var prezzo = this.id;
		var test = /^[a-zA-Z]+$/;
		if (document.getElementById(prezzo).value.match(test)){document.getElementById(prezzo + "_span").innerHTML = "";}
		else {document.getElementById(prezzo + "_span").innerHTML = "Formato non corretto";}
	}
	</script>
</body>
</html>
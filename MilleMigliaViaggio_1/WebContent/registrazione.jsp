<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MilleMigliaViaggio</title>
<link rel="icon" href="img/logo.png" type="image/x-icon" />
<style type="text/css">
body, html {
    height: 100%;
    margin: 0;
}

#bg {
    /* The image used */
    background-image: url("IMG/man.jpg");

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

.center-block {
	border: 3px solid #fffff0;
	background: rgba(100,100,100,0.4);
	border-radius: 8px;
	width: 450px;
}

@media screen and (max-width:1300px) {
  /* For mobile phones: */
   .center-block {
    margin-left:30%;
    margin-top:5%;
  }
}

@media screen and (max-width:1000px) {
  /* For mobile phones: */
   .center-block {
    margin-left:20%;
    margin-top:5%;
  }
}
@media screen and (max-width:700px) {
   .center-block {
    margin-left:10%;
    margin-top:5%;
  }
}
@media screen and (max-width:500px) {
   .center-block {
    margin-left:0%;
    margin-top:5%;
  }
}

@media screen and (max-height:500px) {
   .center-block {
	margin-top:0%;
  }
}

@media screen and (max-height:450px) {
   .center-block {
	width: 350px;
  }
}

@media screen and (max-height:400px) {
   .center-block {
	font-size:8px;
  }
}

.butt {
	color:orange;
	background-color: black;
	border: 2px solid #FCA800;
	font-weight: bold;
	padding: 0;
	height: 25px;
	width: 80px;
}
p{
text-align:center;
font-weight: bold;
margin-top:0px;
margin-bottom:0px;
color:white;
}
</style>
<script>
			function myFunction() {
			var test = /^.?[\s]+.?$/;
			if (document.getElementById("pass").value.match(test)){document.getElementById("par").innerHTML = "La password non può contenere spazi";}
			else {document.getElementById("par").innerHTML = "";}
			var pass = document.getElementById("pass").value;
			var pass2 = document.getElementById("pass2").value;
			var em = document.getElementById("par2").innerHTML;
			var f3 = document.getElementById("par3").innerHTML;
			var f4 = document.getElementById("par4").innerHTML;
			var f5 = document.getElementById("par5").innerHTML;
			var f6 = document.getElementById("par6").innerHTML;
			var e = document.getElementById("e").value;
			if(document.getElementById("par").innerHTML == ""){
			if(pass != pass2){document.getElementById("par").innerHTML = "password diverse";}
			if(pass == pass2 && pass!= ""){document.getElementById("par").innerHTML = "";if(em == "" && e!="" && f3 =="" && f4 =="" && f5 =="" && f6==""){document.getElementById("reg").disabled = false;}}
			}
		}
		</script>
</head>
<body id="bg">

		<div class="center-block">
		<form action = "Memorizza-Home.html" method = "get">
		<script>
		function loadJSONDoc() {
			var xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {myFunction1(this);}};
			xmlhttp.open("GET", "JSONContacts", true);
			xmlhttp.send();
		}
		function myFunction1(xmlhttp) {
			var i;
			var data = JSON.parse(xmlhttp.responseText);
			var e = document.getElementById("e").value;
			document.getElementById("par2").innerHTML = "";
			var test = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
			document.getElementById("par2").innerHTML = "";
			if(document.getElementById("e").value != ""){
			if (document.getElementById("e").value.match(test))
			{
				for (i = 0; i <data.length; i++) 
				{
					if(e == data[i].email){document.getElementById("par2").innerHTML = "E-mail gia presente";}
				}
	
			}
			else
			{
				document.getElementById("par2").innerHTML = "E-mail non corisponde al formato adatto";
			}
			}
		}
		function myFunction2() {
			var i;
			var test = /^[0-9]+\S?$/;
			document.getElementById("par3").innerHTML = "";
			if(document.getElementById("cel").value != ""){
			if (document.getElementById("cel").value.match(test)){document.getElementById("par3").innerHTML = "";}
			else {document.getElementById("par3").innerHTML = "Numero di telefono non adatto al formato";}
			}
		}
		function myFunction3() {
			var i;
			var test = /^[a-zA-Z]+$/;
			document.getElementById("par5").innerHTML = "";
			if(document.getElementById("n").value != ""){
			if (document.getElementById("n").value.match(test)){document.getElementById("par5").innerHTML = "";}
			else {document.getElementById("par5").innerHTML = "Nome deve contenere solo caratteri";}
			}
		}
		function myFunction4() {
			var i;
			var test = /^[a-zA-Z]+$/;
			document.getElementById("par6").innerHTML = "";
			if(document.getElementById("c").value != ""){
			if (document.getElementById("c").value.match(test)){document.getElementById("par6").innerHTML = "";}
			else {document.getElementById("par6").innerHTML = "Cognome deve contenere solo caratteri";}
			}
		}
		function myFunction5() {
			var i;
			var test = /^[a-zA-Z]+$/;
			document.getElementById("par4").innerHTML = "";
			if(document.getElementById("naz").value != ""){
			if (document.getElementById("naz").value.match(test)){document.getElementById("par4").innerHTML = "";}
			else {document.getElementById("par4").innerHTML = "Nome deve contenere solo caratteri";}
			}
		}
		</script>
				<p>NOME</p><input  type = "text" style="margin-left:150px;" name = "nome" id="n" onKeyUp="myFunction3()" onKeyDown="myFunction()"><p id="par5"></p>
				<p>COGNOME</p><input type = "text" style="margin-left:150px;" name = "cognome" id="c" onKeyUp="myFunction4()" onKeyDown="myFunction()" required><p id="par6"></p>
				<p>E-MAIL*</p><input type = "text" style="margin-left:150px;" name = "email" id ="e" onKeyUp="loadJSONDoc()" onKeyDown="myFunction()"><p id="par2"></p>
				<p>NAZIONALITA'</p><input type = "text"  style="margin-left:150px;" name = "nazione" id="naz" onKeyUp="myFunction5()" onKeyDown="myFunction()"><p id="par4"></p>
				<p>DATA NASCITA</p><input type = "date" style="margin-left:160px;"  name = "data">
				<p>NUMERO DI TELEFONO</p><input type = "text" style="margin-left:150px;"  name = "cell" id="cel" onKeyUp="myFunction2()" onKeyDown="myFunction()"><p id="par3"></p>
				<p>PASSWORD*</p><input type = "password" style="margin-left:150px;" name = "pass" id="pass" onKeyUp="myFunction()" onKeyUp="myFunction()" required><p id="par"></p>
				<p>CONFERMA PASSWORD*</p><input type = "password" style="margin-left:150px;" name = "pass2" id ="pass2" onKeyUp="myFunction()" required>
				<br/>
				<br/>
				<input type="submit" value="REGISTRA" id="reg"  class="butt"  style="display: block; margin: 0 auto; width: 100px;" disabled></input>
				<br/>
		</form>
		<form action="home.jsp">
			<input type="submit" value="HOME"  class="butt"  style="display: block; margin: 0 auto; width: 100px;"></input>
			<br/>
		</form>
		</div>
</body>
</html>
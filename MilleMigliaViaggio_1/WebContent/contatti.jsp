<!DOCTYPE html>
<html lang="en">
<head>
<title>Contatti</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/StileContatti.css" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
<style type="text/css">
body{
background-image:url(IMG/img_2contatti.jpg);
}
</style>
</head>
<body>
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
	<script type="text/javascript" src="js/jquery3.js"></script>
	<script type="text/javascript">
	function myFunction1(xmlhttp) {
		var i;
		var e = document.getElementById("e").value;
		var test = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)+$/;
		document.getElementById("par2").innerHTML = "";
		if(document.getElementById("e").value != ""){
			if (document.getElementById("e").value.match(test)){
				document.getElementById("reg").disabled = false;
			}
			else{
				document.getElementById("reg").disabled = true;
				document.getElementById("par2").innerHTML = "E-mail non corisponde al formato adatto";
			}
		}
	}
	
	</script>
<section id="modulo">
<div class="contain">
<h1>Hai bisogno di aiuto?</h1>
<p>Richiedi informazioni compilando il modulo! Ti contatteremo il prima possibile!</p>
<hr>
<form action="Email-Contatti.html" method="post">
<div class="row">
	<div class="col-md-6">
		 <div class="form-group">
      		<label>Email</label>
      		<input type="text" class="form-control" name="email" id="e" onKeyUp="myFunction1()" required>
      		<p id="par2"></p>
      	</div>	
    	<div class="form-group">
      		<label>Nome</label>
      		<input type="text" class="form-control" name="nome" required>
      	</div>
       	<div class="form-group">
      		<label>Messaggi</label>
      		<textarea class="form-control" rows="7" name="mex"></textarea>
      	</div>
       <div class="form-group">
      		<input type="submit" id="reg" value="Richiedi informazioni"  id="pulsante">
      	</div>     
  	</div>
	<div class="col-md-6">
		<div class="alert alert-success" role="alert" id="alert" style="display:none;">
  			<strong>Operazione completata!</strong> L'email è stata inviata con successo, ricerverà una risposta il prima posibile.
		</div> 
		<% 
			if(request.getAttribute("riq") != null){out.print("<script>var a = 'ok';</script>");}
			else{out.print("<script>var a = 'no';</script>");}
		%>
		<script>
			if(a=="ok"){$("#alert").show();}
			window.setTimeout("scompari()", 3000);
			function scompari(){
				$("#alert").fadeOut();
			}
		</script>    
  	</div>
</div>
</form>
</div>
</section>
</body>
</html>








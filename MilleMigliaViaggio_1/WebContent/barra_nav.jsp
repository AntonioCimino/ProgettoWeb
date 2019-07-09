<!DOCTYPE html>
<head>
<title>MilleMigliaInViaggio</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/PaginaInizialeStyle.css" type="text/css">
</head>
<body>
	<nav>
		<section class="nav-container">
			<aside class="logo">
				<img src="IMG/logo2.png" id ="img" style="height: 60px; width: 70px; margin-left:10%">
			</aside>
			<aside class="menu">
				<div class="menu-content1" id="div4">
				<a href="home.jsp">  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp HOME &nbsp&nbsp&nbsp </a>
				<a href="ricerca.jsp"> RICERCA &nbsp&nbsp&nbsp </a>
				<a href="contatti.jsp"> CONTATTACI&nbsp&nbsp&nbsp </a>
				<a href="pacchetti.jsp">PACCHETTI </a>
				</div>
				<div class="menu-content2" id="div3">
				<a href="#" id="b1">Accedi</a> | <a href="registrazione.jsp">Registrati</a>	| <a href="carrello.jsp">Carrello</a>		
				</div>
				<div class="arrow-up"></div>
			</aside>
			<div class="Accedi-form">
				<form action="PageAccess.html" method="post">
					<p id = "er" style="color:red;"></p>
					<p>E-mail</p>
					<div>
						<input type="text" name="email">
					</div>
					<p>Password</p>
					<div>
						<input type="password" name="pass">
					</div>
					<div id="nome">
						<input type="submit" value="Accedi" id="bA" />
					</div>
				</form>
			</div>
		</section>
	</nav>
	<script type="text/javascript" src="js/jquery3.js"></script>
	<script>
		$(document).ready(function(){
			var state = 0;
			$("#b1").click(function(){
				if(state == 1){
					$(".arrow-up").hide();
					$(".Accedi-form").hide();
					state=0;
					$("#a").css({"z-index" : "0"});
					$("#demo").css({"z-index" : "0"});
				}
				else {
					$(".arrow-up").show();
					$(".Accedi-form").show();
					state=1;
					$("#a").css({"z-index" : "-1"});
					$("#demo").css({"z-index" : "-1"});
				}
			})
		});
	</script>
</body>
</html>
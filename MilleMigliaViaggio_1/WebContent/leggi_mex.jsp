<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="barra_nav.jsp" %>
<%@ include file="modifica_bar.jsp" %>
	<%
			List ris = (List) request.getAttribute("email");
			Iterator it = ris.iterator();
			out.println("<body style='background-color:orange;'>");
			out.println("<hr style='margin-top:-2px;' size='2' width='100%' color='white'/>");
			while(it.hasNext())
			{
				out.println("<div style='background-color:orange;'><h2>"+it.next()+"</h2>");
				out.println("<h5>Inviato da: "+it.next()+"<br>In data: "+it.next()+"<br>Puoi rispondere all'email: "+it.next()+"</h5></div>");
				out.println("<hr align='left' size='1' width='100%' color='white'/>");
			}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%@page import="java.sql.*" %>
       <%@page import="mybeans.DBConnector" %>
           <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/addmoney.css">

<script type="text/javascript" src="js/bootstrap.min.js"></script>


</head>
<body>

<%
if(session.getAttribute("userid")!=null)
{
%>

	<%


try
{
	String uid = String.valueOf(session.getAttribute("userid"));
	int wid = Integer.parseInt(String.valueOf(session.getAttribute("wallet_id")));
	
	
	     double amt=Double.parseDouble(request.getParameter("amount"));
	     int ano=Integer.parseInt(request.getParameter("bank"));


%>
<h1>E_wallt</h1>
<hr>
<div class="container">
<form name="frm" method="post" action="Verifypassword">
	<table>
	 	<tr>
	 		<td>Enter Password
	 		<td><input type="password" name="pass" required>
	 	</tr>
	 	<tr>
	 		<input type="hidden" name="amount" value="<%=amt %>">
	 		<input type="hidden" name="accno" value="<%=ano %>">
	 		<input type="hidden" name="wid" value="<%=wid %>">
	 		<td><button type="submit" >Submit</button>
	 	</tr>
	
	
	</table>


</form>
<a href="addmoneybank.jsp">Back</a>
</div>
<%
}
catch(Exception e)
{
	e.printStackTrace();	
}%>
	





<%
}
else{
	%>
	<h3 style="color:red">Invalid Session</h3>
	<a href="index.jsp">Login Now</a>
	<%
}
%>


</body>
</html>
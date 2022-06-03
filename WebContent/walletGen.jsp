<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/addmoneybank.css">
</head>
<body>
<%
	String uid=String.valueOf(session.getAttribute("user_id"));
	String mob=String.valueOf(session.getAttribute("mob_no"));
%>
<h2 style="color:purple">Welcome to Wallet Panel:Java EE</h2>
<br>
Logged in as:<%=session.getId() %>
<br>
<hr>
<form name="frm" method="post" action="RegisterWallet" enctype="multipart/form-data">

<div class="container">
<table>
<tr>
<td>Enter KYC Document Number
<td><input type="number" name="num">
</tr>
<tr>
<td>Upload KYC Document</td>
<td><input type="file" name="file" multiple="true" required="required">
</tr>
<tr>
<td>User id 
<td><input type = "hidden" name = "sessionid" value ="<%=uid %>">
</tr>
<tr>
<td>
<td><button type="submit" >Submit</button>
</tr>
</table>
<a href="Customer1.jsp">Back</a>
</div>
</form>
</body>
</html>
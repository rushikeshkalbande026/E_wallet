<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:DarkSalmon;">
<h2>Logout is Successfully </h2>
<hr>
<body>
<%
session.invalidate();
%>
<br>
<br>
<a href="index.jsp">Home</a>

</body>
</html>
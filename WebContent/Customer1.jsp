<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/addmoneybank.css">
<style type="text/css">
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 40%;
}

</style>
</head>

<body>
	
	<%
	if(session.getAttribute("userid")==null)
	response.sendRedirect("invalidate.jsp");
	%>
<h2>Welcome to customer</h2>

<hr>
<br>
<div>
<button onclick="location.href='walletGen.jsp'"; id="myButton" class="buvtton" >Generate Wallet</button>

</div>


</body>
</html>
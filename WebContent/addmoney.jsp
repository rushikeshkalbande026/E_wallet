<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="css/addmoneybank.css">

</head>
<body>
<%
if(session.getAttribute("userid")!=null)
{
%>
<div class="container">
	<form name="frm" method="post" action="addmoneybank.jsp"> 
	
		
			<h1>E_wallet</h1>

			<br> <br>
			<h4>Add Money</h4>
			<table>
				<tr>

			<td><label for=""><b>Amount</label></td>
			<td><input type="text" placeholder="Enter Amount" name="amt"
						id="amt" required>
				</tr>
				
				<tr>
			<td>
		   <div class="container">
		  <td> <button type="submit" class="cancelbtn">Proceed</button>
			</div>
			  </td>
		  </tr>
	
					</form>
					
	

</div>


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
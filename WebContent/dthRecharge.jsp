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
	if(session.getAttribute("userid")==null)
	response.sendRedirect("invalidate.jsp");
		
	String uid = String.valueOf(session.getAttribute("user_id"));
	String wid = String.valueOf(session.getAttribute("wallet_id"));
	%>
	<div class="container">
	<h3>Mobile Recharge</h3>
<form name="frm" method="post" action="DthRecharge">
<table>
<tr>
<td>Enter Suscriber ID or Mobile number
<td><input type="text" name="idmno">
</tr>
<tr>
<td>Select opeartor 
<td><select name="opeartor" id="opr">
      <option value="dishtv">Dish TV</option> 
      <option value="sun">Sun Direct</option>      
      <option value="airtel">Airtel Digital TV</option>       
      <option value="tata">Tata Sky</option>
      <option value="d2h">D2H</option>
</select>
</tr>
<tr>
<tr>
<td>Enter Amount
<td><input type="number" name="amt">
</tr>
<tr>
<td>
<td><button type="submit" >Submit</button>
</tr> 
</table>
</form>
</div>

</body>
</html>
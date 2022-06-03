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
	<h3>Electric Bill</h3>
<form name="frm" method="post" action="ElectricBill">
<table>
<tr>
<td>Enter Consumer Number
<td><input type="text" name="cno">
</tr>
<tr>
<tr>
<td>Enter State 
<td><input type="text" name="state">
</tr>
<td>Select Biller
<td><select name="opeartor" id="opr">
      <option value="adani">Adani Electricity Mumbai Limited</option> 
      <option value="msedc">MSEDC Mahavitran</option>      
      <option value="best">Best Mumbai</option>       
      <option value="tata">Tata Power Mumbai</option>
      <option value="torrent">Torrent Power</option>
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
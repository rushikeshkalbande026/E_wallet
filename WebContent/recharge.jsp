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
<form name="frm" method="post" action="Recharge">
<table>
<tr>
<td>Enter mobile number
<td><input type="number" name="mno">
</tr>
<tr>
<td>Select opeartor 
<td><select name="opeartor" id="opr">
      <option value="jio">Jio</option> 
      <option value="vi">VI</option>      
      <option value="airtel">Airtel</option>       
      <option value="bsnl">BSNL</option>
</select>
</tr>
<tr>
<tr>
<td>Enter Amount
<td><input type="number" name="amt">
</tr>
<tr>
<td>Select Region
<td><select name="region" id="reg">
      <option value="mhgoa">Maharastra and Goa</option> 
      <option value="del">Delhi</option>      
      <option value="mum">Mumbia</option>       
      <option value="pjb">Punjab</option>
</select>
</tr>
	<tr>
			<td>
		   <div >
		  <td> <button type="submit" >Proceed</button>
			</div>
			  </td>
		  </tr> 
</table>
</form>
</div>

</body>
</html>
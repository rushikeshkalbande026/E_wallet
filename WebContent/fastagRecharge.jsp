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
	<h3>FASTag Recharge</h3>
<form name="frm" method="post" action="FASTagRecharge">
<table>
<tr>
<td>Enter vehicle number
<td><input type="number" name="vno">
</tr>
<tr>
<td>Enter Total Amount
<td><input type="number" name="amt">
</tr>
<tr>
<td>Select FASTag Issuer Bank
<td><select name="bank" id="bank">
      <option value="axis">Axis Bank</option> 
      <option value="baroda">Bank of Baroda</option>
      <option value="equitas">Equitas Small Finance Bank</option>
      <option value="federal">Federal Bank</option>
      <option value="hdfc">HDFC Bank</option>
      <option value="icici">ICICI Bank</option>
      <option value="idfc">IDFC First Bank</option>
      <option value="highway">Indian Highway Management Company</option>
      <option value="indusind">IndusInd Bank</option>
      <option value="kotak">Kotak Mahindra Bank</option>
      <option value="paul">Paul Merchant</option>
      <option value="analyst">Transaction Analyst</option>      
</select>
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
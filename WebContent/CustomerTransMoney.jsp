<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script language="Javascript" src="js/transfermoney.js" type="text/javascript">  </script>

<link rel="stylesheet" href="css/addmoneybank.css">
</head>
<body>
<%
if(session.getAttribute("userid")==null)
response.sendRedirect("invalidate.jsp");
%>
	<div class="container">
	
<h2>E_wallet</h2>
<hr>
	<%
		
	String uid = String.valueOf(session.getAttribute("userid"));
	String wid = String.valueOf(session.getAttribute("wallet_id"));
	%>
<form name="frm" method="post" action="Verifytransfer.jsp">
	 	<table>
	 		<tr>
	 			<td><label for=""><b>Enter Wallet Id</label></td>
			    <td><input type="text" placeholder="Enter Walletid" name="towid"
						id="towid" required>
					<td>	<div id="name">
					
					
					</div>
					<td>
	 		</tr>
	 		<tr>
	 			<td><button type="button" onclick="makeGetRequest()">Check</button> 
	 		</tr>
	 		 <tr>
	 			<td><label for=""><b>Enter Amount</label></td>
			     <td><input type="text" placeholder="Enter Amount" name="amt"
						id="amt" required>
	 		</tr>
	 		 <tr>
	 			<td><label for=""><b>Remark</label></td>
			     <td><input type="text" placeholder="Enter Remark" name="rmk"
						id="rmk" >
	 		</tr>
	 		
	 		
	 		<tr>
	 				<td>
	 				<td>
	 		</tr>
	 		
	 	    <tr>
	 	    <td>
	 	    		<td><button type="submit">Submit</button>
	 	    		
	 	    	</tr>
	 
	 	
	 	</table>
	               
				
			
	
	</form>
<a href="Customer.jsp">Back</a>
</div>
</body>
</html>
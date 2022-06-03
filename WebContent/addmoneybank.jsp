<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/addmoneybank.css">

<script language="Javascript" src="js/addmoney.js" type="text/javascript">  </script>

</head>
<body>

<%
if(session.getAttribute("userid")!=null)
{
%>

	<%

double amt=Double.parseDouble(request.getParameter("amt"));

%>
<h1>E_wallet</h1>
<hr>
<h2>Add Money to Wallet <%=amt %> Rs</h2>

<form name="frm" method="post" action="verifypass.jsp?amount=<%=amt%>">
<div class="container">
	<table>
	<tr>
	    <td><input type="radio" name="but"> Enter Account No
	    </tr>
	    <tr>
	    <td><input type="number" name="bank" >
	    <td><button type="button" onclick="makeGetRequest()" >check</button>
		</tr>
		<tr>
		<td><div id="me"></div>
		</tr>
	   
	    <tr>
	   	    <td><input type="radio" name="but"> Enter Upi Id
	    </tr>
	    <tr>
	    <td><input type="email" name="upi" >
	    <td><button type="button" onclick="makeGetRequestb()" >check</button>
		</tr>
		<tr>
		<td><div id="messb">			</div>
	   </tr>
	   
	   <tr>
	   		<div class="container1" style="background-color: #f1f1f1">
	   		<td><input type="submit" class="cancelbtn" value="Submit">
	   </tr>
	   	</div>
	   	

	</table>
	
	

</form>
<a href="addmoney.jsp">Back</a>

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
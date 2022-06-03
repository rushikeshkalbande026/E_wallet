<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@page import="java.sql.*" %>
       <%@page import="mybeans.DBConnector" %>
           <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/addmoneybank.css">

</head>
<body>
<%if(session.getAttribute("userid")==null)
	response.sendRedirect("invalidate.jsp"); 
	%>
	<div class="container">
 <h2>E_wallet</h2>
 <hr>
      <%
     
     	int id=Integer.parseInt(request.getParameter("towid"));
        double amt=Double.parseDouble(request.getParameter("amt"));   
        String remark=request.getParameter("rmk");
 
     %>
     	
	<form name="frm1" method="post" action="transferamount.jsp">
		
			<table>
					<tr>
	 			<td><label for=""><b>Enter Password</label></td>
			    <td><input type="password" placeholder="Enter userid password" name="pass"
						id="pass" required>
						<td><input type="hidden" name="towid" value="<%=id%>">
						<td><input type="hidden" name="amt" value="<%=amt%>">
						<td><input type="hidden" name="remark" value="<%=remark%>">
						
				<tr>
				
						<tr>
							<td>
							<td><button type="submit">Submit</button>
						
						<tr>
			
			
			
			</table>
	</form>
	<a href="CustomerTransMoney.jsp">Back</a>        	
	  </div>



</body>
</html>
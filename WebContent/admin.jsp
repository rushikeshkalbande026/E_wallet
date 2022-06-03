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
	String aid=String.valueOf(session.getAttribute("admin_id"));
%>
<div class="container">

<h3>search userid and view kyc</h3>
Session ID-<%=session.getId()%>
<form name="frm" method="post" action="viewKyc.jsp" >
<table>
	 <tr>
 			<td><label for=""><b>Enter UserId</label></td>
   	     <td><input type="password" placeholder="Enter Useriid" name="uid"
						id="uid" required>
	 		</tr>
	 			
	 			<tr>
      			<td>
               <button type="submit">Submit</button>
               </td>
        		</tr>
        		</table>
</form>

<br>
<hr>
<br>
<h3>Show transaction report</h3>
<br>
<form name="frm" method="post" action="TransactionReport.jsp">

</form>
<%=aid %>
<br>
	<a href="userStatus.jsp">User Status</a>
	<br>
	<a href="adminShowTransReport.jsp">Users Daily Transaction Report</a>
<br>
<a href="changeAdminpass.jsp">Change Password</a>
<br><br>
<a href="Logout.jsp">Log out</a>
</div>
</body>
</html>
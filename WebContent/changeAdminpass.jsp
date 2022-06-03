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
	String aid = String.valueOf(session.getAttribute("admin_id"));
	%>
	<div class="container">
		<h3>Change Admin Password</h3>
		<form name="frm" method="post" action="ChangeAdminPass">
			<table>

				<tr>
		<td><label for=""><b>Enter Existing Password</label></td>
		<td><input type="password" placeholder="Enter Password" name="eps"
						id="eps" required>
		<tr>
			<td><label for=""><b>Enter New Password</label></td>
			<td><input type="password" placeholder="Enter New Password"
						name="nps" id="nps" required>
			<td><input type="hidden" name="aid" value=<%=aid %>>
		</tr>
		<tr>
			<td>
				<button type="submit">Submit</button>
			</td>
		</tr>


			</table>
		</form>
	</div>
</body>
</html>
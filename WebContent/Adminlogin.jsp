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
<div class="container">
<h2>Admin Login</h2>
      	<form method="post" action="Checkadmin">
        		<table>
        	 <tr>
	 		<td><label for=""><b>Enter AdminID</label></td>
		     <td><input type="text" placeholder="Enter UserId" name="aid"
						id="aid" required>
	 	 <tr>
 			<td><label for=""><b>Enter Password</label></td>
   	     <td><input type="password" placeholder="Enter Password" name="adpswd"
						id="adpswd" required>
	 		</tr>
	 			<tr>	
      			<td>
             <button type="submit">Login</button>
               </td>
        		</tr>
        	
        	</table>
        	
        	</form>
</div>
</body>
</html>
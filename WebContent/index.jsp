<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/addmoneybank.css">

</head>
<body>

			 <div class="imgcontainer">
    <img src="image/e_wallet.png" width="120" height="230" alt="Avatar" class="avatar">
  </div>

                <div class="container">
                <h1>E_wallet</h1>

        	<form method="post" action="Check">
        		<table>
        		 <tr>
	 		<td><label for=""><b>Enter UserID</label></td>
		     <td><input type="text" placeholder="Enter UserId" name="uid"
						id="uid" required>
	 	 <tr>
 			<td><label for=""><b>Enter Password</label></td>
   	     <td><input type="password" placeholder="Enter Password" name="pswd"
						id="pswd" required>
	 		</tr>
	 			<tr>	
      			<td>
             <button type="submit">Login</button>
               </td>
        		</tr>
        	
        	</table>
        	
        	</form>
        	        <a href="Adminlogin.jsp">Admin Login here</a>
  				<br>
        		<a href="NewRegister.html">New User? Register here</a>
        </div>
      
       
    
</body>
</html>
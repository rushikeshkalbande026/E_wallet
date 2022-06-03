<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/addmoneybank.css">

<script language="Javascript" src="js/checkuserstatus.js" type="text/javascript">  </script>


</head>
<body>
<%String uid = String.valueOf(session.getAttribute("userid")); %>
<div  class="container">
<h3>Change User Status</h3>
<form name="frm" method="post" action="ChangeStatus">
<table>
		
		  <tr>
        <td><label for="userid"><b>User Id :</label></td>
        <td><input type="text" placeholder="Enter UserId" name="uid" id="uid" required>
        <td><div id="status"></div>
        </tr>
           <tr>
           		<td><button type="button" onclick="makeGetRequest()">Check</button>
           </tr>

		        <tr>
        <td><label for="Gender"><b>User Status :</label></td>
        <td><input type="radio"  name="sts" id="sts" value=1 >Activate</td>
        <td><input type="radio" name="sts" id="sts" value=0>Deactivate</td>
        </tr>
        
       <tr>
       	<td><button type="submit" >Submit</button>
       </tr>
		
</table>
</form>
<a href="admin.jsp">Back</a>

</div>
</body>
</html>
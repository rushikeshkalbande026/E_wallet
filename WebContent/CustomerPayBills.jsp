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

</head>
<body>
<%
if(session.getAttribute("userid")==null)
response.sendRedirect("invalidate.jsp");
%>
<h1>E_wallet</h1>
<br>
<hr>
<h2>Pays</h2>
<br>
<div><table cellpadding="8">
    <tr>
        <td><img src="image/electricity.jpg" alt="My Pic" width="90" height="90"></div>
        <td><img src="image/mobile.png" alt="My Pic" width="90" height="90"></div> 
        <td><img src="image/DTH.png" alt="My Pic" width="90" height="90"></div>   
    </tr>
	 <tr align="center    ">
        <td><a href="Electricbilles.jsp"><button id="" >Electricity</button></a></td>
        <td><a href="MobileRecharge.jsp"><button id="" >Mobile</button></a></td>
        <td><a href="DTHRecharge.jsp"><button id="" >DTH</button></a></td>
    </tr>
</table>
</div>



</body>
</html>
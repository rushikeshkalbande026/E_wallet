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
<%if(session.getAttribute("admin_id")==null)
	response.sendRedirect("invalidate.jsp"); 
	%>

<%
String userid=request.getParameter("cid");

Connection con;
PreparedStatement pst;
ResultSet rs;

try {
	DBConnector dbc = new DBConnector();
	con = dbc.getConnected();
	pst = con.prepareStatement("select * from users where user_id=?");
	pst.setString(1, userid);
	rs=pst.executeQuery();
	
	if(rs.next()) 
	{
	   int status=rs.getInt("user_status");
	   if(status==1)
	   {%>
		   <h3>Activate</h3> 
	   <%}
	   else
	   {%>
		  <h3>Deactivate</h3>   
	   <%}
						
	}
	else {
		out.println("Not users Id Found");
	}

} catch (Exception ex) {
	System.out.println(ex);
}


%>

</body>
</html>
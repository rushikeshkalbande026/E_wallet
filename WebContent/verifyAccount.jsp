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

int no=Integer.parseInt(request.getParameter("ano"));

String id=request.getParameter("upi");

%>

<%

try
{
	
    String nm;
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;
	
	DBConnector dbc=new DBConnector();
	con=dbc.getConnected();
	pst=con.prepareStatement("select * from accounts where accno=? or upi_id=?;");
	pst.setInt(1, no);
	pst.setString(2, id);
	rs=pst.executeQuery();
	  if(rs.next())
		  nm=rs.getString("accnm");
	  else
		  nm="not null";
	%>
			<h3><%=nm %></h3>
	<%
	
	
}
catch(Exception e) {
	
	e.printStackTrace();
}


%>




</body>
</html>
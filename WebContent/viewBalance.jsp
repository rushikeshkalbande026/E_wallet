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

		
	String uid = String.valueOf(session.getAttribute("userid"));
	String wid = String.valueOf(session.getAttribute("wallet_id"));
	
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	try {
		DBConnector dbc = new DBConnector();
		con = dbc.getConnected();
		pst = con.prepareStatement("select * from wallet where wall_tr_id=?");
		pst.setString(1, wid);
		rs=pst.executeQuery();
		if(rs.next())
		{
			
			double bal=rs.getDouble("wall_bal");
			%>
			  <h4><b><%=bal %></b></h4> 	
			<%
			
		}
			
			
	}
	catch(Exception e)
	{%>
		<h2>Error</h2>
	<%}


%>
</body>
</html>
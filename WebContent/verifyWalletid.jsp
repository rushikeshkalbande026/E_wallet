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
		

	String wid = String.valueOf(session.getAttribute("wallet_id"));

	        try
	        {
	        	String uid,unm;
	        	int id=Integer.parseInt(request.getParameter("wid"));
	          
	        	Connection con;
	        	PreparedStatement pst;
	        	ResultSet rs;
	        	
	        	DBConnector dbc=new DBConnector();
	        	con=dbc.getConnected();
	        	pst=con.prepareStatement("select * from wallet where wall_tr_id=?;");
	        	pst.setInt(1, id);
	        	rs=pst.executeQuery();
	        	
	        	if(rs.next())
	        	{
	        		
	        		uid=rs.getString("user_id");
	        		
	        		pst=con.prepareStatement("select * from users where user_id=?;");
		        	pst.setString(1, uid);
		        	rs=pst.executeQuery();
		    
		        	if(rs.next())
		        	{
		        		unm=rs.getString("user_name");
		        		%>
		        			<h4><%=unm%></h4>
		        		<%
		        	}
	        		
	        	}
	        	else
	        	{%>
	        		<h4 style="color:red;">Wallet id does not exit</h4>
	        	<%}
	        	
       	
	        	
	        }
	        catch(Exception e)
	        {%>
	        	<h3>Error</h3>
	        <%}
	
	
	
	%>

</body>
</html>
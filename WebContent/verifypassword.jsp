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
int wid = Integer.parseInt(String.valueOf(session.getAttribute("wallet_id")));

%>
<h1>E_wallet</h1>

<%

try
{
	Connection con;
	PreparedStatement pst;
	CallableStatement cstmt;
	ResultSet rs;
	
	
	double amt=Double.parseDouble(request.getParameter("amount"));
	int ano=Integer.parseInt(request.getParameter("accno"));
	int pass=Integer.parseInt(request.getParameter("pass"));
	
	DBConnector dbc=new DBConnector();
	con=dbc.getConnected();
	
	pst=con.prepareStatement("select * from accounts where accno=? and upi_pin=?;");
	
	pst.setInt(1, ano);
	pst.setInt(2, pass);
	rs=pst.executeQuery();
	if(rs.next())
	{

		cstmt=con.prepareCall("call procedure updbal(?,?,?);");
		cstmt.setInt(1, ano);
		cstmt.setInt(2, wid);
		cstmt.setDouble(3, amt);
		rs=cstmt.executeQuery();
		if(rs.next())
		{%>
			<br><br><br>
			<div>
				<h2 style="color:green;">Amount Add Succesfully</h2><br>
				<a href="Customer.jsp">back</a>
			
			</div>
		<%}
		else			
		{%>
			<div>
				<h2 >Transaction failed..</h2>
				<a href="Customer.jsp">back</a>
			</div>
			
		<%}
			
	}
	else
	{%>
		<h2 style="color:red;">Invalidate Password...</h2>
		<h4>Enter Current password</h4>
	<%}
}
catch(Exception e)
{
	e.printStackTrace();	
}
%>

</body>
</html>
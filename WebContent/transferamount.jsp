<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
          <%@page import="java.sql.*" %>
       <%@page import="mybeans.DBConnector" %>
           <%@ page import="java.io.*" %>
           <%@ page import="mybeans.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%if(session.getAttribute("userid")==null)
	response.sendRedirect("invalidate.jsp"); 
	%>
 <h1>E_wallet</h1>
 <hr>
 
	
     <%

     try
     {
    	 String uid =String.valueOf(session.getAttribute("userid")) ;
    		String fromid = String.valueOf(session.getAttribute("wallet_id"));
 
     	String unm;
     	String psw=request.getParameter("pass");
     	String rmk=request.getParameter("remark");
     	String toid=request.getParameter("towid");
        double amt=Double.parseDouble(request.getParameter("amt"));
        String pass="";
        
    	PasswordHashing password=new PasswordHashing();
		pass=password.doHashing(psw);
        
     	Connection con;
     	PreparedStatement pst;
     	ResultSet rs;
     	

     	DBConnector dbc=new DBConnector();
    	con=dbc.getConnected();
    	pst=con.prepareStatement("select * from users where user_id=? and pswd=? and user_status=1;");
    	pst.setString(1, uid);
    	pst.setString(2, pass);
    	rs=pst.executeQuery();

    	if(rs.next())
    	{
    		pst=con.prepareStatement("select wall_bal from wallet where wall_tr_id=?");
    		pst.setString(1, fromid);
    		rs=pst.executeQuery();
    		if(rs.next())
    		{
    			double bal=rs.getDouble("wall_bal");
    			if(bal>amt)
    			{

    	        	CallableStatement cstmt;
    	        	
    	        		if(amt>=1000)
    	        		{
    	        			amt=amt+50;
    	        			
    	        			cstmt=con.prepareCall("call trans(?,?,?,?);");
    	        			cstmt.setString(1, fromid);
    	        			cstmt.setString(2, toid);
    	        			cstmt.setDouble(3, amt);
    	        			cstmt.setString(4, rmk);
    	        			cstmt.executeQuery();
    	        			%>
    	        				<h2 style="color:green">Transaction Successful</h2>
    	        				<br><h3 style="color:green">You got a cashback of fifty rupees</h3><br><br>
    	        				<a href="Customer.jsp">Back</a>
    	        			
    	        			<%		
    	        		}
    	        		else if(amt<1000)
    	        		{
    	        			cstmt=con.prepareCall("call trans(?,?,?,?);");
    	        			cstmt.setString(1, fromid);
    	        			cstmt.setString(2, toid);
    	        			cstmt.setDouble(3, amt);
    	        			cstmt.setString(4, rmk);
    	        			cstmt.executeQuery();
    	        			
    	        			%>
    	    				<h2 style="color:green">Transaction Successful</h2>
    	    			     <br><br>
    	    				<a href="Customer.jsp">Back</a>
    	    			
    	    			<%
    	        			
    	        		}
    	        		else
    	        		{%>
    	        			
    	        			<h2 style="color:red;">Transtion Faield...</h2>");
    	        			
    	        		<%}
    	        		
    	           con.close();
    				    				
    			}
    			else
    			{%>
    				<h2 style="color:red;">Reject transaction Your Balance is Low..</h2>
    				<h3>Plase Check Your Balance</h3>
    				<a href="CustomerTransMoney.jsp">Back</a>	
    			<%}
    			
    		}   		
    	}
    	else
    	{%>
    		<h2 style="color:red">Password wrong</h2>
    		<a href="Verifytransfer.jsp?">Back</a>
    	<%}
     }
    
    	catch(Exception e)
    	{%>
    		<h2>Error</h2>
    	<%}
    	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="mybeans.DBConnector" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String id = request.getParameter("uid");
		%>
		<img src="viewKyc.jsp?id=<%=id%>" width="400px"/>
<%
	String aid=String.valueOf(session.getAttribute("admin_id"));
%>
<img src="getImage.jsp?id=<%=aid%>" />
<%=id %>

	<%
	Connection con;
	PreparedStatement pst;
	ResultSet rs;

	try {
		DBConnector dbc = new DBConnector();
		con = dbc.getConnected();
		pst = con.prepareStatement("select * from users where user_id=?");
		pst.setString(1, id);
		rs = pst.executeQuery();

		if (rs.next()) {
			Blob blob = rs.getBlob("profile_photo");
			byte byteArrray[] = blob.getBytes(1, (int) blob.length());
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			os.write(byteArrray);
			os.flush();
			os.close();
			out.println("congrats");
			out.println("byte Array"+byteArrray);
		} else {
			out.print("No image found with this id");

		}

	} catch (Exception ex) {
		System.out.println(ex);
	}
	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="mybeans.DBConnector"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:out value="${param.uid}" />
	<c:out value="${param.id}" />
	
	 <% String id = request.getParameter("id");%>
	 
	<img src="RegisterUser?id=<%=id%>" />
	<img src="viewImage.jsp?id=<%=id%>"/>
	<%=id %>
	<%
	Connection con;
	PreparedStatement pst;

	try {
		DBConnector dbc = new DBConnector();
		con = dbc.getConnected();
		pst = con.prepareStatement("select * from users where user_id=?");
		pst.setString(1, id);
		ResultSet rs = pst.executeQuery();

		if (rs.next()) {
			Blob blob = rs.getBlob("profile_photo");
			byte byteArrray[] = blob.getBytes(1, (int) blob.length());
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			os.write(byteArrray);
			os.flush();
			os.close();
			out.println("congrats");
		} else {
			out.print("No image found with this id");

		}

	} catch (Exception ex) {
		System.out.println(ex);
	}
	%>
</body>
</html>
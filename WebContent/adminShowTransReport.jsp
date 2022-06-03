<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="mybeans.DBConnector" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>	
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css">


<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script> 


<script src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script> 
<script src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>


	<script type="text/javascript">
$(document).ready(function() 
{ 
    $('#example').DataTable( 
    { 
        dom: 'Blfrtip',
    } );

} );
</script>



</head>





<body>

<%
if(session.getAttribute("admin_id")!=null)
{
%>

<%
   
String uid = String.valueOf(session.getAttribute("userid"));
String wid = String.valueOf(session.getAttribute("wallet_id"));
	
	String mob=String.valueOf(session.getAttribute("mob_no"));
%>
<div>
<h2>Customer Transaction Report</h2>
<hr>
</div>

<div>
<table id="example" class="display nowrap" style=100%>

<thead>
<tr>
<th>Transaction ID
<th>Transaction Date
<th>Transaction Type
<th>Transaction from Wallet Id
<th>Transaction made to Wallet Id
<th>Amount
<th>Remarks added
</tr>
</thead>
<%
String trid,trdate,trtype,trto,remark;
double bal;

String trfrm=uid;

Connection con;
PreparedStatement pst;
ResultSet rs;

try{
DBConnector dbc=new DBConnector();
con=dbc.getConnected();

pst=con.prepareStatement("select * from transaction ;");
rs=pst.executeQuery();
%>
<tbody>
<%
while(rs.next()){
		%>

		<tr align="center">
		<td><%=rs.getString("tr_id") %>
		<td><%=rs.getDate("tr_date") %>
		<td><%=rs.getString("tr_type") %>
		<td><%=rs.getString("tr_wall_frm") %>
		<td><%=rs.getString("tr_wall_to") %>
		<td><%=rs.getDouble("balance") %>
		<td><%=rs.getString("remark") %>
		</tr>

		<%
}
%>
</tbody>

<%
}
catch(Exception ex){
	out.println(ex);
}
%>
<%
}
else{
	%>
	<h3 style="color:red">Invalid Session</h3>
	<a href="index.jsp">Login Now</a>
	<%
}
%>
</table>

</div>

<br>


</body>
</html>
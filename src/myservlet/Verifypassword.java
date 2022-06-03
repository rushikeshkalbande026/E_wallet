package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybeans.DBConnector;

/**
 * Servlet implementation class Verifypassword
 */
@WebServlet("/Verifypassword")
public class Verifypassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Verifypassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
    	response.setContentType("text/html");

out.println("<h1>E_wallet</h1><hr>");



try
{
	Connection con;
	PreparedStatement pst;
	CallableStatement cstmt;
	ResultSet rs;
	
	
	
	double amt=Double.parseDouble(request.getParameter("amount"));
	int ano=Integer.parseInt(request.getParameter("accno"));
	int pass=Integer.parseInt(request.getParameter("pass"));
	int wid=Integer.parseInt(request.getParameter("wid"));

	
	
	DBConnector dbc=new DBConnector();
	con=dbc.getConnected();
	
	pst=con.prepareStatement("select * from accounts where accno=? and upi_pin=?;");
	
	pst.setInt(1, ano);
	pst.setInt(2, pass);
	rs=pst.executeQuery();
	if(rs.next())
	{

		
		cstmt=con.prepareCall("call updbal(?,?,?);");
		cstmt.setInt(1, ano);
		cstmt.setInt(2, wid);
		cstmt.setDouble(3, amt);
		cstmt.executeQuery();
	 
				out.println("<h2 style='color:green;'>Amount Add Succesfully</h2><br>");
				out.println("<a href='Customer.jsp'>back</a>");
			
	}
	else
	{
		out.println("<h2 style='color:red;'>Invalidate Password...</h2>");
		out.println("<h4>Enter Current password</h4>");
	}
	con.close();
}
catch(Exception e)
{
	out.println("Error");	
}


		
	}

}

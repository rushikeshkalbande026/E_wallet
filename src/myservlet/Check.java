package myservlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.DBConnector;
import mybeans.PasswordHashing;

/**
 * Servlet implementation class Check
 */
@WebServlet("/Check")
public class Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String id,ps,psw;
		id=request.getParameter("uid");
		ps=request.getParameter("pswd");
	
		
		
		PasswordHashing pass=new PasswordHashing();
		psw=pass.doHashing(ps);
		
		

		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
			DBConnector dbc=new DBConnector();
			con=dbc.getConnected();
			
			pst=con.prepareStatement("select * from users where user_id=? and pswd=? and user_status=1");
			
			pst.setString(1, id);
			pst.setString(2, psw);
			rs=pst.executeQuery();
		
			if(rs.next())
			{
				HttpSession ses=request.getSession(true);
				ses.setAttribute("userid", id);
			
				
				pst=con.prepareStatement("select wall_tr_id from wallet where user_id=?;");
				pst.setString(1, id);
				rs=pst.executeQuery();
				
				if(rs.next())
				{
					ses.setAttribute("wallet_id", rs.getString("wall_tr_id"));
					response.sendRedirect("Customer.jsp");
				}	
				else
				{
				response.sendRedirect("Customer1.jsp");
				
				}
				
				
			}
			else
			{
				response.sendRedirect("Failure.jsp");
			}			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
	}

}

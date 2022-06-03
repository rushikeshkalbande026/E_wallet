package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.DBConnector;
import mybeans.PasswordHashing;

/**
 * Servlet implementation class Checkadmin
 */
@WebServlet("/Checkadmin")
public class Checkadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkadmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String aid,aps,adpswd;
		
		aid=request.getParameter("aid");
		aps=request.getParameter("adpswd");
		
		PasswordHashing pass=new PasswordHashing();
		adpswd=pass.doHashing(aps);
	
		Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
		try
		{
		
			
			DBConnector dbc=new DBConnector();
			con=dbc.getConnected();
		pst=con.prepareStatement("select * from admin where admin_id=? and admin_pswd=?;");
		pst.setString(1, aid);
		pst.setString(2, adpswd);
		rs=pst.executeQuery();
		
		if(rs.next())
		{
			HttpSession ses1=request.getSession(true);
			ses1.setAttribute("admin_id", aid);
			
			response.sendRedirect("admin.jsp");
		}	
		else
		{
			response.sendRedirect("Failure.jsp");
		
		}
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
	}

}

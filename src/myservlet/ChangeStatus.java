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

import mybeans.DBConnector;
//import myrestapi.RestServies;

/**
 * Servlet implementation class ChangeStatus
 */
@WebServlet("/ChangeStatus")
public class ChangeStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatus() {
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
		
		String userid=request.getParameter("uid");
		int status=Integer.parseInt(request.getParameter("sts"));
		
		Connection con;
		PreparedStatement pst;
		ResultSet rs;

		try {
			DBConnector dbc = new DBConnector();
			con = dbc.getConnected();
			pst = con.prepareStatement("update users set user_status=? where user_id=?");
			pst.setInt(1, status);
			pst.setString(2, userid);
			int rs1=pst.executeUpdate();
			
			if(rs1>0) {
				out.println("<link rel=\"stylesheet\" href=\"css/addmoneybank.css\">");
				out.println("<h2>update status updated<h2>");
				out.println("<br><a href='admin.jsp'>Back</a>");
			}
			else {
				out.println("User status not updated");
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}

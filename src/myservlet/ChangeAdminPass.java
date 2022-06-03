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

/**
 * Servlet implementation class ChangeAdminPass
 */
@WebServlet("/ChangeAdminPass")
public class ChangeAdminPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAdminPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
    	
    	HttpSession session = request.getSession(true);
    	String id=String.valueOf(session.getAttribute("user_id"));
    	out.println(id);
    	
    	String eps,nps,aid;
    	
    	eps=request.getParameter("eps");
    	nps=request.getParameter("npc");
    	aid=request.getParameter("aid");
    	
    	Connection con;
		PreparedStatement pst;
		ResultSet rs;
		
    	
    	try {
    		
    		DBConnector dbc=new DBConnector();
    		con=dbc.getConnected();
    		pst=con.prepareStatement("select * from admin where admin_id=? and admin_pswd=?");
    		pst.setString(1, aid);
    		pst.setString(2, eps);
    		
    		rs=pst.executeQuery();
    		while(rs.next()) {
    			out.print("ADMIN VERIFIED");
    			//response.sendRedirect("genWalletID.jsp");
    			
    			pst=con.prepareStatement("update admin set admin_pswd=? where admin_id=?; ");
    			pst.setString(1, nps);
    			pst.setString(2, aid);
    			pst.executeUpdate();
    			out.println("password updated");
    		}
    		
    		con.close();
    	}
    	catch(Exception ex) {
    		out.print(ex);
    	}
	}

}

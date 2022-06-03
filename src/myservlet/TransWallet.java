package myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybeans.DBConnector;

/**
 * Servlet implementation class TransWallet
 */
@WebServlet("/TransWallet")
public class TransWallet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransWallet() {
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
    	String id=String.valueOf(session.getAttribute("userid"));
    	int widfrm=Integer.parseInt(String.valueOf(session.getAttribute("walletid")));
    	out.println(id);
    	out.println(widfrm);
    	
    	double amt=Double.parseDouble(request.getParameter("amt"));
    	int widto=Integer.parseInt(request.getParameter("wid"));
    	String rmk=request.getParameter("rmk");
    	out.println(widto);
    	out.println(rmk);
    	
    	Connection con;
    	CallableStatement cstmt;
    	
    	try {
    		
    		DBConnector dbc=new DBConnector();
    		con=dbc.getConnected();
    		
    		if(amt>=1000)
    		{
    			amt=amt+50;
    			
    			cstmt=con.prepareCall("call trans(?,?,?,?);");
    			cstmt.setInt(1, widfrm);
    			cstmt.setInt(2, widto);
    			cstmt.setDouble(3, amt);
    			cstmt.setString(4, rmk);
    			cstmt.executeQuery();
    					
    		}
    		else if(amt<1000)
    		{
    			cstmt=con.prepareCall("call trans(?,?,?,?);");
    			cstmt.setInt(1, widfrm);
    			cstmt.setInt(2, widto);
    			cstmt.setDouble(3, amt);
    			cstmt.setString(4, rmk);
    			cstmt.executeQuery();
    			
    			
    		}
    		else
    		{
    			out.println("<h3>Transtion Faield...</h3>");
    			
    		}
    		
    		
    		
    		
    		
    		con.close();
    	}
    	catch(Exception ex) {
    		out.print(ex);
    	}	

	}

}

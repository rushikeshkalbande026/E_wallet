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
 * Servlet implementation class FASTagRecharge
 */
@WebServlet("/FASTagRecharge")
public class FASTagRecharge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FASTagRecharge() {
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
    	String userwid = String.valueOf(session.getAttribute("wallet_id"));
    	out.println(id);
    	
    	String vno,bank;
    	String operator,region;
    	double amount;
    	
    	vno=request.getParameter("vno");
    	bank=request.getParameter("bank");
    	amount=Double.parseDouble(request.getParameter("amt"));
    	
    	Connection con;
		PreparedStatement pst;
		ResultSet rs;
		int cnt;
    	
    	try {
    		
    		DBConnector dbc=new DBConnector();
    		con=dbc.getConnected();
    		pst=con.prepareStatement("select * from company where company_name=?");
    		pst.setString(1, bank);
    		
    		rs=pst.executeQuery();
    		while(rs.next()) {
    			String companyid=rs.getString("company_id");
    			out.println(companyid);
    			out.print("ADMIN VERIFIED");
    			//response.sendRedirect("genWalletID.jsp");
    			
    			
    			pst=con.prepareStatement("call trans(?,?,?);");
    			pst.setString(1, id);
    			pst.setString(2, companyid);
    			pst.setDouble(3, amount);
    			pst.executeQuery();
    			out.println("Electric Bill Paid successfull");
    			
    			//Wallet and transaction stored procedure
    		}
    		
    		con.close();
    	}
    	catch(Exception ex) {
    		out.print(ex);
    	}

	}

}

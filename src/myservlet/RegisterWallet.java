package myservlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import mybeans.DBConnector;

/**
 * Servlet implementation class RegisterWallet
 */
@WebServlet("/RegisterWallet")
@MultipartConfig(maxFileSize = 16177216)
public class RegisterWallet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterWallet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	
    	
    	PrintWriter out=response.getWriter();
    	response.setContentType("text/html");
    	HttpSession session = request.getSession(true);
    	String id=String.valueOf(session.getAttribute("userid"));
    	String mob = null;
    	try
    	{
    		Connection con;
    		PreparedStatement pst;
    		ResultSet rs;
    		
    		DBConnector dbc=new DBConnector();
    		con=dbc.getConnected();
    		pst=con.prepareStatement("select * from users where user_id=?;");
    		pst.setString(1, id);
    		rs=pst.executeQuery();
    		if(rs.next())
    			mob=rs.getString("mob_no");
    	}
    	catch(Exception e) {}
    	
    	Part filePart=request.getPart("file");
    	InputStream fileContent=filePart.getInputStream();
    	
    	String walletid,userid,trid=null;
    	double walletbal;
    	
    	
    	String kycno=request.getParameter("num");
    	String mix=(mob.substring(0, 3))+kycno.substring(0,3);

    	
    	userid=request.getParameter("sessionid");
    	out.print(kycno);
    	out.println(userid);
    	
    	Connection con;
		PreparedStatement pst;
		ResultSet rs;
		int cnt;
    	
    	try {
    		
    		DBConnector dbc=new DBConnector();
    		con=dbc.getConnected();
    		pst=con.prepareStatement("update users set aadhar_kyc=? where user_id=? and user_status=1;");
    		pst.setBlob(1, fileContent);
    		pst.setString(2, id);
    		
    		cnt=pst.executeUpdate();
    		if(cnt>0) {
    			out.print("<h1 style='color:green';>aadhar verified<h1><br><hr>");
    			//response.sendRedirect("genWalletID.jsp");
    			
    			pst=con.prepareStatement("insert into wallet (wall_tr_id,user_id,wall_bal,wall_open,wall_status) values (?,?,0,now(),1); ");
    			pst.setString(1, mix);
    			pst.setString(2, id);
    			pst.executeUpdate();
    			out.println("<h2>inserted into wallet<h2>");
    			out.println("<br><a href='Customer.jsp'>Continue</a>");
    		}
    		else {
    			out.println("aadhar kyc not verified or userid issue") ;
    		}
    		con.close();
    	}
    	catch(Exception ex) {
    		out.print(ex);
    	}	
    
	}

}

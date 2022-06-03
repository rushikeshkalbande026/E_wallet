package myservlet;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import mybeans.*;

/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
//in order to recognise multipart/form-data use annotation
@MultipartConfig
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html");
		
		Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
	    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
	    InputStream fileContent = filePart.getInputStream();
	    
	   
	    InputStream file=null;
		String mobno,aadharno;
		String usernm,password,pass,email,date,userid,gen;
		
		
	
		
		PrintWriter out=response.getWriter();
		
		userid=request.getParameter("uid");
		usernm=request.getParameter("unm");
		mobno=request.getParameter("mob");
		aadharno=request.getParameter("aadharno");
		pass=request.getParameter("psw");
		email=request.getParameter("email");
		date=request.getParameter("dob");
		gen=request.getParameter("gen");
		
		
		
		PasswordHashing pds=new PasswordHashing();
		password=pds.doHashing(pass);
		
		/*UserMaker umk=new UserMaker();
		umk.setUserid(userid);
		umk.setUsernm(usernm);
		umk.setPasswd(password);
		umk.setDob(date);
		umk.setMobno(mobno);
		umk.setAadharno(aadharno);
		umk.setEmail(email);
		umk.setFile(fileContent);*/
		
		
		
		Connection con;
		PreparedStatement pst;
		
		try {
			DBConnector dbc=new DBConnector();
			con=dbc.getConnected();
			pst=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,now(),?,?,?,1);");
			pst.setString(1, userid);
			pst.setString(2, usernm);
			pst.setString(3, gen);
			pst.setString(4, password);
			pst.setString(5, date);
			pst.setString(6, mobno);
			pst.setString(7, aadharno);
			pst.setString(8, email);
			pst.setBlob(9, fileContent);
			pst.setBlob(10,file);
			
			pst.executeUpdate();
			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	
		
		
		out.println("<h2 style='color:green;'>Account Opened Successfully</h2>");
		out.println("<a href='index.jsp'>Back</a>");
		
	}

}

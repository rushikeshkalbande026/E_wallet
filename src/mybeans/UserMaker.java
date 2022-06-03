package mybeans;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class UserMaker 
{
	
	private String userid;
	private String usernm;
	private String passwd;
	private String gen;
	private String dob;
	private int mobno;
	private int aadharno;
	private String email;	
	private InputStream file;
	private InputStream file1;
	
	public UserMaker()
	{
		userid="";
		usernm="";
		passwd="";
		dob="";
		mobno=0;
		aadharno=0;
		email="";
		file=null;
		file1=null;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(String userid) {
		this.userid = userid;
	}
	/**
	 * @param usernm the usernm to set
	 */
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	/**
	 * @param passwd the passwd to set
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	/**
	 * @param dob the dob to set
	 */
	public void setDob(String dob) {
		this.dob = dob;
	}
	/**
	 * @param mobno the mobno to set
	 */
	public void setMobno(int mobno) {
		this.mobno = mobno;
	}
	/**
	 * @param aadharno the aadharno to set
	 */
	public void setAadharno(int aadharno) {
		this.aadharno = aadharno;
	}
	/**
	 * @param email the email to set
	 */

	public void setFile(InputStream file) {
		this.file = file;
	}
	
	
	public void setEmail(String email) {
		this.email = email;
		onUserMade();
	}
	
	
	/**
	 * @param blob the blob to set
	 */


	

	private void onUserMade() {
		Connection con;
		PreparedStatement pst;
		
		try {
			DBConnector dbc=new DBConnector();
			con=dbc.getConnected();
			pst=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,now(),?,?,?,1);");
			pst.setString(1, userid);
			pst.setString(2, usernm);
			pst.setString(3, gen);
			pst.setString(4, passwd);
			pst.setString(5, dob);
			pst.setInt(6, mobno);
			pst.setInt(7, aadharno);
			pst.setString(8, email);
			pst.setBlob(9, file);
			pst.setBlob(10,file1);
			
			pst.executeUpdate();
			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}


	
	
}

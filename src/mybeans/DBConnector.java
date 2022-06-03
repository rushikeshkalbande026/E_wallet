package mybeans;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector 
{
	public Connection getConnected()
	{
		Connection con=null;
				
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/e_wallet?user=root&password=Manish12");
			
		}
		catch(Exception e)
		{
			
		}
		return con;
	}

}

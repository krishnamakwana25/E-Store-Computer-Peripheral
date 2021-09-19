package connection;
import java.sql.*;
public class Connect
{
	public static Connection sqlconnection(){
		Connection cn= null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","krishna25");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cn;	
	}
}
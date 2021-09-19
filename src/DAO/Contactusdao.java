package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Contactbean;
import connection.Connect;
public class Contactusdao {

	public void insertcontactus(Contactbean cb) {
		// TODO Auto-generated method stub
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into contactus_table(name,email,mobile_no,message,is_Active,doi,dou) values(?,?,?,?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, cb.getName());
			ps.setString(2, cb.getEmail());
			ps.setString(3, cb.getMobile_no());
			ps.setString(4, cb.getMessage());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<Contactbean> getallContactus() throws SQLException
	{
		List<Contactbean> list =new ArrayList<Contactbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			//String query ="select * from feedback_table where is_Active=1";		
			String query ="select * from contactus_table where is_Active=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Contactbean cb = new Contactbean();		
				cb.setContact_us_id(r.getInt("contact_us_id"));
				cb.setName(r.getString("name"));
				cb.setEmail(r.getString("email"));
				cb.setMobile_no(r.getString("mobile_no"));
				cb.setMessage(r.getString("message")); 	
				list.add(cb);
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public void deletecontactus(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update contactus_table set is_Active=0 where contact_us_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,id);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.ORPStatusBean;
import connection.Connect;
public class ORPStatusdao 
{	
	public static void InsertIntoRentStatus(ORPStatusBean osrb) 
	{		
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into orpstatus_table(orp_id,user_id,rentprodid,status,isActive)"+ "values(?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, osrb.getOrp_id());
			ps.setInt(2, osrb.getUser_id());
			ps.setInt(3, osrb.getRentprodid());
			ps.setString(4, osrb.getStatus());		
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<ORPStatusBean> getAllRentOrderStatus() throws SQLException
	{
		List<ORPStatusBean> list =new ArrayList<ORPStatusBean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM orpstatus_table where isActive =1  ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPStatusBean orpb = new ORPStatusBean();
				orpb.setStatus_id(r.getInt("status_id"));
				orpb.setOrp_id(r.getInt("orp_id"));
				orpb.setRentprodid(r.getInt("rentprodid"));			
				orpb.setUser_id(r.getInt("user_id"));
				orpb.setStatus(r.getString("status"));
				list.add(orpb);
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
	public static List<ORPStatusBean> getRentOrderStatus(int orpid, int pid ,int uid) throws SQLException
	{
		List<ORPStatusBean> list =new ArrayList<ORPStatusBean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM orpstatus_table where isActive =1 AND orp_id = '"+orpid+"' AND rentprodid = '"+pid+"' AND user_id = '"+uid+"' ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPStatusBean orpb = new ORPStatusBean();
				orpb.setStatus_id(r.getInt("status_id"));
				orpb.setOrp_id(r.getInt("orp_id"));
				orpb.setRentprodid(r.getInt("rentprodid"));			
				orpb.setUser_id(r.getInt("user_id"));
				orpb.setStatus(r.getString("status"));
				list.add(orpb);
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

	public static void updateRentStatus(ORPStatusBean osrb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update orpstatus_table set status=? where status_id=?";  //,subtotal=?,maintotal=?
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setString(1,osrb.getStatus());	
			ps.setInt(2,osrb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static void deleteRentOrderStatus(ORPStatusBean orpb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="delete from orpstatus_table where status_id=?";  //,subtotal=?,maintotal=?
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,orpb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void updateStatus(ORPStatusBean orb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update orpstatus_table set status=? where status_id=?";  
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setString(1,orb.getStatus());	
			ps.setInt(2,orb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int getallRentOrdersCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orpstatus_table WHERE  isActive = 1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				cnt++;
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cnt;
	}
}
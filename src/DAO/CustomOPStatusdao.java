package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.CustomOpStatusBean;
import connection.Connect;
public class CustomOPStatusdao 
{	
	public static void InsertIntoCustomStatus(CustomOpStatusBean cosb) 
	{		
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into custom_op_status(cust_op_id,user_id,customizeprodid,status,isActive)"+ "values(?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, cosb.getCust_op_id());
			ps.setInt(2, cosb.getUser_id());
			ps.setInt(3, cosb.getCustomizeprodid());
			ps.setString(4, cosb.getStatus());		
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<CustomOpStatusBean> getAllCustomOrderStatus() throws SQLException
	{
		List<CustomOpStatusBean> list =new ArrayList<CustomOpStatusBean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM custom_op_status where isActive = 1  ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOpStatusBean copb = new CustomOpStatusBean();
				copb.setStatus_id(r.getInt("status_id"));
				copb.setCust_op_id(r.getInt("cust_op_id"));
				copb.setCustomizeprodid(r.getInt("customizeprodid"));			
				copb.setUser_id(r.getInt("user_id"));
				copb.setStatus(r.getString("status"));
				list.add(copb);
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
	public static List<CustomOpStatusBean> getCustomOrderStatus(int copid, int pid ,int uid) throws SQLException
	{
		List<CustomOpStatusBean> list =new ArrayList<CustomOpStatusBean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM custom_op_status where isActive =1 AND cust_op_id = '"+copid+"'  AND customizeprodid = '"+pid+"' AND user_id = '"+uid+"' ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOpStatusBean copb = new CustomOpStatusBean();
				copb.setStatus_id(r.getInt("status_id"));
				copb.setCust_op_id(r.getInt("cust_op_id"));
				copb.setCustomizeprodid(r.getInt("customizeprodid"));			
				copb.setUser_id(r.getInt("user_id"));
				copb.setStatus(r.getString("status"));
				list.add(copb);
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

	public static void updateCustomStatus(CustomOpStatusBean cosb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update custom_op_status set status=? where status_id=?";  
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setString(1,cosb.getStatus());	
			ps.setInt(2,cosb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static void deleteCustomOrderStatus(CustomOpStatusBean copb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="delete from custom_op_status where status_id=?";  
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,copb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int getallCustomOrdersCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM custom_op_status WHERE  isActive = 1";
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

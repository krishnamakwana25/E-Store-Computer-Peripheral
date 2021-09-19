package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.OrderStatusBean;
import connection.Connect;
public class OrderStatusdao 
{
	public static void InsertIntoStatus(OrderStatusBean osb) 
	{		
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into opstatus_table(op_id,user_id,product_id,status,isActive)"+ "values(?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, osb.getOp_id());
			ps.setInt(2, osb.getUser_id());
			ps.setInt(3, osb.getProduct_id());
			ps.setString(4, osb.getStatus());		
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<OrderStatusBean> getAllOrderStatus() throws SQLException
	{
		List<OrderStatusBean> list =new ArrayList<OrderStatusBean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM opstatus_table where isActive =1  ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderStatusBean opb = new OrderStatusBean();
				opb.setStatus_id(r.getInt("status_id"));
				opb.setOp_id(r.getInt("op_id"));
				opb.setProduct_id(r.getInt("product_id"));			
				opb.setUser_id(r.getInt("user_id"));
				opb.setStatus(r.getString("status"));
				list.add(opb);
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
	public static List<OrderStatusBean> getOrderStatus(int opid, int pid ,int uid) throws SQLException
	{
		List<OrderStatusBean> list =new ArrayList<OrderStatusBean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM opstatus_table where isActive =1 AND op_id = '"+opid+"' AND product_id = '"+pid+"' AND user_id = '"+uid+"' ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderStatusBean opb = new OrderStatusBean();
				opb.setStatus_id(r.getInt("status_id"));
				opb.setOp_id(r.getInt("op_id"));
				opb.setProduct_id(r.getInt("product_id"));			
				opb.setUser_id(r.getInt("user_id"));
				opb.setStatus(r.getString("status"));
				list.add(opb);
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

	public static void updateStatus(OrderStatusBean osb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update opstatus_table set status=? where status_id=?";  
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setString(1,osb.getStatus());	
			ps.setInt(2,osb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static void deleteOrderStatus(OrderStatusBean opb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="delete from opstatus_table where status_id=?";  
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,opb.getStatus_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int getallOrdersCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM opstatus_table WHERE  isActive = 1";
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

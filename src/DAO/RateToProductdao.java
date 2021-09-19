package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.OrderCancelbean;
import bean.RateToProductbean;
import connection.Connect;
public class RateToProductdao 
{
	public static void InsertRating(RateToProductbean rtpb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into rating_table(user_id,op_id,userorder_id,product_id,rating,isActive)"+ "values(?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, rtpb.getUserid());
			ps.setInt(2, rtpb.getOPid());
			ps.setString(3, rtpb.getUserOrderid());
			ps.setInt(4, rtpb.getProductid());
			ps.setString(5, rtpb.getRating());	
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<OrderCancelbean> getallcancelOrderByUserId(int id) throws SQLException
	{
		List<OrderCancelbean> list =new ArrayList<OrderCancelbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM ordercancel_table INNER JOIN op_table ON ordercancel_table.`op_id` = op_table.`op_id` INNER JOIN product_table ON ordercancel_table.`productid` = product_table.`productid` WHERE ordercancel_table.`user_id`='"+id+"' AND ordercancel_table.`isActive`=1;";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderCancelbean ocb = new OrderCancelbean();
				ocb.setOPid(r.getInt("op_id"));
				ocb.setOrderid(r.getInt("order_id"));
				ocb.setProductid(r.getInt("productid"));
				ocb.setUserOrderid(r.getString("userorder_id"));
				ocb.setOrderPlaceDate(r.getString("orderplacedate"));
				ocb.setOrderQty(r.getInt("qty"));
				ocb.setUserid(r.getInt("user_id"));
				ocb.setOrderPrice(r.getInt("productprice"));
				ocb.setOrderTotal(r.getInt("totalamt"));				
				ocb.setProductName(r.getString("productname"));
				ocb.setProductPhoto1(r.getString("productphoto1"));
				list.add(ocb);
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
	
	/*=========================================================================================================*/
	public int getFiveCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"' AND rating=5";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
	
	}
	
	/*=========================================================================================================*/
	public int getFourCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"' AND rating=4";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	/*=========================================================================================================*/
	public int getThreeCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"' AND rating=3";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	/*=========================================================================================================*/
	public int getTwoCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"' AND rating=2";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	/*=========================================================================================================*/
	public int getOneCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"' AND rating=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	/*=========================================================================================================*/
	public int getZeroCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"' AND rating=0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();			
			while(rs.next())
			{
				count++;
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	
	/*=========================================================================================================*/
	public int getCount(int id) throws SQLException
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "select * from rating_table where product_id= '"+id+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet re = ps.executeQuery();
			
			while(re.next())
			{
				count++;
			}
			re.close();
			ps.close();
			con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return count;	
	}
	
	public static boolean getRatingByProUserId(int pid,int uid) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();
		query="SELECT * FROM rating_table WHERE product_id='"+pid+"' AND user_id='"+uid+"'";
		PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
		rs.close();
		ps.close();							
		cn.close();
		return false;
	}
}

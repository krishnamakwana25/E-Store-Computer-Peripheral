package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.OrderProductbean;
import connection.Connect;
public class OrderProductdao 
{
	public static void InsertIntoOP(OrderProductbean op)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into op_table(order_id,user_id,productid,userorder_id,orderplacedate,qty,productprice,totalamt,paymenttype,isActive)"+ "values(?,?,?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, op.getOrderid());
			ps.setInt(2, op.getUserid());
			ps.setInt(3, op.getProductid());
			ps.setString(4, op.getUserOrderid());
			ps.setString(5, op.getOrderPlaceDate());
			ps.setInt(6,op.getOrderQty());
			ps.setInt(7, op.getOrderPrice());
			ps.setInt(8, op.getOrderTotal());
			ps.setString(9, op.getPaymnetType());  
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<OrderProductbean> getallOPByUserId(int id) throws SQLException
	{
		List<OrderProductbean> list =new ArrayList<OrderProductbean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM op_table INNER JOIN product_table ON op_table.`productid` = product_table.`productid` INNER JOIN order_table ON op_table.`order_id` = order_table.`order_id` WHERE op_table.`user_id`='"+id+"' AND op_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderProductbean opb = new OrderProductbean();
				opb.setOPid(r.getInt("op_id"));
				opb.setOrderid(r.getInt("order_id"));
				opb.setProductid(r.getInt("productid"));
				opb.setUserOrderid(r.getString("userorder_id"));
				opb.setOrderPlaceDate(r.getString("book_date"));
				opb.setOrderQty(r.getInt("qty"));
				opb.setUserid(r.getInt("user_id"));
				opb.setOrderPrice(r.getInt("productprice"));
				opb.setOrderTotal(r.getInt("totalamt"));
				opb.setPaymnetType(r.getString("paymenttype"));	
				opb.setProductName(r.getString("productname"));
				opb.setProductPhoto1(r.getString("productphoto1"));
				opb.setProductQty1(r.getInt("productqty"));
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

	public static List<OrderProductbean> getallOPByUserId1(int id) throws SQLException
	{
		List<OrderProductbean> list =new ArrayList<OrderProductbean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM op_table INNER JOIN product_table ON op_table.`productid` = product_table.`productid` INNER JOIN order_table ON op_table.`order_id` = order_table.`order_id` WHERE op_table.`user_id`='"+id+"' AND op_table.`isActive`=0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderProductbean opb = new OrderProductbean();
				opb.setOPid(r.getInt("op_id"));
				opb.setOrderid(r.getInt("order_id"));
				opb.setProductid(r.getInt("productid"));
				opb.setUserOrderid(r.getString("userorder_id"));
				opb.setOrderPlaceDate(r.getString("book_date"));
				opb.setOrderQty(r.getInt("qty"));
				opb.setUserid(r.getInt("user_id"));
				opb.setOrderPrice(r.getInt("productprice"));
				opb.setOrderTotal(r.getInt("totalamt"));
				opb.setPaymnetType(r.getString("paymenttype"));	
				opb.setProductName(r.getString("productname"));
				opb.setProductPhoto1(r.getString("productphoto1"));
				opb.setProductQty1(r.getInt("productqty"));
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

	public static void CancelOrder(int opid,String ouid) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update op_table set isActive=0 where op_id=? AND userorder_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,opid);
			ps.setString(2,ouid);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	public static List<OrderProductbean> getallOPByUserOrderId(String ouid) 
	{		
		List<OrderProductbean> list =new ArrayList<OrderProductbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM op_table INNER JOIN product_table ON op_table.`productid` = product_table.`productid` INNER JOIN order_table ON op_table.`order_id` = order_table.`order_id` WHERE op_table.`userorder_id`='"+ouid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderProductbean opb = new OrderProductbean();
				opb.setOPid(r.getInt("op_id"));
				opb.setProductid(r.getInt("productid"));
				opb.setUserOrderid(r.getString("userorder_id"));
				opb.setOrderQty(r.getInt("qty"));
				opb.setProductQty1(r.getInt("productqty"));
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
	
	public static boolean isProductPresent(int pid,int opid) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();				
		query="SELECT * FROM op_table WHERE op_id= '"+opid+"' AND isActive=1";
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

	public static void InsertRating(OrderProductbean op) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();	
			String query="update op_table set rating = ? where op_id = ?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, op.getRating());
			ps.setInt(2, op.getOPid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<OrderProductbean> getPresentProductforRating(int pid) 
	{		
		List<OrderProductbean> list =new ArrayList<OrderProductbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM op_table WHERE productid='"+pid+"' AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderProductbean opb = new OrderProductbean();
				opb.setOPid(r.getInt("op_id"));
				opb.setProductid(r.getInt("productid"));
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
	
	public static int getallOrderCnt(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM op_table WHERE user_id= '"+id+"' AND isActive = 1";
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
	
	public static List<OrderProductbean> getallOP() throws SQLException
	{
		List<OrderProductbean> list =new ArrayList<OrderProductbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM op_table INNER JOIN product_table ON op_table.`productid` = product_table.`productid` INNER JOIN order_table ON op_table.`order_id` = order_table.`order_id` INNER JOIN user_table ON op_table.`user_id` = user_table.`user_id` WHERE op_table.`isActive`=1;";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderProductbean opb = new OrderProductbean();
				opb.setOPid(r.getInt("op_id"));
				opb.setOrderid(r.getInt("order_id"));
				opb.setProductid(r.getInt("productid"));
				opb.setUserOrderid(r.getString("userorder_id"));
				opb.setOrderPlaceDate(r.getString("book_date"));
				opb.setOrderQty(r.getInt("qty"));
				opb.setUserid(r.getInt("user_id"));
				opb.setOrderPrice(r.getInt("productprice"));
				opb.setOrderTotal(r.getInt("totalamt"));
				opb.setPaymnetType(r.getString("paymenttype"));	
				opb.setProductName(r.getString("productname"));
				opb.setProductPhoto1(r.getString("productphoto1"));
				opb.setProductQty1(r.getInt("productqty"));
				opb.setUsername(r.getString("user_name"));
				opb.setAddress(r.getString("address"));
				opb.setMail(r.getString("email"));
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

	public void deleteOrder(int id)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update op_table set isActive=0 where op_id=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
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
			String query ="SELECT * FROM op_table WHERE  isActive = 1";
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
	
	public static List<OrderProductbean> getallOPByUserIdForStatus(int id) throws SQLException
	{
		List<OrderProductbean> list =new ArrayList<OrderProductbean>();
		try
		{
			Connection con=Connect.sqlconnection();		
			String query ="SELECT * FROM op_table INNER JOIN product_table ON op_table.`productid` = product_table.`productid` INNER JOIN order_table ON op_table.`order_id` = order_table.`order_id` WHERE op_table.`isActive` =1 AND op_table.`user_id` = '"+id+"' ORDER BY op_id DESC LIMIT 1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				OrderProductbean opb = new OrderProductbean();
				opb.setOPid(r.getInt("op_id"));
				opb.setOrderid(r.getInt("order_id"));
				opb.setProductid(r.getInt("productid"));
				opb.setUserOrderid(r.getString("userorder_id"));
				opb.setOrderPlaceDate(r.getString("book_date"));
				opb.setOrderQty(r.getInt("qty"));
				opb.setUserid(r.getInt("user_id"));
				opb.setOrderPrice(r.getInt("productprice"));
				opb.setOrderTotal(r.getInt("totalamt"));
				opb.setPaymnetType(r.getString("paymenttype"));	
				opb.setProductName(r.getString("productname"));
				opb.setProductPhoto1(r.getString("productphoto1"));
				opb.setProductQty1(r.getInt("productqty"));
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
}
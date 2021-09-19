package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.OrderCancelbean;
import connection.Connect;
public class OrderCanceldao 
{
	public static void InsertIntoOrderCancel(OrderCancelbean ocb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into ordercancel_table(op_id,user_id,productid,userorderid,reason,doi,dou,isActive)"+ "values(?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, ocb.getOPid());
			ps.setInt(2, ocb.getUserid());
			ps.setInt(3, ocb.getProductid());
			ps.setString(4, ocb.getUserOrderid());
			ps.setString(5,ocb.getReason());
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
	
	public static int getallCancelOrderByCnt(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM ordercancel_table WHERE user_id= '"+id+"' AND isActive = 1";
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

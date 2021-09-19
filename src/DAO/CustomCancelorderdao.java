package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.CustomCancelOrderbean;
import bean.OrderProductbean;
import connection.Connect;
public class CustomCancelorderdao 
{
	public static void InsertIntoCustomOrderCancel(CustomCancelOrderbean ccob) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into customcancelorder_table(cust_op_id,user_id,customizeprodid,userorderid,pcname,reason,doi,dou,isActive)"+ "values(?,?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, ccob.getCustomOPid());
			ps.setInt(2, ccob.getUserid());
			ps.setInt(3, ccob.getCustomProductid());
			ps.setString(4, ccob.getCustomUserOrderid());
			ps.setString(5,ccob.getPCName());
			ps.setString(6,ccob.getReason());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<CustomCancelOrderbean> getallCustomcancelOrderByUserId(int id) throws SQLException
	{
		List<CustomCancelOrderbean> list =new ArrayList<CustomCancelOrderbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customcancelorder_table INNER JOIN custom_op_table ON customcancelorder_table.`cust_op_id` = custom_op_table.`cust_op_id` INNER JOIN customizeproduct_table ON customcancelorder_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE customcancelorder_table.`user_id`= '"+id+"' AND customcancelorder_table.`isActive`=1;";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomCancelOrderbean ocb = new CustomCancelOrderbean();
				ocb.setCustomOPid(r.getInt("cust_op_id"));
				ocb.setCustomOrderid(r.getInt("custom_order_id"));
				ocb.setCustomProductid(r.getInt("customizeprodid"));
				ocb.setCustomUserOrderid(r.getString("userorderid"));
				ocb.setPCName(r.getString("pcname"));
				ocb.setCustomOrderPlaceDate(r.getString("orderplacedate"));
				ocb.setUserid(r.getInt("user_id"));
				ocb.setCustomProductPrice(r.getInt("price"));
				ocb.setCustomProductName(r.getString("customizeprodname"));
				ocb.setCustomProductPhoto1(r.getString("custprodphoto1"));
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
	
	public static int getallCustomCancelOrderByCnt(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customcancelorder_table WHERE user_id= '"+id+"' AND isActive = 1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				cnt++;
			}
/*			System.out.println("cnt - "+cnt);*/
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
}

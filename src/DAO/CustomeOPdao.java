package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.CustomeOPbean;
import connection.Connect;
public class CustomeOPdao 
{
	public static void InsertIntoCustomeOP(CustomeOPbean cop)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into custom_op_table(custom_order_id,user_id,pcname,customizeprodid,userorderid,orderplacedate,price,paymenttype,isActive)"+ "values(?,?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, cop.getCustomOrderid());
			ps.setInt(2, cop.getUserid());
			ps.setString(3, cop.getPCName());
			ps.setInt(4, cop.getCustomProductid());
			ps.setString(5, cop.getCustomUserOrderid());
			ps.setString(6, cop.getCustomOrderPlaceDate());
			ps.setInt(7, cop.getCustomProductPrice());
			ps.setString(8, cop.getCustomPaymnetType());  
			ps.executeUpdate();
			
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int getallCustomOrderCnt(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM custom_op_table WHERE user_id= '"+id+"' AND isActive = 1";
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
	
	public static List<CustomeOPbean> getallCOPByUserId(int id) throws SQLException
	{
		List<CustomeOPbean> list =new ArrayList<CustomeOPbean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM custom_op_table INNER JOIN customizeproduct_table ON custom_op_table.`customizeprodid` = customizeproduct_table.`customizeprodid` INNER JOIN customize_order_table ON custom_op_table.`custom_order_id` = customize_order_table.`custom_order_id` WHERE custom_op_table.`user_id`='"+id+"' AND custom_op_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomeOPbean opb = new CustomeOPbean();
				opb.setCustomOPid(r.getInt("cust_op_id"));
				opb.setCustomOrderid(r.getInt("custom_order_id"));
				opb.setCustomProductid(r.getInt("customizeprodid"));
				opb.setPCName(r.getString("pcname"));
				opb.setCustomUserOrderid(r.getString("userorderid"));
				opb.setCustomOrderPlaceDate(r.getString("orderplacedate"));
				opb.setUserid(r.getInt("user_id"));
				opb.setCustomOrderPrice(r.getInt("price"));
				opb.setCustomPaymnetType(r.getString("paymenttype"));	
				opb.setCustomProductName(r.getString("customizeprodname"));
				opb.setCustomProductPhoto1(r.getString("custprodphoto1"));
				opb.setCustomProductQty1(r.getInt("custprodqty"));
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

	public static List<CustomeOPbean> getallOPByUserOrderId(String ouid) 
	{		
		List<CustomeOPbean> list =new ArrayList<CustomeOPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM custom_op_table INNER JOIN customizeproduct_table ON custom_op_table.`customizeprodid` = customizeproduct_table.`customizeprodid` INNER JOIN customize_order_table ON custom_op_table.`custom_order_id` = customize_order_table.`custom_order_id` WHERE custom_op_table.`userorderid`='"+ouid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomeOPbean opb = new CustomeOPbean();
				opb.setCustomOPid(r.getInt("cust_op_id"));
				opb.setCustomProductid(r.getInt("customizeprodid"));
				opb.setCustomUserOrderid(r.getString("userorderid"));
				opb.setCustomProductQty1(r.getInt("custprodqty"));
				opb.setPCName(r.getString("pcname"));
				
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
			String query="update custom_op_table set isActive=0 where cust_op_id=? AND userorderid=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,opid);
			ps.setString(2,ouid);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	public static List<CustomeOPbean> getallCOP() throws SQLException
	{
		List<CustomeOPbean> list =new ArrayList<CustomeOPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM custom_op_table INNER JOIN customizeproduct_table ON custom_op_table.`customizeprodid` = customizeproduct_table.`customizeprodid` INNER JOIN customize_order_table ON custom_op_table.`custom_order_id` = customize_order_table.`custom_order_id` WHERE custom_op_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomeOPbean opb = new CustomeOPbean();
				opb.setCustomOPid(r.getInt("cust_op_id"));
				opb.setCustomOrderid(r.getInt("custom_order_id"));
				opb.setCustomProductid(r.getInt("customizeprodid"));
				opb.setPCName(r.getString("pcname"));
				opb.setCustomUserOrderid(r.getString("userorderid"));
				opb.setCustomOrderPlaceDate(r.getString("orderplacedate"));
				opb.setUserid(r.getInt("user_id"));
				opb.setUsername(r.getString("user_name"));
				opb.setMail(r.getString("email"));
				opb.setCustomOrderPrice(r.getInt("price"));				
				opb.setCustomPaymnetType(r.getString("paymenttype"));	
				opb.setCustomProductName(r.getString("customizeprodname"));
				opb.setCustomProductPhoto1(r.getString("custprodphoto1"));
				opb.setCustomProductQty1(r.getInt("custprodqty"));
				opb.setAddress(r.getString("address"));
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
			String query="update custom_op_table set isActive=0 where cust_op_id=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
			con.close();
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
			String query ="SELECT * FROM custom_op_table WHERE  isActive = 1";
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
	
	public static List<CustomeOPbean> getallCOPByUserId1(int id,String pnm) throws SQLException
	{
		List<CustomeOPbean> list =new ArrayList<CustomeOPbean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM custom_op_table INNER JOIN customizeproduct_table ON custom_op_table.`customizeprodid` = customizeproduct_table.`customizeprodid` INNER JOIN customize_order_table ON custom_op_table.`custom_order_id` = customize_order_table.`custom_order_id` WHERE custom_op_table.`pcname` = '"+pnm+"' AND custom_op_table.`user_id`='"+id+"' AND custom_op_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomeOPbean opb = new CustomeOPbean();
				opb.setCustomOPid(r.getInt("cust_op_id"));
				opb.setCustomOrderid(r.getInt("custom_order_id"));
				opb.setCustomProductid(r.getInt("customizeprodid"));
				opb.setPCName(r.getString("pcname"));
				opb.setCustomUserOrderid(r.getString("userorderid"));
				opb.setCustomOrderPlaceDate(r.getString("orderplacedate"));
				opb.setUserid(r.getInt("user_id"));
				opb.setCustomOrderPrice(r.getInt("price"));
				opb.setCustomPaymnetType(r.getString("paymenttype"));	
				opb.setCustomProductName(r.getString("customizeprodname"));
				opb.setCustomProductPhoto1(r.getString("custprodphoto1"));
				opb.setCustomProductQty1(r.getInt("custprodqty"));
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

	public static List<CustomeOPbean> getallCOPByUserIdForStatus(int id) throws SQLException
	{
		List<CustomeOPbean> list =new ArrayList<CustomeOPbean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="SELECT * FROM custom_op_table INNER JOIN customizeproduct_table ON custom_op_table.`customizeprodid` = customizeproduct_table.`customizeprodid` INNER JOIN customize_order_table ON custom_op_table.`custom_order_id` = customize_order_table.`custom_order_id` WHERE custom_op_table.`user_id`='"+id+"' AND custom_op_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomeOPbean opb = new CustomeOPbean();
				opb.setCustomOPid(r.getInt("cust_op_id"));
				opb.setCustomOrderid(r.getInt("custom_order_id"));
				opb.setCustomProductid(r.getInt("customizeprodid"));
				opb.setPCName(r.getString("pcname"));
				opb.setCustomUserOrderid(r.getString("userorderid"));
				opb.setCustomOrderPlaceDate(r.getString("orderplacedate"));
				opb.setUserid(r.getInt("user_id"));
				opb.setCustomOrderPrice(r.getInt("price"));
				opb.setCustomPaymnetType(r.getString("paymenttype"));	
				opb.setCustomProductName(r.getString("customizeprodname"));
				opb.setCustomProductPhoto1(r.getString("custprodphoto1"));
				opb.setCustomProductQty1(r.getInt("custprodqty"));
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
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.ORPbean;
import connection.Connect;
public class ORPdao 
{
	public static void InsertIntoORP(ORPbean orp)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into orp_table(rentorder_id,user_id,rentprodid,urorder_id,start_date,end_date,price,qty,duration,total,paymenttype,isActive)"+ "values(?,?,?,?,?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, orp.getRentOrderId());
			ps.setInt(2, orp.getUserid());
			ps.setInt(3, orp.getRentProid());
			ps.setString(4, orp.getUserRentOrderid());
			ps.setString(5, orp.getBookDate());
			ps.setString(6,orp.getEndDate());
			ps.setInt(7, orp.getPrice());
			ps.setInt(8, orp.getQuantity());
			ps.setInt(9, orp.getDuration());
			ps.setInt(10, orp.getOrderTotal());
			ps.setString(11, orp.getPaymnetType());  
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void CancelRentOrder(int orpid,String ouid) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update orp_table set isActive=0 where orp_id=? AND urorder_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,orpid);
			ps.setString(2,ouid);
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
			String query ="SELECT * FROM orp_table WHERE  isActive = 1";
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
	
	public static List<ORPbean> getallORPByUserId(int id) throws SQLException
	{
		List<ORPbean> list =new ArrayList<ORPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orp_table INNER JOIN rentproduct_table ON orp_table.`rentprodid` = rentproduct_table.`rentprodid` INNER JOIN rentorder_table ON orp_table.`rentorder_id` = rentorder_table.`rentorder_id` WHERE orp_table.`user_id`='"+id+"' AND orp_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPbean orp = new ORPbean();
				orp.setORPid(r.getInt("orp_id"));
				orp.setRentOrderId(r.getInt("rentorder_id"));
				orp.setUserid(r.getInt("user_id"));
				orp.setRentProid(r.getInt("rentprodid"));
				orp.setUserRentOrderid(r.getString("urorder_id"));
				orp.setBookDate(r.getString("start_date"));
				orp.setEndDate(r.getString("end_date"));
				orp.setPrice(r.getInt("price"));
				orp.setQuantity(r.getInt("qty"));
				orp.setDuration(r.getInt("duration"));				
				orp.setOrderTotal(r.getInt("total"));
				orp.setPaymnetType(r.getString("paymenttype"));	
				orp.setRentProName(r.getString("rentprodname"));
				orp.setRentProPhoto1(r.getString("rentprodphoto1"));
				list.add(orp);				
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
	
	
	public static List<ORPbean> getallORPByUserId1(int id) throws SQLException
	{
		List<ORPbean> list =new ArrayList<ORPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orp_table INNER JOIN rentproduct_table ON orp_table.`rentprodid` = rentproduct_table.`rentprodid` INNER JOIN rentorder_table ON orp_table.`rentorder_id` = rentorder_table.`rentorder_id` WHERE orp_table.`user_id`='"+id+"' AND orp_table.`isActive`=0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPbean orp = new ORPbean();
				orp.setORPid(r.getInt("orp_id"));
				orp.setRentOrderId(r.getInt("rentorder_id"));
				orp.setUserid(r.getInt("user_id"));
				orp.setRentProid(r.getInt("rentprodid"));
				orp.setUserRentOrderid(r.getString("urorder_id"));
				orp.setBookDate(r.getString("start_date"));
				orp.setEndDate(r.getString("end_date"));
				orp.setPrice(r.getInt("price"));
				orp.setQuantity(r.getInt("qty"));
				orp.setDuration(r.getInt("duration"));				
				orp.setOrderTotal(r.getInt("total"));
				orp.setPaymnetType(r.getString("paymenttype"));	
				orp.setRentProName(r.getString("rentprodname"));
				orp.setRentProPhoto1(r.getString("rentprodphoto1"));
				list.add(orp);
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
	
	public static List<ORPbean> getallORPByUserOrderId(String ouid) 
	{		
		List<ORPbean> list =new ArrayList<ORPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orp_table INNER JOIN rentproduct_table ON orp_table.`rentprodid` = rentproduct_table.`rentprodid` WHERE urorder_id='"+ouid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPbean orp = new ORPbean();
				orp.setORPid(r.getInt("orp_id"));
				orp.setRentProid(r.getInt("rentprodid"));
				orp.setUserRentOrderid(r.getString("urorder_id"));
				orp.setQuantity(r.getInt("qty"));
				orp.setProductQty1(r.getInt("rentprodqty"));
				list.add(orp);
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
	
	public static int getallRentOrderCnt(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orp_table WHERE user_id= '"+id+"' AND isActive = 1";
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
	
	public static List<ORPbean> getallORP() throws SQLException
	{
		List<ORPbean> list =new ArrayList<ORPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orp_table INNER JOIN user_table ON orp_table.`user_id` = user_table.`user_id` INNER JOIN rentproduct_table ON orp_table.`rentprodid` = rentproduct_table.`rentprodid` INNER JOIN rentorder_table ON orp_table.`rentorder_id` = rentorder_table.`rentorder_id` WHERE orp_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPbean orp = new ORPbean();
				orp.setORPid(r.getInt("orp_id"));
				orp.setRentOrderId(r.getInt("rentorder_id"));
				orp.setUserid(r.getInt("user_id"));
				orp.setUsername(r.getString("user_name"));
				orp.setRentProid(r.getInt("rentprodid"));
				orp.setUserRentOrderid(r.getString("urorder_id"));
				orp.setBookDate(r.getString("start_date"));
				orp.setEndDate(r.getString("end_date"));
				orp.setPrice(r.getInt("price"));
				orp.setQuantity(r.getInt("qty"));
				orp.setDuration(r.getInt("duration"));				
				orp.setOrderTotal(r.getInt("total"));
				orp.setPaymnetType(r.getString("paymenttype"));	
				orp.setRentProName(r.getString("rentprodname"));
				orp.setRentProPhoto1(r.getString("rentprodphoto1"));
				orp.setMail(r.getString("email"));
				orp.setAddress(r.getString("address"));
				list.add(orp);
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
	
	public static List<ORPbean> getallORPByUserIdForStatus(int id) throws SQLException
	{
		List<ORPbean> list =new ArrayList<ORPbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM orp_table INNER JOIN rentproduct_table ON orp_table.`rentprodid` = rentproduct_table.`rentprodid` INNER JOIN rentorder_table ON orp_table.`rentorder_id` = rentorder_table.`rentorder_id` WHERE orp_table.`isActive` =1 AND orp_table.`user_id` = '"+id+"' ORDER BY orp_id DESC LIMIT 1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				ORPbean orp = new ORPbean();
				orp.setORPid(r.getInt("orp_id"));
				orp.setRentOrderId(r.getInt("rentorder_id"));
				orp.setUserid(r.getInt("user_id"));
				orp.setRentProid(r.getInt("rentprodid"));
				orp.setUserRentOrderid(r.getString("urorder_id"));
				orp.setBookDate(r.getString("start_date"));
				orp.setEndDate(r.getString("end_date"));
				orp.setPrice(r.getInt("price"));
				orp.setQuantity(r.getInt("qty"));
				orp.setDuration(r.getInt("duration"));				
				orp.setOrderTotal(r.getInt("total"));
				orp.setPaymnetType(r.getString("paymenttype"));	
				orp.setRentProName(r.getString("rentprodname"));
				orp.setRentProPhoto1(r.getString("rentprodphoto1"));
				list.add(orp);				
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
	
	public void deleteRentOrder(int id)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update orp_table set isActive=0 where orp_id=?";
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
}

package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.CustomOrderBean;
import connection.Connect;
public class CustOrderdao
{
	public static void insertCustOrder(CustomOrderBean custorder) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into customize_order_table(list_id,customizeprodid,pcname,custprodprice,custproqty,total_amt,book_date,user_id,user_name,email,mobile_no,address,isActive,doi,dou)"+ "values(?,?,?,?,?,?,'"+dtf.format(now)+"',?,?,?,?,?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, custorder.getList_id());
			ps.setInt(2, custorder.getCustomizeprodid());
			ps.setString(3, custorder.getPCName());
			ps.setInt(4, custorder.getCustproprice());
			ps.setInt(5,custorder.getQuantity());
			ps.setInt(6, custorder.getTotalprice());
			ps.setInt(7, custorder.getUser_id());
			ps.setString(8, custorder.getUnm());
			ps.setString(9, custorder.getMail());
			ps.setString(10, custorder.getMobile());
			ps.setString(11, custorder.getAdd());	  
			ps.executeUpdate();			
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	public void UpdateQuantity(CustomOrderBean custOrder) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update customize_order_table set custproqty=? where custom_order_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,custOrder.getQuantity());
			ps.setInt(2, custOrder.getCustorderid());
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	public void updateOrderInfo(CustomOrderBean custOrder) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update customize_order_table set user_name=?, email=?, mobile_no=?, address=? where user_id=? ";
			PreparedStatement ps= cn.prepareStatement(query);
			ps.setString(1,custOrder.getUnm());
			ps.setString(2,custOrder.getMail());
			ps.setString(3,custOrder.getMobile());
			ps.setString(4,custOrder.getAdd());
			ps.setInt(5,custOrder.getUser_id());		
		 	ps.executeUpdate();
		 	ps.close();
		 	cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void deleteCustOrderItem(int id) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update customize_order_table set isActive=0 where custom_order_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,id);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}
	
	public void deleteOrder() 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="delete from customize_order_table";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}

	public static List<CustomOrderBean> getLastProducts(int id) throws SQLException
	{
		List<CustomOrderBean> list =new ArrayList<CustomOrderBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customize_order_table INNER JOIN customizeproduct_table ON customize_order_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id= '"+id+"' AND customize_order_table.`isActive`=1 ORDER BY `custom_order_id` DESC LIMIT 1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOrderBean cob = new CustomOrderBean();
				cob.setCustorderid(r.getInt("custom_order_id"));
				cob.setList_id(r.getInt("list_id"));
				cob.setCustomizeprodid(r.getInt("customizeprodid"));
				cob.setPCName(r.getString("pcname"));
				cob.setProname(r.getString("customizeprodname"));
				cob.setProphoto1(r.getString("custprodphoto1"));
				cob.setCustmaincatid(r.getInt("custmaincatid"));
				cob.setQuantity(r.getInt("custproqty"));
				cob.setTotalQty(r.getInt("custprodqty"));
				cob.setBook_date(r.getString("book_date"));
				cob.setCustproprice(r.getInt("custprodprice"));
				cob.setTotalprice(r.getInt("total_amt"));
				cob.setUser_id(r.getInt("user_id"));
				cob.setUnm(r.getString("user_name"));
				cob.setMail(r.getString("email"));
				cob.setMobile(r.getString("mobile_no"));
				cob.setAdd(r.getString("address"));				
				list.add(cob);
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
	
	public static List<CustomOrderBean> getallOrdersByUserId(int id) throws SQLException
	{
		List<CustomOrderBean> list =new ArrayList<CustomOrderBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customize_order_table INNER JOIN customizeproduct_table ON customize_order_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id= '"+id+"' AND customize_order_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOrderBean cob = new CustomOrderBean();
				cob.setCustorderid(r.getInt("custom_order_id"));
				cob.setList_id(r.getInt("list_id"));
				cob.setCustomizeprodid(r.getInt("customizeprodid"));
				cob.setPCName(r.getString("pcname"));
				cob.setProname(r.getString("customizeprodname"));
				cob.setProphoto1(r.getString("custprodphoto1"));
				cob.setCustmaincatid(r.getInt("custmaincatid"));
				cob.setQuantity(r.getInt("custproqty"));
				cob.setTotalQty(r.getInt("custprodqty"));
				cob.setBook_date(r.getString("book_date"));
				cob.setCustproprice(r.getInt("custprodprice"));
				cob.setTotalprice(r.getInt("total_amt"));
				cob.setUser_id(r.getInt("user_id"));
				cob.setUnm(r.getString("user_name"));
				cob.setMail(r.getString("email"));
				cob.setMobile(r.getString("mobile_no"));
				cob.setAdd(r.getString("address"));				
				list.add(cob);
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
	
	public static CustomOrderBean getCustOrderByUserId(int uid)
	{
		CustomOrderBean cob=new CustomOrderBean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from customize_order_table where user_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,uid);
			ResultSet r=ps.executeQuery();
			if(r.next())
			{
				cob.setCustorderid(r.getInt("custom_order_id"));
				cob.setList_id(r.getInt("list_id"));
				cob.setCustomizeprodid(r.getInt("customizeprodid"));
				cob.setPCName(r.getString("pcname"));
				cob.setCustproprice(r.getInt("custprodprice"));
				cob.setQuantity(r.getInt("custproqty"));
				cob.setTotalprice(r.getInt("total_amt"));
				cob.setBook_date(r.getString("book_date"));
				cob.setUser_id(r.getInt("user_id"));
				cob.setUnm(r.getString("user_name"));
				cob.setMail(r.getString("email"));
				cob.setMobile(r.getString("mobile_no"));
				cob.setAdd(r.getString("address"));		
			}
			else
			{
				cob=null;
			}
			r.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cob;
	}
	
	public static List<CustomOrderBean> getallOrdersForView(int id) throws SQLException
	{
		List<CustomOrderBean> list =new ArrayList<CustomOrderBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customize_order_table INNER JOIN customizeproduct_table ON customize_order_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id= '"+id+"' AND customize_order_table.`isActive`=0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOrderBean cob = new CustomOrderBean();
				cob.setCustorderid(r.getInt("custom_order_id"));
				cob.setList_id(r.getInt("list_id"));
				cob.setCustomizeprodid(r.getInt("customizeprodid"));
				cob.setPCName(r.getString("pcname"));
				cob.setProname(r.getString("customizeprodname"));
				cob.setProphoto1(r.getString("custprodphoto1"));
				cob.setCustmaincatid(r.getInt("custmaincatid"));
				cob.setQuantity(r.getInt("custproqty"));
				cob.setTotalQty(r.getInt("custprodqty"));
				cob.setBook_date(r.getString("book_date"));
				cob.setCustproprice(r.getInt("custprodprice"));
				cob.setTotalprice(r.getInt("total_amt"));
				cob.setUser_id(r.getInt("user_id"));
				cob.setUnm(r.getString("user_name"));
				cob.setMail(r.getString("email"));
				cob.setMobile(r.getString("mobile_no"));
				cob.setAdd(r.getString("address"));				
				list.add(cob);
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

	public static void deleteItem()
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="delete from customize_order_table where isActive = 1";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static boolean CheckItem() 
	{
		try 
		{
			Connection cn = Connect.sqlconnection();
			String query = "SELECT * FROM customize_order_table WHERE isActive = 1";
			PreparedStatement ps = cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return true ; 
			}
			rs.close();
			ps.close();							
			cn.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	
	public static List<CustomOrderBean> getCategories1(int id,String pnm) throws SQLException
	{
		List<CustomOrderBean> list =new ArrayList<CustomOrderBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customize_order_table INNER JOIN customizeproduct_table ON customize_order_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id= '"+id+"'AND pcname = '"+pnm+"' AND customize_order_table.`isActive`=0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOrderBean cob = new CustomOrderBean();
				cob.setCustorderid(r.getInt("custom_order_id"));
				cob.setList_id(r.getInt("list_id"));
				cob.setCustomizeprodid(r.getInt("customizeprodid"));
				cob.setPCName(r.getString("pcname"));
				cob.setProname(r.getString("customizeprodname"));
				cob.setProphoto1(r.getString("custprodphoto1"));
				cob.setCustmaincatid(r.getInt("custmaincatid"));
				cob.setQuantity(r.getInt("custproqty"));
				cob.setTotalQty(r.getInt("custprodqty"));
				cob.setBook_date(r.getString("book_date"));
				cob.setCustproprice(r.getInt("custprodprice"));
				cob.setTotalprice(r.getInt("total_amt"));
				cob.setUser_id(r.getInt("user_id"));
				cob.setUnm(r.getString("user_name"));
				cob.setMail(r.getString("email"));
				cob.setMobile(r.getString("mobile_no"));
				cob.setAdd(r.getString("address"));				
				list.add(cob);
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
	
	
	public static List<CustomOrderBean> getAllOrdersPCName() throws SQLException
	{
		List<CustomOrderBean> list =new ArrayList<CustomOrderBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customize_order_table";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOrderBean cob = new CustomOrderBean();
				cob.setPCName(r.getString("pcname"));
				list.add(cob);
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
	
	public static List<CustomOrderBean> getCategories(int id,String pnm) throws SQLException
	{
		List<CustomOrderBean> list =new ArrayList<CustomOrderBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customize_order_table INNER JOIN customizeproduct_table ON customize_order_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id= '"+id+"'AND pcname = '"+pnm+"' AND customize_order_table.`isActive`=0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustomOrderBean cob = new CustomOrderBean();
				cob.setCustorderid(r.getInt("custom_order_id"));
				cob.setList_id(r.getInt("list_id"));
				cob.setCustomizeprodid(r.getInt("customizeprodid"));
				cob.setPCName(r.getString("pcname"));
				cob.setProname(r.getString("customizeprodname"));
				cob.setProphoto1(r.getString("custprodphoto1"));
				cob.setCustmaincatid(r.getInt("custmaincatid"));
				cob.setQuantity(r.getInt("custproqty"));
				cob.setTotalQty(r.getInt("custprodqty"));
				cob.setBook_date(r.getString("book_date"));
				cob.setCustproprice(r.getInt("custprodprice"));
				cob.setTotalprice(r.getInt("total_amt"));
				cob.setUser_id(r.getInt("user_id"));
				cob.setUnm(r.getString("user_name"));
				cob.setMail(r.getString("email"));
				cob.setMobile(r.getString("mobile_no"));
				cob.setAdd(r.getString("address"));				
				list.add(cob);
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
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Orderbean;
import connection.Connect;
public class Orderdao 
{
	public static void insertOrder(Orderbean order)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into order_table(cart_id,productid,productprice,proqty,totalamt,book_date,user_id,user_name,email,mobile_no,address,isActive,doi,dou)"+ "values(?,?,?,?,?,'"+dtf.format(now)+"',?,?,?,?,?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, order.getCartid());
			ps.setInt(2, order.getProductid());
			ps.setInt(3, order.getProductPrice());
			ps.setInt(4,order.getProductQty());
			ps.setInt(5, order.getProductTotalPrice());
			ps.setInt(6, order.getUserid());
			ps.setString(7, order.getUsername());
			ps.setString(8, order.getMail());
			ps.setString(9, order.getMobnum());
			ps.setString(10, order.getAdd());	  
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void UpdateQuantity(Orderbean ob)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update order_table set proqty=? where order_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,ob.getProductQty());
			ps.setInt(2, ob.getOrderid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}	
	
	public static List<Orderbean> getallOrdersByUserId(int id) throws SQLException
	{
		List<Orderbean> list =new ArrayList<Orderbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM order_table INNER JOIN product_table ON order_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND order_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Orderbean ob = new Orderbean();
				ob.setOrderid(r.getInt("order_id"));
				ob.setCartid(r.getInt("cart_id"));
				ob.setProductid(r.getInt("productid"));
				ob.setProductName(r.getString("productname"));
				ob.setProductPhoto1(r.getString("productphoto1"));
				ob.setProductQty(r.getInt("proqty"));
				ob.setProductQty1(r.getInt("productqty"));
				ob.setBookdate(r.getString("book_date"));
				ob.setProductPrice(r.getInt("productprice"));
				ob.setProductTotalPrice(r.getInt("totalamt"));
				ob.setUserid(r.getInt("user_id"));
				ob.setUsername(r.getString("user_name"));
				ob.setMail(r.getString("email"));
				ob.setMobnum(r.getString("mobile_no"));
				ob.setAdd(r.getString("address"));				
				list.add(ob);
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

	public static List<Orderbean> getallOrderItemsByUserId(int id) throws SQLException
	{
		List<Orderbean> list =new ArrayList<Orderbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM order_table INNER JOIN product_table ON order_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND order_table.`isActive`=0";	
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Orderbean ob = new Orderbean();
				ob.setOrderid(r.getInt("order_id"));
				ob.setCartid(r.getInt("cart_id"));
				ob.setProductid(r.getInt("productid"));
				ob.setProductName(r.getString("productname"));
				ob.setProductPhoto1(r.getString("productphoto1"));
				ob.setProductQty(r.getInt("proqty"));
				ob.setProductPrice(r.getInt("productprice"));
				ob.setProductTotalPrice(r.getInt("totalamt"));
				ob.setUserid(r.getInt("user_id"));
				ob.setUsername(r.getString("user_name"));
				ob.setMail(r.getString("email"));
				ob.setMobnum(r.getString("mobile_no"));
				ob.setAdd(r.getString("address"));
				ob.setBookdate(r.getString("book_date"));
				list.add(ob);
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
	
	
	public void deleteOrderItem(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update order_table set isActive=0 where order_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,id);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/*public static String getLastOrderId(int id)
	{
		String data = "";
		DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd"); 
		LocalDateTime cur_date = LocalDateTime.now();
		try
		{
			Orderbean ob = new Orderbean();
			Connection cn=Connect.sqlconnection();
			String query ="SELECT * FROM order_table INNER JOIN product_table ON order_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND order_table.`isActive`=1";
			//String query ="SELECT * FROM order_table INNER JOIN product_table ON order_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND order_table.`book_date`='"+cur_date+"'";
			//String query="SELECT * FROM order_table WHERE book_date ='"+cur_date+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet r=ps.executeQuery();			
			if(r.next())
			{
				ob.setOrderid(r.getInt("order_id"));
				int oid = ob.getOrderid();
				ob.setProductid(r.getInt("productid"));
				int pid= ob.getProductid();
				ob.setBookdate(r.getString("book_date"));
				String date = ob.getBookdate();
				ob.setProductQty(r.getInt("proqty"));
				int qty = ob.getProductQty();
				ob.setProductPrice(r.getInt("productprice"));
				int price = ob.getProductPrice();
				ob.setProductTotalPrice(r.getInt("totalamt"));
				int total = ob.getProductTotalPrice();
				 data += oid +" " + pid +" " + date + " "+qty+ " "+price +" "+total;
			//	
			}
			return data;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return data;
	}*/
	public static List<Orderbean> getOrderListByUserId(int id)
	{
		Orderbean ob = new Orderbean();
		Connection con=Connect.sqlconnection();
		List<Orderbean> list =new ArrayList<Orderbean>();
		try
		{
			String query="SELECT * FROM order_table INNER JOIN product_table ON order_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND order_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();	
			while(r.next())
			{
				ob.setOrderid(r.getInt("order_id"));
				ob.setProductid(r.getInt("productid"));
				ob.setBookdate(r.getString("book_date"));
				ob.setProductQty(r.getInt("proqty"));
				ob.setProductPrice(r.getInt("productprice"));
				ob.setProductTotalPrice(r.getInt("totalamt"));
				list.add(ob);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public static Orderbean getOrderById(int id)
	{
		Orderbean ob=new Orderbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from order_table where order_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet r=ps.executeQuery();
			if(r.next())
			{
				ob.setOrderid(r.getInt("order_id"));
				ob.setCartid(r.getInt("cart_id"));
				ob.setProductid(r.getInt("productid"));
				ob.setProductQty(r.getInt("proqty"));
				ob.setProductPrice(r.getInt("productprice"));
				ob.setProductTotalPrice(r.getInt("totalamt"));
				ob.setUserid(r.getInt("user_id"));
				ob.setUsername(r.getString("user_name"));
				ob.setMail(r.getString("email"));
				ob.setMobnum(r.getString("mobile_no"));
				ob.setAdd(r.getString("address"));
			}
			else
			{
				ob=null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ob;
	}	
	
	public static Orderbean getOrderByUserId(int uid)
	{
		Orderbean ob=new Orderbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from order_table where user_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,uid);
			ResultSet r=ps.executeQuery();
			if(r.next())
			{
				ob.setOrderid(r.getInt("order_id"));
				ob.setCartid(r.getInt("cart_id"));
				ob.setProductid(r.getInt("productid"));
				ob.setProductPrice(r.getInt("productprice"));
				ob.setProductQty(r.getInt("proqty"));
				ob.setProductTotalPrice(r.getInt("totalamt"));
				ob.setUserid(r.getInt("user_id"));
				ob.setUsername(r.getString("user_name"));
				ob.setMail(r.getString("email"));
				ob.setMobnum(r.getString("mobile_no"));
				ob.setAdd(r.getString("address"));
			}
			else
			{
				ob=null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ob;
	}

	public void updateOrderInfo(Orderbean ob)
	{
		try
		{
			Connection cn=Connect.sqlconnection();/* email=?,*/
			String query="update order_table set user_name=?, mobile_no=?, address=? where user_id=? ";//AND user_id=?";
			PreparedStatement ps= cn.prepareStatement(query);
			ps.setString(1,ob.getUsername());
			/*ps.setString(2,ob.getMail());*/
			ps.setString(2,ob.getMobnum());
			ps.setString(3,ob.getAdd());
			ps.setInt(4,ob.getUserid());		
		 	ps.executeUpdate();
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
			String query = "SELECT * FROM order_table WHERE isActive = 1";
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

	public static void deleteItem() 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="delete from order_table where isActive = 1";
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

	public static int getTotalItem() 
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM order_table WHERE isActive = 1";
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
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Cartbean;
import connection.Connect;
public class Cartdao 
{
	public static void insertCart(Cartbean cart)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf1=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now1 = LocalDateTime.now();
			String query="insert into cart_table(productid,qty,email,user_id,isActive,doi,dou) values(?,?,?,?,1,'"+dtf1.format(now1)+"','"+dtf1.format(now1)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, cart.getProductid());
			ps.setInt(2, cart.getProductQty());			
			ps.setString(3, cart.getMail());
			ps.setInt(4, cart.getUserid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 
	
	public List<Cartbean> getallCartValues() throws SQLException
	{
		List<Cartbean> list =new ArrayList<Cartbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM cart_table INNER JOIN user_table ON cart_table.`user_id` = user_table.`user_id`INNER JOIN product_table ON cart_table.`productid` = product_table.`productid` WHERE cart_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Cartbean cb = new Cartbean();
				cb.setCartid(r.getInt("cart_id"));
				cb.setUsername(r.getString("user_name"));
				cb.setProductPhoto1(r.getString("productphoto1"));
				cb.setProductName(r.getString("productname"));
				cb.setProductSpecification1(r.getString("productspecification"));
				cb.setProductPrice(r.getInt("productprice"));
				cb.setProductQty(r.getInt("qty"));		
				cb.setProductQty1(r.getInt("productqty"));
				list.add(cb);
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
	public void deleteCartItem(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update cart_table set isActive=0 where cart_id=?";
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

	
	public void deleteCartItemByCheckout(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			//String query="delete * FROM cart_table WHERE user_id=? AND cart_id=? AND cart_table.`isActive`=1";
			String query="update cart_table set isActive=0 where cart_id=?";			
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
	
	public void deleteCartItemByReOrder(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();				
			String query="update cart_table set isActive=0 where cart_id=?";			
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
	public void deleteCartItemByUserID(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="delete from cart_table where cart_id = ?";
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
	public void UpdateQuantity(Cartbean cb)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update cart_table set qty=? where productid=?";  //,subtotal=?,maintotal=?
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,cb.getProductQty());	
			ps.setInt(2,cb.getProductid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}		
	public void UpdateQuantity1(Cartbean cb) //FOR DUPLICATE ITEM INTO CART UPDATE QUANTITY BY ONE
	{
		try
		{
			int q1 =cb.getProductQty();
			Connection cn= Connect.sqlconnection();		
			String query="update cart_table set qty= '"+q1+"' + ? where productid=? ";
			//String query="update cart_table set qty=?+1 where productid=?";  //,subtotal=?,maintotal=?
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,cb.getProductQty());
			ps.setInt(2, cb.getProductid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<Cartbean> getCartListByUserId(int id)
	{
		
		List<Cartbean> list =new ArrayList<Cartbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM cart_table INNER JOIN product_table ON cart_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND cart_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			while(rs.next())
			{
				Cartbean cb = new Cartbean();
				cb.setCartid(rs.getInt("cart_id"));
				cb.setUserid(rs.getInt("user_id"));
				cb.setProductid(rs.getInt("productid"));
				cb.setProductName(rs.getString("productname"));
				cb.setProductPhoto1(rs.getString("productphoto1"));
				cb.setProductPrice(rs.getInt("productprice"));
				cb.setProductSpecification1(rs.getString("productspecification"));
				cb.setProductQty(rs.getInt("qty"));
				cb.setProductQty1(rs.getInt("productqty"));
				//cb.setMail(rs.getString("email"));
				list.add(cb);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
		return list;
	}

	public static boolean CntCartValues() throws SQLException
	{	
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="select * from cart_table where isActive=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{		
				return true;
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}

	public static int getCount(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM cart_table WHERE user_id= '"+id+"' AND isActive = 1";
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

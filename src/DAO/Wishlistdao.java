package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Wishlistbean;
import connection.Connect;
public class Wishlistdao 
{

	public void insertwishlist(Wishlistbean wb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into wishlist_table(user_id,productid,is_Active,doi,dou) values(?,?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, wb.getUserid());
			ps.setInt(2, wb.getProductid());
			/*ps.setString(2, wb.getWish
			 * listColor());*/
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public List<Wishlistbean> getallWishlistValues() throws SQLException
	{
		List<Wishlistbean> list =new ArrayList<Wishlistbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			//String query ="select * from cart_table where isActive=1";
			String query ="SELECT * FROM wishlist_table INNER JOIN product_table ON wishlist_table.`productid` = product_table.`productid` WHERE wishlist_table.`is_Active`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Wishlistbean wb = new Wishlistbean();
				wb.setWishlist_id(r.getInt("wishlist_id"));
				wb.setUserid(r.getInt("user_id"));
				wb.setProductPhoto1(r.getString("productphoto1"));
				wb.setProductname(r.getString("proname"));
				wb.setProprice(r.getInt("proprice"));
				list.add(wb);
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
	
	public static List<Wishlistbean> getWishListByUserId(int id)
	{
		Connection con=Connect.sqlconnection();
		List<Wishlistbean> list =new ArrayList<Wishlistbean>();
		try
		{
			String query ="SELECT * FROM wishlist_table INNER JOIN product_table ON wishlist_table.`productid` = product_table.`productid` WHERE user_id='"+id+"' AND wishlist_table.`is_Active`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();	
			while(r.next())
			{
				Wishlistbean wb = new Wishlistbean();
				wb.setWishlist_id(r.getInt("wishlist_id"));
				wb.setUserid(r.getInt("user_id"));
				wb.setProductid(r.getInt("productid"));
				wb.setProductPhoto1(r.getString("productphoto1"));
				wb.setProductName(r.getString("productname"));
				wb.setProductDescription(r.getString("productdescription"));		
				wb.setProductPrice(r.getInt("productprice"));			
				list.add(wb);
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
	public void deleteWishlistItem(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="delete from wishlist_table where wishlist_id=?";
			//String query="update wishlist_table set is_Active=0 where wishlist_id=?";
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
	
	public void deleteWishlistItem1(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="delete from wishlist_table where productid=?";
		//	String query="update wishlist_table set is_Active=0 where productid=?";
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
	
	public static int getCount(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM wishlist_table WHERE user_id= '"+id+"' AND is_Active = 1";
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
	
	public static boolean getWishListByProUserId(int pid,int uid) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();
		query="SELECT * FROM wishlist_table WHERE productid='"+pid+"' AND user_id='"+uid+"'";
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

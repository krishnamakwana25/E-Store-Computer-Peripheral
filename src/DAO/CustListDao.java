package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.CustomListBean;
import connection.Connect;
public class CustListDao 
{
	public static void insertCustList(CustomListBean custlist) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf1=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now1 = LocalDateTime.now();
			String query="insert into custom_list_table(customizeprodid,qty,email,user_id,isActive,doi,dou) values(?,?,?,?,1,'"+dtf1.format(now1)+"','"+dtf1.format(now1)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, custlist.getCustomizeprodid());
			ps.setInt(2, custlist.getQty());			
			ps.setString(3, custlist.getEmail());
			ps.setInt(4, custlist.getUser_id());
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<CustomListBean> getCustListByUserId(int checkid) 
	{		
		Connection con=Connect.sqlconnection();
		List<CustomListBean> list =new ArrayList<CustomListBean>();
		try
		{
			String query="SELECT * FROM custom_list_table INNER JOIN customizeproduct_table ON custom_list_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id='"+checkid+"' AND custom_list_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			while(rs.next())
			{
				CustomListBean clb = new CustomListBean();
				clb.setList_id(rs.getInt("list_id"));
				clb.setUser_id(rs.getInt("user_id"));
				clb.setCustomizeprodid(rs.getInt("customizeprodid"));
				clb.setCustmaincatid(rs.getInt("custmaincatid"));
				clb.setProname(rs.getString("customizeprodname"));
				clb.setProphoto1(rs.getString("custprodphoto1"));
				clb.setCustproprice(rs.getInt("custprodprice"));
				clb.setProspecification(rs.getString("custprodspecification"));
				clb.setQty(rs.getInt("qty"));
				list.add(clb);
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public void UpdateQuantity1(CustomListBean cl2) 
	{		
		try
		{
			int q1 =cl2.getQty();
			Connection cn= Connect.sqlconnection();		
			String query="update custom_list_table set qty= '"+q1+"' + ? where customizeprodid=? ";			
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,cl2.getQty());
			ps.setInt(2,cl2.getCustomizeprodid());
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}

	public void deleteCustListItemByReOrder(int custorderid) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();		
			//String query="delete * FROM cart_table WHERE user_id=? AND cart_id=? AND cart_table.`isActive`=1";
			String query="update custom_list_table set isActive=0 where list_id=?";			
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,custorderid);
			//ps.setInt(2,cid);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	public void UpdateQuantity(CustomListBean custlist) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update custom_list_table set qty=? where customizeprodid=?";  //,subtotal=?,maintotal=?
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,custlist.getQty());	
			ps.setInt(2,custlist.getCustomizeprodid());
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	public void deleteCustListItem(int id) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update custom_list_table set isActive=0 where list_id=?";
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

	public void deleteCustItemByProID(int id) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update custom_list_table set isActive = 0 where customizeprodid=?";
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
	
	public void deleteCustListItemByCheckout(int list_id) 
	{	
		try
		{
			Connection cn= Connect.sqlconnection();	
			String query="update custom_list_table set isActive=0 where list_id=?";			
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,list_id);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}
	
	public static boolean CntCartValues() throws SQLException
	{	
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="select * from custom_list_table where isActive=1";
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
			String query ="SELECT * FROM custom_list_table WHERE user_id= '"+id+"' AND isActive = 1";
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
	
	public static boolean getListByProUserId(int pid,int uid) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();
		query="SELECT * FROM custom_list_table WHERE customizeprodid='"+pid+"' AND user_id='"+uid+"' AND isActive = 1";
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
	
	public static boolean getListByCatID(int catid) throws SQLException
	{
		Connection con=Connect.sqlconnection();
		String query = "SELECT * FROM custom_list_table INNER JOIN customizeproduct_table ON customizeproduct_table.`customizeprodid` = custom_list_table.`customizeprodid` WHERE customizeproduct_table.`custmaincatid` = '"+catid+"'";
		PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		ResultSet r= ps.executeQuery();			
		if(r.next())
		{
			return true;
		}
		r.close();
		ps.close();							
		con.close();
		return false;
	}

	public static List<CustomListBean> getProductCategory(int checkid)
	{
		Connection con=Connect.sqlconnection();
		List<CustomListBean> list =new ArrayList<CustomListBean>();
		try
		{
			String query="SELECT * FROM custom_list_table INNER JOIN customizeproduct_table ON custom_list_table.`customizeprodid` = customizeproduct_table.`customizeprodid` WHERE user_id='"+checkid+"' AND custom_list_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			while(rs.next())
			{
				CustomListBean clb = new CustomListBean();
				clb.setCustmaincatid(rs.getInt("custmaincatid"));
				System.out.println("Category :"+rs.getInt("custmaincatid"));
				System.out.println("In DAO Custom Cat : "+ clb.getCustmaincatid() );
				list.add(clb);
			}
			rs.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteOrder() 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="delete from custom_list_table WHERE isActive = 1";
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
	
	public static List<CustomListBean> getAllList() 
	{		
		Connection con=Connect.sqlconnection();
		List<CustomListBean> list =new ArrayList<CustomListBean>();
		try
		{
			String query="SELECT * FROM customize_order_table";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			while(rs.next())
			{
				CustomListBean clb = new CustomListBean();
				clb.setList_id(rs.getInt("list_id"));
				clb.setUser_id(rs.getInt("user_id"));
				clb.setCustomizeprodid(rs.getInt("customizeprodid"));
				clb.setCustmaincatid(rs.getInt("custmaincatid"));
				clb.setProname(rs.getString("customizeprodname"));
				clb.setProphoto1(rs.getString("custprodphoto1"));
				clb.setCustproprice(rs.getInt("custprodprice"));
				clb.setProspecification(rs.getString("custprodspecification"));
				clb.setQty(rs.getInt("qty"));
				list.add(clb);
			}
			rs.close();
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
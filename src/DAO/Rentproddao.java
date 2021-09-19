package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Productbean;
import bean.Rentprodbean;
import connection.Connect;
public class Rentproddao
{
	public void insertproduct(Rentprodbean rpd)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into rentproduct_table(rentprodname,rentprodphoto1,rentprodphoto2,rentprodprice,rentprodqty,rentprodspecification,rentproddescription,isActive) values(?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,rpd.getRentProName());
			ps.setString(2,rpd.getRentProPhoto1());
			ps.setString(3,rpd.getRentProPhoto2());
			ps.setString(4,rpd.getRentProductPrice());
			ps.setInt(5, rpd.getRentProductQty1());
			ps.setString(6,rpd.getRentProductSpecification1());			
			ps.setString(7,rpd.getRentProductDescription());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<Rentprodbean> getallProduct() throws SQLException
	{
		List<Rentprodbean> list =new ArrayList<Rentprodbean>();
		try
		{
			Connection con=Connect.sqlconnection();		
			String query ="select * from rentproduct_table where isActive=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Rentprodbean rpb = new Rentprodbean();
				rpb.setRentProid(r.getInt("rentprodid")); 
				rpb.setRentProName(r.getString("rentprodname"));			
				rpb.setRentProPhoto1(r.getString("rentprodphoto1"));
				rpb.setRentProPhoto2(r.getString("rentprodphoto2"));
				rpb.setRentProductPrice(r.getString("rentprodprice"));
				rpb.setRentProductQty1(r.getInt("rentprodqty"));
				rpb.setRentProductSpecification1(r.getString("rentprodspecification"));
				rpb.setRentProductDescription(r.getString("rentproddescription"));
				list.add(rpb);
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

	public void updateRentproduct(Rentprodbean rpd)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update rentproduct_table set rentprodname=?,rentprodprice=?,rentprodqty=?,rentprodspecification=? where rentprodid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,rpd.getRentProName());
			ps.setString(2,rpd.getRentProductPrice());
			ps.setInt(3, rpd.getRentProductQty1());
			ps.setString(4,rpd.getRentProductSpecification1());			
			ps.setInt(5,rpd.getRentProid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static List<Rentprodbean> getQuickRentProductByProId(int id)
	{
		List<Rentprodbean> list =new ArrayList<Rentprodbean>();
		Rentprodbean rpb=new Rentprodbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from rentproduct_table where rentprodid='"+id+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet r=ps.executeQuery();
			if(r.next())
			{		
				rpb.setRentProid(r.getInt("rentprodid"));
				rpb.setRentProName(r.getString("rentprodname"));
				rpb.setRentProductPrice(r.getString("rentprodprice"));
				rpb.setRentProPhoto1(r.getString("rentprodphoto1"));
				rpb.setRentProPhoto2(r.getString("rentprodphoto2"));
				rpb.setRentProductSpecification1(r.getString("rentprodspecification"));
				rpb.setRentProductDescription(r.getString("rentproddescription"));
				list.add(rpb);
			}			
			else
			{
				rpb=null;
			}
			r.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public static Rentprodbean getRentProductById(int id)
	{
		Rentprodbean rpb=new Rentprodbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from rentproduct_table where rentprodid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet r=ps.executeQuery();
			if(r.next())
			{
				rpb.setRentProid(r.getInt("rentprodid"));
				rpb.setRentProName(r.getString("rentprodname"));
				rpb.setRentProductPrice(r.getString("rentprodprice"));
				rpb.setRentProPhoto1(r.getString("rentprodphoto1"));
				rpb.setRentProPhoto2(r.getString("rentprodphoto2"));
				rpb.setRentProductSpecification1(r.getString("rentprodspecification"));
				rpb.setRentProductDescription(r.getString("rentproddescription"));
				rpb.setRentProductQty1(r.getInt("rentprodqty"));
			}
			else
			{
				rpb=null;
			}			
			r.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rpb;
	}
	
	public static void SetQuantityAftrOrder(Rentprodbean rpb) 
	{		
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update rentproduct_table set rentprodqty=? where rentprodid=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1, rpb.getRentProductQty1());
			ps.setInt(2,rpb.getRentProid());
			ps.executeUpdate();	
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}	
	
	public static int GetTotalQTY(int proid) 
	{
		int qty = 0; 
		try
		{
			Rentprodbean rpb=new Rentprodbean();
			Connection con=Connect.sqlconnection();			
			String query ="select * from rentproduct_table where rentprodid='"+proid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
 			if(r.next())
			{
 				rpb.setRentProductQty1(r.getInt("rentprodqty"));
				qty = rpb.getRentProductQty1();
				return qty;
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return qty;
	}
	public void deleteRentProduct(int id) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update rentproduct_table set isActive=0 where rentprodid=?";
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
	
	public void updateRentInventory(Rentprodbean rpd)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update rentproduct_table set rentprodname=?,rentprodprice=?,rentprodqty=? where rentprodid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,rpd.getRentProName());			
			ps.setString(2,rpd.getRentProductPrice());
			ps.setInt(3, rpd.getRentProductQty1());
			ps.setInt(4,rpd.getRentProid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void SetQuantityAftrOrder(Productbean pb1) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update rentproduct_table set rentprodqty=? where rentprodid=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1, pb1.getProductQty1());
			ps.setInt(2,pb1.getProductid());
			ps.executeUpdate();		
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
}

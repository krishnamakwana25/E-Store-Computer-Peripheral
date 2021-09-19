package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.CustProdBean;
import connection.Connect;
public class Custproddao 
{
	public void insertproduct(CustProdBean cpd)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into customizeproduct_table(custmaincatid,customizeprodname,custprodphoto1,custprodphoto2,custprodphoto3,custprodphoto4,custprodprice,custprodqty,custprodspecification,custproddescription,isActive) values(?,?,?,?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, cpd.getCustcatname());
			ps.setString(2,cpd.getCustproname());
			ps.setString(3,cpd.getCustprophoto1());
			ps.setString(4,cpd.getCustprophoto2());
			ps.setString(5,cpd.getCustprophoto3());
			ps.setString(6,cpd.getCustprophoto4());
			ps.setString(7,cpd.getCustproprice());
			ps.setInt(8,cpd.getCustproqty());
			ps.setString(9,cpd.getCustprospecification());
			ps.setString(10,cpd.getCustproddescription());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static CustProdBean getProductById(int id)
	{
		CustProdBean cpb=new CustProdBean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from customizeproduct_table where customizeprodid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				cpb.setCustproid(rs.getInt("customizeprodid"));
				cpb.setCustproname(rs.getString("customizeprodname"));
				cpb.setCustprophoto1(rs.getString("custprodphoto1"));
				cpb.setCustprophoto2(rs.getString("custprodphoto2"));
				cpb.setCustprophoto3(rs.getString("custprodphoto3"));
				cpb.setCustprophoto4(rs.getString("custprodphoto4"));
				cpb.setCustproqty(rs.getInt("custprodqty"));
				cpb.setCustproprice(rs.getString("custprodprice"));
				cpb.setCustprospecification(rs.getString("custprodspecification"));
				cpb.setCustproddescription(rs.getString("custproddescription"));
			}
			else
			{
				cpb=null;
			}
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cpb;
	}
	
	public static List<CustProdBean> getQuickProductByProId(int id)
	{
		List<CustProdBean> list =new ArrayList<CustProdBean>();
		CustProdBean cpb=new CustProdBean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from customizeproduct_table where customizeprodid='"+id+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				cpb.setCustproid(rs.getInt("customizeprodid"));
				cpb.setCustproname(rs.getString("customizeprodname"));
				cpb.setCustprophoto1(rs.getString("custprodphoto1"));
				cpb.setCustprophoto2(rs.getString("custprodphoto2"));
				cpb.setCustprophoto3(rs.getString("custprodphoto3"));
				cpb.setCustprophoto4(rs.getString("custprodphoto4"));	
				cpb.setCustproprice(rs.getString("custprodprice"));
				cpb.setCustprospecification(rs.getString("custprodspecification"));
				cpb.setCustproddescription(rs.getString("custproddescription"));
				cpb.setCustmaincatid(rs.getInt("custmaincatid"));		
				list.add(cpb);
			}			
			else
			{
				cpb=null;
			}
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<CustProdBean> getallProduct() throws SQLException
	{
		List<CustProdBean> list =new ArrayList<CustProdBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM customizeproduct_table INNER JOIN customizecategory_table ON customizeproduct_table.`custmaincatid` = customizecategory_table.`custmaincatid` WHERE customizeproduct_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustProdBean cpb = new CustProdBean();
				cpb.setCustproid(r.getInt("customizeprodid"));
				cpb.setCustcatname(r.getString("custcatname"));
				cpb.setCustproname(r.getString("customizeprodname"));
				cpb.setCustprophoto1(r.getString("custprodphoto1"));
				cpb.setCustprophoto2(r.getString("custprodphoto2"));
				cpb.setCustprophoto3(r.getString("custprodphoto3"));
				cpb.setCustprophoto4(r.getString("custprodphoto4"));
				cpb.setCustproprice(r.getString("custprodprice"));
				cpb.setCustproqty(r.getInt("custprodqty"));
				cpb.setCustprospecification(r.getString("custprodspecification"));
				cpb.setCustproddescription(r.getString("custproddescription"));
				cpb.setCustmaincatid(r.getInt("custmaincatid"));		
				list.add(cpb);
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

	public void deleteProduct(int id) 
	{
			try
			{
				Connection cn= Connect.sqlconnection();		
				String query="update customizeproduct_table set isActive=0 where customizeprodid=?";
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
	public void updateCustProduct(CustProdBean cb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update customizeproduct_table set customizeprodname=?,custprodprice=?,custprodqty=?,custprodspecification=? where customizeprodid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,cb.getCustproname());
			ps.setString(2,cb.getCustproprice());
			ps.setInt(3, cb.getCustproqty());
			ps.setString(4,cb.getCustprospecification());			
			ps.setInt(5,cb.getCustproid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	public static void SetQuantityAftrOrder(CustProdBean pb1) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update customizeproduct_table set custprodqty=? where customizeprodid=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1, pb1.getCustproqty());
			ps.setInt(2,pb1.getCustproid());
			ps.executeUpdate();		
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}	
	
	public static int GetTotalQTY(int custproid) 
	{
		int qty = 0; 
		try
		{
			CustProdBean pb1 = new CustProdBean();
			Connection con=Connect.sqlconnection();			
			String query ="select * from customizeproduct_table where customizeprodid='"+custproid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
 			if(r.next())
			{
 				pb1.setCustproqty(r.getInt("custprodqty"));
				qty = pb1.getCustproqty();
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
	
	public void updateCustomInventory(CustProdBean cpb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update customizeproduct_table set customizeprodname=?,custprodprice=?,custprodqty=? where customizeprodid=?";			
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,cpb.getCustproname());			
			ps.setString(2,cpb.getCustproprice());
			ps.setInt(3, cpb.getCustproqty());
			ps.setInt(4,cpb.getCustproid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/*COUNT TOTAL PRODUCT IN THE CUSTOMIZE */
	public static int getallCustomProductsCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM customizeproduct_table WHERE  isActive = 1";
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
		
	public static List<CustProdBean> disposeItemByCatID(int catid) throws SQLException
	{
		List<CustProdBean> list =new ArrayList<CustProdBean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "SELECT * FROM customizeproduct_table WHERE custmaincatid = '"+catid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				CustProdBean cpb = new CustProdBean();
				cpb.setCustproid(r.getInt("customizeprodid"));
				System.out.println("Product id : "+r.getInt("customizeprodid"));
				list.add(cpb);
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
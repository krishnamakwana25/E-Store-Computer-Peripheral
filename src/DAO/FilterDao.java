package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Productbean;
import bean.CustProdBean;
import connection.Connect;

public class FilterDao {
	
	// --------------------Customize FILTER--------------------
		public List<CustProdBean> getAllCustProdByFilter(int feature) throws SQLException
		{
			List<CustProdBean> list =new ArrayList<CustProdBean>();
			try
			{
				Connection con=Connect.sqlconnection();
			//	String query ="select * from product_table where isActive=1";
				//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
				//String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=?";
				String query="SELECT * FROM customizeproduct_table INNER JOIN customizecategory_table ON customizeproduct_table.`custmaincatid` = customizecategory_table.`custmaincatid`  WHERE customizeproduct_table.`isActive`=1 and customizeproduct_table.custmaincatid=?";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setInt(1,feature);
				
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
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		}
	
	
	
	
	
	// --------------------COMPANY Wise FILTER--------------------
	public List<Productbean> getAllProdByFilter(int company) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=?";
			
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter(int company,String proce) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			ps.setString(2,proce);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter(int company,String proce,String ram) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=? and ram=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			ps.setString(2,proce);
			ps.setString(3,ram);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilter(int company,String proce,String ram,String hdd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=? and ram=? and hdd=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			ps.setString(2,proce);
			ps.setString(3,ram);
			ps.setString(4,hdd);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter1(int company,String proce,String ram,String ssd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=? and ram=? and ssd=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			ps.setString(2,proce);
			ps.setString(3,ram);
			ps.setString(4,ssd);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter(int company,String proce,String ram,String hdd,String graphics) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=? and ram=? and hdd=? and graphicscard=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			ps.setString(2,proce);
			ps.setString(3,ram);
			ps.setString(4,hdd);
			ps.setString(5,graphics);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterg(int company1,String proce1,String ram1,String ssd,String graphics1) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=? and ram=? and ssd=? and graphicscard=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company1);
			ps.setString(2,proce1);
			ps.setString(3,ram1);
			ps.setString(4,ssd);
			ps.setString(5,graphics1);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilter(int company,String proce,String ram,String hdd,String ssd,String graphics) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.subcatid=? and processor=? and ram=? and hdd=? and ssd=? and graphicscard=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1,company);
			ps.setString(2,proce);
			ps.setString(3,ram);
			ps.setString(4,hdd);
			ps.setString(5,ssd);
			ps.setString(6,graphics);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	// --------------------PROCESSOR Wise FILTER--------------------	
	public List<Productbean> getAllProdByFilter(String proce) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilter(String proce,int company) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=? and product_table.subcatid=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce);
			ps.setInt(2,company);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilter(String proce,int company,String ram) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=? and product_table.subcatid=? and product_table.ram=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce);
			ps.setInt(2,company);
			ps.setString(3,ram);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter(String proce,int company,String ram,String hdd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=? and product_table.subcatid=? and product_table.ram=? and product_table.hdd=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce);
			ps.setInt(2,company);
			ps.setString(3,ram);
			ps.setString(4,hdd);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter1(String proce,int company,String ram,String ssd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=? and product_table.subcatid=? and product_table.ram=? and product_table.ssd=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce);
			ps.setInt(2,company);
			ps.setString(3,ram);
			ps.setString(4,ssd);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilter(String proce,int company,String ram,String hdd,String graphics) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=? and product_table.subcatid=? and product_table.ram=? and product_table.hdd=? and product_table.graphicscard=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce);
			ps.setInt(2,company);
			ps.setString(3,ram);
			ps.setString(4,hdd);
			ps.setString(5,graphics);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilterg(String proce1,int company1,String ram1,String ssd,String graphics1) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.processor=? and product_table.subcatid=? and product_table.ram=? and product_table.ssd=? and product_table.graphicscard=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,proce1);
			ps.setInt(2,company1);
			ps.setString(3,ram1);
			ps.setString(4,ssd);
			ps.setString(5,graphics1);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	// --------------------RAM Wise FILTER--------------------
	public List<Productbean> getAllProdByFilterRam(String ram) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.ram=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilterRam(String ram,int company) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.ram=? and product_table.subcatid=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram);
			ps.setInt(2,company);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public List<Productbean> getAllProdByFilterRam1(String ram,int company,String proce) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.ram=? and product_table.subcatid=? and product_table.processor=?" ;
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram);
			ps.setInt(2,company);
			ps.setString(3,proce);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterRam1(String ram,int company,String proce,String hdd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and ram=? and product_table.subcatid=? and processor=? and hdd=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram);
			ps.setInt(2,company);
			ps.setString(3,proce);
			ps.setString(4,hdd);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterRam(String ram,int company,String proce,String ssd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and ram=? and product_table.subcatid=? and processor=? and ssd=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram);
			ps.setInt(2,company);
			ps.setString(3,proce);
			ps.setString(4,ssd);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterRam1(String ram,int company,String proce,String hdd,String graphics) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and ram=? and product_table.subcatid=? and processor=? and hdd=? and graphicscard=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram);
			ps.setInt(2,company);
			ps.setString(3,proce);
			ps.setString(4,hdd);
			ps.setString(5,graphics);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterRam2(String ram1,int company1,String proce1,String ssd,String graphics1) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and ram=? and product_table.subcatid=? and processor=? and ssd=? and graphicscard=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ram1);
			ps.setInt(2,company1);
			ps.setString(3,proce1);
			ps.setString(4,ssd);
			ps.setString(5,graphics1);
			
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	// --------------------HardDisk Wise FILTER--------------------
	public List<Productbean> getAllProdByFilterHdd(String hdd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.hdd=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,hdd);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterHdd(String hdd,int company) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.hdd=? and product_table.subcatid=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,hdd);
			ps.setInt(2,company);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterHdd(String hdd,int company,String proce) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.hdd=? and product_table.subcatid=? and product_table.processor=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,hdd);
			ps.setInt(2,company);
			ps.setString(3,proce);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getAllProdByFilterHdd(String hdd,int company,String proce,String ram) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.hdd=? and product_table.subcatid=? and product_table.processor=? and product_table.ram=? ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,hdd);
			ps.setInt(2,company);
			ps.setString(3,proce);
			ps.setString(4,ram);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	// --------------------SSD Wise FILTER--------------------
	public List<Productbean> getAllProdByFilterSsd(String ssd) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.ssd=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,ssd);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	// --------------------Graphics Wise FILTER--------------------
	public List<Productbean> getAllProdByFilterGraphics(String graphics) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1 and product_table.graphicscard=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1,graphics);
			
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setSubcatname(r.getString("subcatname"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setProcessorName(r.getString("processor"));
				pb.setRAM(r.getString("ram"));
				pb.setStorageHDD(r.getString("hdd"));
				pb.setStorageSDD(r.getString("ssd"));
				pb.setGC(r.getString("graphicscard"));
				list.add(pb);
			}
			r.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
}
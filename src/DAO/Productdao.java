package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Productbean;
import connection.Connect;
public class Productdao
{
	public void insertproduct(Productbean pb)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into product_table(maincatid,subcatid,productname,productphoto1,productphoto2,productphoto3,productphoto4,productprice,productqty,productspecification,productdescription,processor,ram,hdd,ssd,graphicscard,isActive) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, pb.getMaincatname());
			ps.setString(2, pb.getSubcatname());
			ps.setString(3, pb.getProductName());
			ps.setString(4, pb.getProductPhoto1());
			ps.setString(5, pb.getProductPhoto2());
			ps.setString(6, pb.getProductPhoto3());
			ps.setString(7, pb.getProductPhoto4());
			ps.setString(8,  pb.getProductPrice());
			ps.setInt(9, pb.getProductQty1());
			ps.setString(10, pb.getProductSpecification1());
			ps.setString(11, pb.getProductDescription());
			ps.setString(12, pb.getProcessorName());
			ps.setString(13, pb.getRAM());
			ps.setString(14, pb.getStorageHDD());
			ps.setString(15, pb.getStorageSDD());
			ps.setString(16, pb.getGC());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 
	
	
	public List<Productbean> getallProduct() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
		//	String query ="select * from product_table where isActive=1";
			//String query ="select * from product_table ORDER BY productprice desc ";/*where isActive=1 */
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getSixProduct() throws SQLException
	{
	 	List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			//String query="SELECT * FROM product_table WHERE productprice=130000";
			//String query ="select * from product_table ORDER BY where isActive=1";
			//String query= "SELECT * FROM product_table WHERE isActive=1 AND productid=18  LIMIT 6";
			  String query= "SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table. `productid` IN (106,90,104,17,94,119)";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));	
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
				pb.setMaincatname(r.getString("maincatname"));
				pb.setSubcatname(r.getString("subcatname"));
				list.add(pb);
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
	
	public List<Productbean> getHighValProduct() throws SQLException
	{
	 	List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table WHERE isActive =1 ORDER BY productprice DESC LIMIT 1"; // LIMIT 1
			//String query ="select * from product_table ORDER BY where isActive=1";
			//String query= "SELECT * FROM product_table LIMIT 1 where isActive=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				//pb.setProductDescription(r.getString("productdescription"));
				list.add(pb);
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
			String query="update product_table set isActive=0 where productid=?";
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
	public static Productbean getProductById(int id)
	{
		Productbean pb=new Productbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from product_table where productid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				pb.setProductid(rs.getInt("productid"));
				pb.setProductName(rs.getString("productname"));
				pb.setProductPhoto1(rs.getString("productphoto1"));
				pb.setProductPhoto2(rs.getString("productphoto2"));
				pb.setProductPhoto3(rs.getString("productphoto3"));
				pb.setProductPhoto4(rs.getString("productphoto4"));	
				pb.setProductPrice(rs.getString("productprice"));
				pb.setProductQty1(rs.getInt("productqty"));
				pb.setProductSpecification1(rs.getString("productspecification"));
				pb.setProductDescription(rs.getString("productdescription"));
			}
			else
			{
				pb=null;
			}
			rs.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return pb;
	}
	public void updateProduct(Productbean pb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update product_table set productname=?,productprice=?,productqty=?,productspecification=?,subcatid=?,maincatid=? where productid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,pb.getProductName());
			ps.setString(2,pb.getProductPrice());
			ps.setInt(3,pb.getProductQty1());
			ps.setString(4,pb.getProductSpecification1());			
			/* ps.setString(5,pb.getProductDescription()); */
			ps.setString(5,pb.getSubcatname());
			ps.setString(6,pb.getMaincatname());		
			ps.setInt(7,pb.getProductid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	/*========================SEARCH PRODUCT=========================*/
	public static int getAllSearch(String name) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table WHERE  isActive=1 AND productname like '"+"%"+name+"%"+"'";
			/*String query="SELECT * FROM product_table WHERE  isActive=1 AND productname like '"+name+"'";*/
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
	
	public List<Productbean> SearchProduct(String name) throws SQLException   //,String subcat1, String maincat1
	{
	 	List<Productbean> list = new ArrayList<>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table WHERE  isActive=1 AND productname like '"+"%"+name+"%"+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();			
			while(rs.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(rs.getInt("productid"));
				pb.setProductName(rs.getString("productname"));
				pb.setProductPhoto1(rs.getString("productphoto1"));
				pb.setProductPhoto2(rs.getString("productphoto2"));
				pb.setProductPhoto3(rs.getString("productphoto3"));
				pb.setProductPhoto4(rs.getString("productphoto4"));	
				pb.setProductPrice(rs.getString("productprice"));
				pb.setProductQty1(rs.getInt("productqty"));
				pb.setProductSpecification1(rs.getString("productspecification"));
				pb.setProductDescription(rs.getString("productdescription"));
				pb.setMaincatid(rs.getInt("maincatid"));
				pb.setSubcatid(rs.getInt("subcatid"));			
				list.add(pb);
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
	/*========================SEARCH PRODUCT OVER=========================*/
	
	public List<Productbean> getFourProduct() throws SQLException
	{
	 	List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			//String query="SELECT * FROM product_table WHERE productprice=130000";
			//String query ="select * from product_table ORDER BY where isActive=1";
			String query= "SELECT * FROM product_table WHERE isActive=1 AND productprice BETWEEN 900 AND 111307 LIMIT 4";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));	
				pb.setProductPrice(r.getString("productprice"));			
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));
				list.add(pb);
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
	
	public List<Productbean> getNineProduct() throws SQLException
	{
	 	List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			//String query="SELECT * FROM product_table WHERE productprice=130000";
			//String query ="select * from product_table ORDER BY where isActive=1";
			String query= "SELECT * FROM product_table WHERE isActive=1 AND productprice BETWEEN 900 AND 111307 LIMIT 9";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));	
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));				
				list.add(pb);
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
	
	public static List<Productbean> getQuickProductByProId(int id)
	{
		List<Productbean> list =new ArrayList<Productbean>();
		Productbean pb=new Productbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from product_table where productid='"+id+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				pb.setProductid(rs.getInt("productid"));
				pb.setProductName(rs.getString("productname"));
				pb.setProductPhoto1(rs.getString("productphoto1"));
				pb.setProductPhoto2(rs.getString("productphoto2"));
				pb.setProductPhoto3(rs.getString("productphoto3"));
				pb.setProductPhoto4(rs.getString("productphoto4"));				
				pb.setProductPrice(rs.getString("productprice"));	
				pb.setProductQty1(rs.getInt("productqty"));
				pb.setProductSpecification1(rs.getString("productspecification"));
				pb.setProductDescription(rs.getString("productdescription"));
				pb.setMaincatid(rs.getInt("maincatid"));
				pb.setSubcatid(rs.getInt("subcatid"));		
				list.add(pb);
			}			
			else
			{
				pb=null;
			}
			rs.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Productbean> getRelatedFourProduct(String subcatname) throws SQLException 
	{
	 	List<Productbean> list =new ArrayList<Productbean>();
	 	Productbean pb = new Productbean();
		try
		{
			Connection con=Connect.sqlconnection();
 			String query="SELECT * FROM product_table INNER JOIN subcategory_table ON product_table.`subcatid` = subcategory_table.`subcatid` WHERE subcategory_table.`subcatname` LIKE '"+subcatname+"' LIMIT 3";
		//	String query="SELECT * FROM product_table WHERE  isActive=1 AND productname like '"+"%"+pnm+"%"+"' LIMIT 3";
			/*String query= "SELECT * FROM product_table where subcatid = '"+mid+"' AND productid != '"+pid+"' LIMIT 3";*/
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{	
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setProductid(r.getInt("productid"));
				pb.setProductName(r.getString("productname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));	
				pb.setProductPrice(r.getString("productprice"));		
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));				
				pb.setSubcatid(r.getInt("subcatid"));		
				pb.setSubcatname(r.getString("subcatname"));
				list.add(pb);
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
	
	public List<Productbean> getallLaptop() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`maincatid`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getallPrinters() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`maincatid`=5";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getallCameras() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`maincatid`=4";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getallKeyboardsMouse() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`maincatid` IN (2,3,6)";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Productbean> getProductBySubCatID(int sid) throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`subcatid` = '"+sid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

	public static void SetQuantityAftrOrder(Productbean pb1) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update product_table set productqty=? where productid=?";
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
	
	public static int GetTotalQTY(int proid) 
	{
		int qty = 0; 
		try
		{
			Productbean pb1 = new Productbean();
			Connection con=Connect.sqlconnection();			
			String query ="select * from product_table where productid='"+proid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
 			if(r.next())
			{
 				pb1.setProductQty1(r.getInt("productqty"));
				qty = pb1.getProductQty1();
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
	
	public void updateProductInventory(Productbean pb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update product_table set productname=?,productprice=?,productqty=? where productid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,pb.getProductName());			
			ps.setString(2,pb.getProductPrice());
			ps.setInt(3, pb.getProductQty1());					
			ps.setInt(4,pb.getProductid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Productbean> getallProductsByName(int company) throws SQLException
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
	
	public static int getallProductsCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM product_table WHERE  isActive = 1";
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
	
	public List<Productbean> getalli9Laptop() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table INNER JOIN maincategory_table ON product_table.`maincatid` = maincategory_table.`maincatid` INNER JOIN subcategory_table ON product_table.`subcatid`=subcategory_table.`subcatid` WHERE product_table.`maincatid`=1 and processor='i9' ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));
				pb.setMaincatid(r.getInt("maincatid"));
				pb.setSubcatid(r.getInt("subcatid"));
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
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Productbean> getOutOfStockItem() throws SQLException
	{
		List<Productbean> list =new ArrayList<Productbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table WHERE productqty = 0";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Productbean pb = new Productbean();
				pb.setProductid(r.getInt("productid"));				
				pb.setProductName(r.getString("productname"));
				pb.setProductPhoto1(r.getString("productphoto1"));
				pb.setProductPhoto2(r.getString("productphoto2"));
				pb.setProductPhoto3(r.getString("productphoto3"));
				pb.setProductPhoto4(r.getString("productphoto4"));
				pb.setProductPrice(r.getString("productprice"));
				pb.setProductQty1(r.getInt("productqty"));
				pb.setProductSpecification1(r.getString("productspecification"));
				pb.setProductDescription(r.getString("productdescription"));				
				list.add(pb);
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
	
	public static int getOutOfStockCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM product_table WHERE productqty = 0";
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
 	
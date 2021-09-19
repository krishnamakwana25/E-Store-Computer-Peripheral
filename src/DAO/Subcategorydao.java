package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Subcategorybean;
import connection.Connect;
public class Subcategorydao 
{
	public void insertsubcategory(Subcategorybean mb)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="insert into subcategory_table(maincatid,subcatname,isActive) values(?,?,1)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,mb.getMaincatid());
			ps.setString(2, mb.getSubcatname());
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<Subcategorybean> getallSubcategory() throws SQLException
	{
		List<Subcategorybean> list =new ArrayList<Subcategorybean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="select * from subcategory_table INNER JOIN maincategory_table ON subcategory_table.`maincatid` = maincategory_table.`maincatid` where subcategory_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();				
			while(r.next())
			{
				Subcategorybean sb = new Subcategorybean();
				sb.setSubcatid(r.getInt("subcatid"));
				sb.setSubcatname(r.getString(("subcatname")));
				sb.setMaincatname(r.getString("maincatname"));
				list.add(sb);
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
	
	public List<Subcategorybean> getSubCatByMainCatId(int mid) throws SQLException
	{
		List<Subcategorybean> list =new ArrayList<Subcategorybean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query ="select * from subcategory_table where maincatid='"+mid+"' AND subcategory_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();				
			while(r.next())
			{
				Subcategorybean sb = new Subcategorybean();
				sb.setSubcatid(r.getInt("subcatid"));
				sb.setSubcatname(r.getString(("subcatname")));				
				sb.setMaincatid(r.getInt("maincatid"));
				list.add(sb);
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
	
	public void deletesubcategory(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update subcategory_table set isActive=0 where subcatid=? ";  //AND maincatname=?
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
	public static Subcategorybean getSubcategoryById(int id)
	{
		Subcategorybean sb=new Subcategorybean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from subcategory_table where subcatid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				sb.setSubcatid(rs.getInt("subcatid"));
				sb.setSubcatname(rs.getString("subcatname"));
				sb.setMaincatid(rs.getInt("maincatid"));
			}
			else
			{
				sb=null;
			}
			rs.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sb;
	}
	public void updateSubcategory(Subcategorybean sb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update subcategory_table set subcatname=?, maincatid=? where subcatid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,sb.getSubcatname());		
			ps.setString(2, sb.getMaincatname());
			ps.setInt(3,sb.getSubcatid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

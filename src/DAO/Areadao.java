package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Areabean;
import connection.Connect;
public class Areadao {
	public void insertarea(Areabean ab)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into area_table(area_name,city_id,state_id,isActive) values(?,?,?,1)";	
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, ab.getAreaname());
			ps.setString(2, ab.getCityname());
			ps.setString(3, ab.getStatename());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 
	public List<Areabean> getallArea() throws SQLException
	{
		List<Areabean> list =new ArrayList<Areabean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM area_table INNER JOIN city_table ON area_table.`city_id` = city_table.`city_id` INNER JOIN state_table ON area_table.`state_id`=state_table.`state_id` WHERE area_table.`isActive`=1";  				
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Areabean ab = new Areabean();
				ab.setAid(r.getInt("area_id"));
				ab.setAreaname(r.getString("area_name"));
				ab.setCityname(r.getString("city_name"));
				ab.setStatename(r.getString("state_name"));
				list.add(ab);
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
	public void deletearea(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update area_table set isActive=0 where area_id=?";
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
	
	public static Areabean getAreaById(int id)
	{
		Areabean ab=new Areabean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from area_table where area_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				ab.setAid(rs.getInt("area_id"));
				ab.setAreaname(rs.getString("area_name"));
				ab.setCid(rs.getInt("city_id"));
				ab.setSid(rs.getInt("state_id"));
			}
			else
			{
				ab=null;
			}
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ab;
	}
	
	public void updateArea(Areabean sb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update area_table set area_name=?, city_id=?, state_id=?where area_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,sb.getAreaname());
			ps.setString(2,sb.getCityname());
			ps.setString(3,sb.getStatename());
			ps.setInt(4,sb.getAid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}

package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Citybean;
import connection.Connect;

public class Citydao {
	public void insertcity(Citybean cb)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into city_table(state_id,city_name,isActive) values(?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, cb.getSid());
			ps.setString(2, cb.getCityname());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 
	public List<Citybean> getallCity() throws SQLException
	{
		List<Citybean> list =new ArrayList<Citybean>();
		try
		{
			Connection con=Connect.sqlconnection();
			//String query ="select * from state_table where isActive=1";		
			String query ="select * from city_table INNER JOIN state_table ON city_table.`state_id` = state_table.`state_id` WHERE city_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();
			
			while(r.next())
			{
				Citybean cb = new Citybean();
				cb.setCid(r.getInt("city_id"));
				cb.setCityname(r.getString("city_name"));
				cb.setStatename(r.getString("state_name"));
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
	public void deletecity(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update city_table set isActive=0 where city_id=? ";//, state_id = 
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
	public static Citybean getCityById(int id)
	{
		Citybean sb=new Citybean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from city_table where city_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				sb.setCid(rs.getInt("city_id"));
				sb.setCityname(rs.getString("city_name"));
				sb.setSid(rs.getInt("state_id"));
			}
			else
			{
				sb=null;
			}
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sb;
	}
	public void updateCity(Citybean sb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update city_table set city_name=?, state_id=? where city_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,sb.getCityname());
			ps.setString(2,sb.getStatename());
			ps.setInt(3,sb.getCid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}

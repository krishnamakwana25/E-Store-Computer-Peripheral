package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.ArrayList;
import bean.Statebean;
import connection.Connect;

public class Statedao
{
	public void insertstate(Statebean sb)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into state_table(state_name,isActive,doi,dou) values(?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, sb.getStatename());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 

	public List<Statebean> getallState() throws SQLException
	{
		List<Statebean> list =new ArrayList<Statebean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="select * from state_table where isActive=1";			
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Statebean sb = new Statebean();
				sb.setSid(r.getInt("state_id"));
				sb.setStatename(r.getString("state_name"));
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
	public void deletestate(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update state_table set isActive=0 where state_id=?";		
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
	
	public static Statebean getStateById(int id)
	{
		Statebean sb=new Statebean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from state_table where state_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				sb.setSid(rs.getInt("state_id"));
				sb.setStatename(rs.getString("state_name"));
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
	public void updateState(Statebean sb)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update state_table set state_name=? where state_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,sb.getStatename());
			ps.setInt(2,sb.getSid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
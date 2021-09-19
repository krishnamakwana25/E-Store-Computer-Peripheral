package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Maincategorybean;
import connection.Connect;
public class Maincategorydao {
		public void insertmaincategory(Maincategorybean mb)
		{
			try
			{
				Connection con=Connect.sqlconnection();
				String query="insert into maincategory_table(maincatname,isActive) values(?,1)";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, mb.getMaincatname());
				ps.executeUpdate();
				con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		public List<Maincategorybean> getallMaincategory() throws SQLException
		{
			List<Maincategorybean> list =new ArrayList<Maincategorybean>();
			try
			{
				Connection con=Connect.sqlconnection();
				String query ="select * from maincategory_table where isActive=1";			
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
	 			ResultSet r= ps.executeQuery();				
				while(r.next())
				{
					Maincategorybean sb = new Maincategorybean();
					sb.setMaincatid(r.getInt("maincatid"));
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
		public void deletemaincategory(int id)
		{
			try
			{
				Connection cn= Connect.sqlconnection();		
				String query="update maincategory_table set isActive=0  where maincatid=?";
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
		public static Maincategorybean getMaincategoryById(int id)
		{
			Maincategorybean sb=new Maincategorybean();
			try
			{
				Connection cn=Connect.sqlconnection();
				String query="select * from maincategory_table where maincatid=?";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					sb.setMaincatid(rs.getInt("maincatid"));
					sb.setMaincatname(rs.getString("maincatname"));
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
		public void updateMaincategory(Maincategorybean sb)
		{
			try
			{
				Connection cn=Connect.sqlconnection();
				String query="update maincategory_table set maincatname=? where maincatid=?";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ps.setString(1,sb.getMaincatname());
				ps.setInt(2,sb.getMaincatid());
				ps.executeUpdate();
				cn.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}

}

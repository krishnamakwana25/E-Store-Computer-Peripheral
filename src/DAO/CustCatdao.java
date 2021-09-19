package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CustomCatbean;
import connection.Connect;

public class CustCatdao 
{
	public void insertcustomecategory(CustomCatbean custcategory)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="insert into customizecategory_table(custcatname,isActive) values(?,1)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, custcategory.getCustcatname());
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public List<CustomCatbean> getallCustomecategory() throws SQLException
	{
		List<CustomCatbean> list =new ArrayList<CustomCatbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="select * from customizecategory_table where isActive=1";			
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();
			
			while(r.next())
			{
				CustomCatbean cb = new CustomCatbean();
				cb.setCustmaincatid(r.getInt("custmaincatid"));
				cb.setCustcatname(r.getString("custcatname"));
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
	
	public static CustomCatbean getCustomCatById(int id)
	{
		CustomCatbean cb=new CustomCatbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from customizecategory_table where custmaincatid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				cb.setCustmaincatid(rs.getInt("custmaincatid"));
				cb.setCustcatname(rs.getString("custcatname"));
			}
			else
			{
				cb=null;
			}
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cb;

	}
	
	public void deletecustomecategory(int id) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update customizecategory_table set isActive=0 where custmaincatid=?";
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

	public void updateCustomecategory(CustomCatbean cb) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update customizecategory_table set custcatname=? where custmaincatid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,cb.getCustcatname());		
			ps.setInt(2,cb.getCustmaincatid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}
	
/*	public static String getAllCategoryID()
	{
		int[] id = new int[7];
		String sid = "";
		try 		
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from customizecategory_table";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				sid += rs.getString("custmaincatid").trim()+ " ";
				System.out.println("id : "+sid);
				for(int i = 1 ;i<= 6 ;i++)
				{
					id[i] = rs.getInt("custmaincatid");
					System.out.println("id : ["+i+"]"+id[i]);
				}			
			}
			for(int i = 1 ;i<= 6 ;i++)
			{
			
				System.out.println("id : ["+i+"]"+id[i]);
			}		
			System.out.println("id : "+sid);
			String sid1[] = sid.split(" ");
			for(int i = 1 ;i<= 6 ;i++)
			{
				 System.out.println("id : ["+i+"]"+sid1[i]);
			}
			ps.executeQuery();			
			cn.close();
			ps.close();
			rs.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return sid;		
	}*/
}
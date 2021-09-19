/* =============================
 id = 1 - Order 
 id = 2 - Rent Order
 id = 3 - Custom Order
 id = 4 - NOrmal Order Cancel
 id = 5 - Rent Order Cancel
 id = 6 - Custom Order Cancel
 id = 7 - User
 id = 8 - Dealer 
 id = 9 - Out of Stock - Product
 id = 10 - Out of Stock - Rent Product
 =============================*/
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Notificationbean;
import connection.Connect;
public class Notificationdao
{
	public static void InsertIntoNotification(Notificationbean nd)
	{
		try
		{
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDateTime sd = LocalDateTime.now();
			Connection cn= Connect.sqlconnection();
			String query="insert into notification_table(not_id,not_description,isActive,date1)"+"values(?,?,1,'"+dtf.format(sd)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, nd.getNot_id());
			ps.setString(2, nd.getNot_description());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Notificationbean> getallNotifications() throws SQLException
	{
		List<Notificationbean> list =new ArrayList<Notificationbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Notificationbean nb = new Notificationbean();
				nb.setNot_id(r.getString("not_id"));
				nb.setNot_description(r.getString("not_description"));
				nb.setNotDate(r.getString("date1"));
				list.add(nb);
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

	public static int getallNotificationCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE isActive = 1";
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

	public void deleteNotification() 
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update notification_table set isActive=0 ";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}

	/*===================================================================================================*/
	
	public String getallNotifyOrderDes() throws SQLException
	{		
		String ans = "";
		try
		{
			
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where not_id = 1 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			if(r.next())
			{
				ans = r.getString("not_description");				
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public String getallNotifyOrderDate() throws SQLException
	{		
		String ans = "";
		try
		{
			
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where not_id = 1 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			if(r.next())
			{			
				ans = r.getString("date1");				
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public static int getallNotifyOrder() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE not_id = 1 AND isActive = 1 ";
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
	
	/*===================================================================================================*/
	
	public String getallNotifyRentOrderDes() throws SQLException
	{		
		String ans = "";
		try
		{
			
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where not_id = 2 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			if(r.next())
			{	
				ans = r.getString("not_description");				
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public String getallNotifyRentOrderDate() throws SQLException
	{		
		String ans = "";
		try
		{
			
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where not_id = 2 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			if(r.next())
			{		
				ans = r.getString("date1");				
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public static int getallNotifyRentOrder() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE not_id = 2 AND isActive = 1 ";
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
	
	/*===================================================================================================*/
	
	public String getallNotifyCustomOrderDes() throws SQLException
	{		
		String ans = "";
		try
		{
			
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where not_id = 3 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			if(r.next())
			{
				ans = r.getString("not_description");				
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public String getallNotifyCustomOrderDate() throws SQLException
	{		
		String ans = "";
		try
		{
			
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table where not_id = 3 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			if(r.next())
			{
				ans = r.getString("date1");				
			}
			r.close();
			ps.close();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ans;
	}
	
	public static int getallNotifyCustomOrder() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE not_id = 3 AND isActive = 1 ";
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
	
/*===================================================================================================*/
	
	public List<Notificationbean> getallNotifyOrderCancel() throws SQLException
	{		
			List<Notificationbean> list =new ArrayList<Notificationbean>();
			try
			{
				Connection con=Connect.sqlconnection();
				String query="SELECT * FROM notification_table WHERE not_id = 4 AND isActive = 1 ";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
	 			ResultSet r= ps.executeQuery();			
				while(r.next())
				{
					Notificationbean nb = new Notificationbean();
					nb.setNot_id(r.getString("not_id"));
					nb.setNot_description(r.getString("not_description"));
					nb.setNotDate(r.getString("date1"));
					list.add(nb);
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
	
	public static int getallNotifyCancelOrder() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE not_id = 4 AND isActive = 1 ";
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
	
/*===================================================================================================*/
	
	public List<Notificationbean> getallNotifyRentOrderCancel() throws SQLException
	{		
			List<Notificationbean> list =new ArrayList<Notificationbean>();
			try
			{
				Connection con=Connect.sqlconnection();
				String query="SELECT * FROM notification_table WHERE not_id = 5 AND isActive = 1 ";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
	 			ResultSet r= ps.executeQuery();			
				while(r.next())
				{
					Notificationbean nb = new Notificationbean();
					nb.setNot_id(r.getString("not_id"));
					nb.setNot_description(r.getString("not_description"));
					nb.setNotDate(r.getString("date1"));
					list.add(nb);
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
	
	public static int getallNotifyRentOrderCancelCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE not_id = 5 AND isActive = 1 ";
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
	
	/*===================================================================================================*/
	
	public List<Notificationbean>  getallNotifyCustomCancelOrder() throws SQLException
	{		
		List<Notificationbean> list =new ArrayList<Notificationbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * FROM notification_table WHERE not_id = 6 AND isActive = 1 ";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Notificationbean nb = new Notificationbean();
				nb.setNot_id(r.getString("not_id"));
				nb.setNot_description(r.getString("not_description"));
				nb.setNotDate(r.getString("date1"));
				list.add(nb);
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
	
	public static int getallNotifyCustomCancelCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM notification_table WHERE not_id = 6 AND isActive = 1 ";
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
	
	/*===================================================================================================*/

	public List<Notificationbean> getallNotifyUser() throws SQLException
		{		
				List<Notificationbean> list =new ArrayList<Notificationbean>();
				try
				{
					Connection con=Connect.sqlconnection();
					String query="SELECT * FROM notification_table WHERE not_id = 7 AND isActive = 1 ";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		 			ResultSet r= ps.executeQuery();			
					while(r.next())
					{
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(r.getString("not_id"));
						nb.setNot_description(r.getString("not_description"));
						nb.setNotDate(r.getString("date1"));
						list.add(nb);
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
		
		public static int getallNotifyUserCnt() throws SQLException
		{	
			int cnt=0;
			try
			{
				Connection con=Connect.sqlconnection();
				String query ="SELECT * FROM notification_table WHERE not_id = 7 AND isActive = 1 ";
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
		
		/*===================================================================================================*/
		
		public List<Notificationbean> getallNotifyDealer() throws SQLException
		{		
				List<Notificationbean> list =new ArrayList<Notificationbean>();
				try
				{
					Connection con=Connect.sqlconnection();
					String query="SELECT * FROM notification_table WHERE not_id = 8 AND isActive = 1 ";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		 			ResultSet r= ps.executeQuery();			
					while(r.next())
					{
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(r.getString("not_id"));
						nb.setNot_description(r.getString("not_description"));
						nb.setNotDate(r.getString("date1"));
						list.add(nb);
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
		
		public static int getallNotifyDealerCnt() throws SQLException
		{	
			int cnt=0;
			try
			{
				Connection con=Connect.sqlconnection();
				String query ="SELECT * FROM notification_table WHERE not_id = 8 AND isActive = 1 ";
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
		
		/*===================================================================================================*/
	
		public List<Notificationbean> getallNotifyStock() throws SQLException
		{		
				List<Notificationbean> list =new ArrayList<Notificationbean>();
				try
				{
					Connection con=Connect.sqlconnection();
					String query="SELECT * FROM notification_table WHERE not_id = 9 AND isActive = 1 ";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		 			ResultSet r= ps.executeQuery();			
					while(r.next())
					{
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(r.getString("not_id"));
						nb.setNot_description(r.getString("not_description"));
						nb.setNotDate(r.getString("date1"));
						list.add(nb);
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
		
		public static int getallNotifyStockCnt() throws SQLException
		{	
			int cnt=0;
			try
			{
				Connection con=Connect.sqlconnection();
				String query ="SELECT * FROM notification_table WHERE not_id = 9 AND isActive = 1 ";
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
		
		/*===================================================================================================*/
		
		public List<Notificationbean> getallNotifyRentStock() throws SQLException
		{		
				List<Notificationbean> list =new ArrayList<Notificationbean>();
				try
				{
					Connection con=Connect.sqlconnection();
					String query="SELECT * FROM notification_table WHERE not_id = 10 AND isActive = 1 ";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		 			ResultSet r= ps.executeQuery();			
					while(r.next())
					{
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(r.getString("not_id"));
						nb.setNot_description(r.getString("not_description"));
						nb.setNotDate(r.getString("date1"));
						list.add(nb);
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
		
		public static int getallNotifyRentStockCnt() throws SQLException
		{	
			int cnt=0;
			try
			{
				Connection con=Connect.sqlconnection();
				String query ="SELECT * FROM notification_table WHERE not_id = 10 AND isActive = 1 ";
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
		
		/*===================================================================================================*/
}

package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.RentOrderbean;
import connection.Connect;
public class RentOrderdao 
{
	public static void InsertIntoRentOrderTable(RentOrderbean rob) 
	{
		try 
		{
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd"); //MM/dd/yyyy (“14-Jul-2018”  dd-MMM-yyyy)
			LocalDateTime sd = LocalDateTime.now();
			int d = rob.getDuration();
			LocalDateTime ed = sd.plusMonths(d);   
/*			System.out.println(" START DATE :"+dtf.format(sd));
			System.out.println("END DATE :" +dtf.format(ed));	*/				
			Connection cn= Connect.sqlconnection();		
		    String query="insert into rentOrder_table(rentprodid,rate_per_day,quantity,duration,totalamt,deposite,book_date,end_date,user_id,user_name,email,mobile_no,address,isActive) values(?,?,?,?,?,?,'"+dtf.format(sd)+"','"+dtf.format(ed)+"',?,?,?,?,?,1)";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);			
			ps.setInt(1, rob.getRentProid());
			ps.setString(2, rob.getRentOrderPrice());
			ps.setInt(3, rob.getQunatity());
			ps.setInt(4, rob.getDuration());
			ps.setInt(5, rob.getTotalAmount());
			ps.setInt(6, rob.getDeposite());
			ps.setInt(7, rob.getUserid());
			ps.setString(8, rob.getUsername());
			ps.setString(9, rob.getMail());
			ps.setString(10, rob.getMobnum());
			ps.setString(11, rob.getAdd());
		/*	ps.setString(7, rpb.getStartDate());
			ps.setString(8, rpb.getEndDate());*/
			ps.executeUpdate();
			cn.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public List<RentOrderbean> getallOrderRentProduct() throws SQLException
	{
		List<RentOrderbean> list =new ArrayList<RentOrderbean>();
		try
		{
			Connection con=Connect.sqlconnection();		
			String query ="select * from rentorder_table where isActive=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				RentOrderbean rob=new RentOrderbean();
				rob.setRentOrderId(r.getInt("rentorder_id"));
				rob.setRentProid(r.getInt("rentprodid"));
				rob.setRentOrderPrice(r.getString("rate_per_day"));
				rob.setQunatity(r.getInt("quantity"));
				rob.setDuration(r.getInt("duration"));
				rob.setTotalAmount(r.getInt("totalamt"));
				rob.setDeposite(r.getInt("deposite"));
				rob.setBookDate(r.getString("book_date"));
				rob.setEndDate(r.getString("end_date"));
				rob.setRentProName(r.getString("rentprodname"));
				rob.setRentOrderPrice(r.getString("rentprodprice"));				
				list.add(rob);
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

	public static List<RentOrderbean> getRentOrderProductById(int id) throws SQLException
	{
		List<RentOrderbean> list =new ArrayList<RentOrderbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM rentorder_table INNER JOIN rentproduct_table ON rentorder_table.`rentprodid` = rentproduct_table.`rentprodid` WHERE user_id='"+id+"' AND rentorder_table.`isActive`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				RentOrderbean rob = new RentOrderbean();
				rob.setRentOrderId(r.getInt("rentorder_id"));
				rob.setRentProid(r.getInt("rentprodid"));
				rob.setRentOrderPrice(r.getString("rate_per_day"));
				rob.setQunatity(r.getInt("quantity"));
				rob.setDuration(r.getInt("duration"));
				rob.setTotalAmount(r.getInt("totalamt"));
				rob.setDeposite(r.getInt("deposite"));
				rob.setBookDate(r.getString("book_date"));
				rob.setEndDate(r.getString("end_date"));
				rob.setRentProName(r.getString("rentprodname"));
				rob.setRentOrderPrice(r.getString("rentprodprice"));	
				rob.setRentProPhoto1(r.getString("rentprodphoto1"));
				list.add(rob);
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
	
	public static RentOrderbean getRentOrderByUserId(int uid)
	{
		RentOrderbean rob=new RentOrderbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from rentorder_table where user_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,uid);
			ResultSet r=ps.executeQuery();
			if(r.next())
			{
				rob.setRentOrderId(r.getInt("rentorder_id"));
				rob.setRentProid(r.getInt("rentprodid"));
				rob.setRentOrderPrice(r.getString("rate_per_day"));
				rob.setQunatity(r.getInt("quantity"));
				rob.setDuration(r.getInt("duration"));
				rob.setTotalAmount(r.getInt("totalamt"));
				rob.setDeposite(r.getInt("deposite"));
				rob.setBookDate(r.getString("book_date"));
				rob.setEndDate(r.getString("end_date"));					
				rob.setUserid(r.getInt("user_id"));
				rob.setUsername(r.getString("user_name"));
				rob.setMail(r.getString("email"));
				rob.setMobnum(r.getString("mobile_no"));
				rob.setAdd(r.getString("address"));
			}
			else
			{
				rob=null;
			}
			r.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return rob;
	}
	
	public void deleteRentOrderItem(int id)
	{
		try
			{
				Connection cn= Connect.sqlconnection();		
				String query="update rentorder_table set isActive=0 where rentorder_id=?";
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

	public void updateRentOrderInfo(RentOrderbean rob)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update rentorder_table set user_name=?, email=?, mobile_no=?, address=? where user_id=? ";//AND user_id=?";
			PreparedStatement ps= cn.prepareStatement(query);
			ps.setString(1,rob.getUsername());
			ps.setString(2,rob.getMail());
			ps.setString(3,rob.getMobnum());
			ps.setString(4,rob.getAdd());
			ps.setInt(5,rob.getUserid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String getLastRentOrderId()
	{
		String data = "";
		try
		{
			RentOrderbean rob = new RentOrderbean();
			Connection cn=Connect.sqlconnection();
			String query="SELECT * FROM rentorder_table ORDER BY rentorder_id DESC LIMIT 1";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet r=ps.executeQuery();			
			if(r.next())
			{
				rob.setRentOrderId(r.getInt("rentorder_id"));
				int oid = rob.getRentOrderId();
				rob.setRentProid(r.getInt("rentprodid"));
				int pid= rob.getRentProid();
				rob.setBookDate(r.getString("book_date"));
				String bookdate = rob.getBookDate();
				rob.setEndDate(r.getString("end_date"));
				String enddate = rob.getEndDate();
				rob.setRentOrderPrice(r.getString("rate_per_day"));
				String price = rob.getRentOrderPrice();
				rob.setQunatity(r.getInt("quantity"));
				int qty = rob.getQunatity();
				rob.setDuration(r.getInt("duration"));
				int duration = rob.getDuration();
				rob.setTotalAmount(r.getInt("totalamt"));
				int total = rob.getTotalAmount();
				 data = oid +" " + pid +" " + bookdate+" "+ enddate+" "+price+" "+qty +" "+duration+" "+total;
				return data;
			}
			r.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return data;
	}

	public static boolean CheckItem() 
	{	
		try 
		{
			Connection cn = Connect.sqlconnection();
			String query = "SELECT * FROM rentorder_table WHERE isActive = 1";
			PreparedStatement ps = cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return true ; 
			}
			rs.close();
			ps.close();							
			cn.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}

	public static void deleteItem()
	{	
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="delete from rentorder_table where isActive = 1";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.executeUpdate();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public static int getTotalItem() 
	{
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM rentorder_table WHERE isActive = 1";
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

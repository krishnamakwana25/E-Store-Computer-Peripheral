package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.RentOrderCancelbean;
import connection.Connect;
public class RentOrderCanceldao 
{
	public static void InsertIntoORCancel(RentOrderCancelbean rob) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into rentordercancel_table(orp_id,user_id,rentprodid,urorder_id,reason,doi,dou,isActive)"+ "values(?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, rob.getORPid());
			ps.setInt(2, rob.getUserid());
			ps.setInt(3, rob.getRentProid());
			ps.setString(4, rob.getUserRentOrderid());
			ps.setString(5,rob.getReason());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static List<RentOrderCancelbean> getallcancelRentOrderByUserId(int id) throws SQLException
	{
		List<RentOrderCancelbean> list =new ArrayList<RentOrderCancelbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM rentordercancel_table INNER JOIN orp_table ON rentordercancel_table.`orp_id` = orp_table.`orp_id` INNER JOIN rentproduct_table ON rentordercancel_table.`rentprodid` = rentproduct_table.`rentprodid` WHERE rentordercancel_table.`user_id`='"+id+"' AND rentordercancel_table.`isActive`=1;";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				RentOrderCancelbean orc = new RentOrderCancelbean();
				orc.setORPid(r.getInt("orp_id"));				
				orc.setRentProid(r.getInt("rentprodid"));
				orc.setUserRentOrderid(r.getString("urorder_id"));
				orc.setCancelDate(r.getString("doi"));
				orc.setRentQty(r.getInt("qty"));
				orc.setUserid(r.getInt("user_id"));
				orc.setRentProductPrice(r.getInt("rentprodprice"));
				orc.setRentTotal(r.getInt("total"));				
				orc.setRentProName(r.getString("rentprodname"));
				orc.setRentProPhoto1(r.getString("rentprodphoto1"));
				orc.setDuration(r.getInt("duration"));
				orc.setBookDate(r.getString("start_date"));
				orc.setEndDate(r.getString("end_date"));
				list.add(orc);
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
	
	public static int getallCancelRentOrderByCnt(int id) throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM rentordercancel_table WHERE user_id= '"+id+"' AND isActive = 1";
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

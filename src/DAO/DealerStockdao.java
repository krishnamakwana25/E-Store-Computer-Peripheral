package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.DealerStockbean;
import connection.Connect;
public class DealerStockdao 
{
	public static void insertDealerStock(DealerStockbean db) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="insert into dealerstock_table(dealer_id,product_id,dealer_nm,dealer_mail,dealer_contact_no,stock_qty,is_Active) values(?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, db.getDealerid());
			ps.setInt(2, db.getProductid());
			ps.setString(3, db.getDealername());
			ps.setString(4, db.getDealerMail());
			ps.setString(5, db.getContactNo());
			ps.setInt(6, db.getStockQty());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<DealerStockbean> getStock() throws SQLException
	{
		List<DealerStockbean> list =new ArrayList<DealerStockbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM dealerstock_table INNER JOIN product_table ON dealerstock_table.`product_id` = product_table.`productid` WHERE dealerstock_table.`is_Active`=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				DealerStockbean dsb = new DealerStockbean();
				dsb.setDealerStockid(r.getInt("ds_id"));
				dsb.setDealerid(r.getInt("dealer_id"));
				dsb.setProductid(r.getInt("product_id"));
				dsb.setDealername(r.getString("dealer_nm"));
				dsb.setDealerMail(r.getString("dealer_mail"));
				dsb.setContactNo(r.getString("dealer_contact_no"));				
				dsb.setStockQty(r.getInt("stock_qty"));	
				dsb.setProductName(r.getString("productname"));				
				list.add(dsb);
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

	public void deleteStock(int id1)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="DELETE FROM dealerstock_table WHERE ds_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,id1);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void UpdateStock(int id1) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			String query="update dealerstock_table set is_Active=0 where ds_id=?";
			PreparedStatement ps=cn.prepareStatement(query);
			ps.setInt(1,id1);
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static int getAllDealerStock() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM dealerstock_table WHERE  is_Active = 1";
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

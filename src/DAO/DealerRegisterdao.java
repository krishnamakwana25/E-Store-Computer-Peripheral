// 1 DEALER ACTIVE
// 0 DEALER INACTIVE
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.Dealerregisterbean;
import bean.Userbean;
import connection.Connect;
public class DealerRegisterdao 
{
	static String des="";
	public static void checkDesignation(String designation)
	{
		des=designation;
	}
	public void insertDealer(Dealerregisterbean db)
	{
		try
		{
			Connection cn= Connect.sqlconnection();						
			String query="insert into dealer_register_table(dealernm,mail,contactno,address,password,confimpassword,photo,isActive) values(?,?,?,?,?,?,?,1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, db.getDealername());
			ps.setString(2, db.getDealerMail());
			ps.setString(3, db.getContactNo());
			ps.setString(4, db.getAddress());
			ps.setString(5, db.getDealerPassword());
			ps.setString(6, db.getDealerConfirmPassword());
			ps.setString(7, db.getPhoto());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public boolean exist(String email)
	{
		boolean ans=false;
		try
		{

			Connection cn = Connect.sqlconnection();
			String q="select * from dealer_register_table where mail=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(q);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			if(rs.next())		
				ans=true;			
			rs.close();
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.print(e);	
		}
		return ans;
	}
	public List<Dealerregisterbean> getallDealer() throws SQLException
	{
		List<Dealerregisterbean> list= new ArrayList<Dealerregisterbean>();
		try
		{
			Connection con=Connect.sqlconnection();
			String query="select * from dealer_register_table";	
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet r=ps.executeQuery();
			
			while(r.next())
			{
					Dealerregisterbean db=new Dealerregisterbean();
					db.setDealerid(r.getInt("dealerid"));
					db.setDealername(r.getString("dealernm"));
					db.setDealerMail(r.getString("mail"));
					db.setContactNo(r.getString("contactno"));
					db.setAddress(r.getString("address"));
					db.setDealerPassword(r.getString("password"));
					db.setPhoto(r.getString("photo"));
				//	db.setDealerConfirmPassword(r.getString("confirmpassword"));				
					list.add(db);
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
	public void deleteDealer(int id)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query = "update dealer_register_table set isActive= 0 where dealerid=?";
		/*	String query="delete from dealer_register_table where dealerid=?";*/
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}
	public static Dealerregisterbean getDealerById(int id)
	{
		Dealerregisterbean db=new Dealerregisterbean();
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="select * from dealer_register_table where dealerid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				db.setDealerid(rs.getInt("dealerid"));
				db.setDealername(rs.getString("dealernm"));
				db.setDealerMail(rs.getString("mail"));
				db.setContactNo(rs.getString("contactno"));
				db.setAddress(rs.getString("address"));
				db.setDealerPassword(rs.getString("password"));	
				db.setPhoto(rs.getString("photo"));
				//db.setDealerConfirmPassword(rs.getString("confirmpassword"));
				cn.close();
			}
			else
			{
				db=null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return db;
	}
	public void updateDealer(Dealerregisterbean db)
	{
		try
		{
			Connection cn=Connect.sqlconnection(); /*,  photo=?*/
			String query="update dealer_register_table set dealernm=?, mail=?, contactno=?, address=? where dealerid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,db.getDealername());
			ps.setString(2,db.getDealerMail());
			ps.setString(3, db.getContactNo());
			ps.setString(4,db.getAddress());
			ps.setInt(5, db.getDealerid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static boolean isValidDealer(String email,String password) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();
		if(des.equalsIgnoreCase("Login As Dealer"))
		{
			String pwd1 = DealerRegisterdao.encrypt(password);
			query="SELECT * FROM dealer_register_table WHERE mail='"+email+"' AND password='"+pwd1+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				return true;
			}
			rs.close();
			ps.close();
		}	
		cn.close();
		return false;
	}
	
	public static int getDealerIdByMail(String mailid) throws SQLException
	{
		Connection con=Connect.sqlconnection();
		if(des.equalsIgnoreCase("Login As Dealer"))
		{			
			String query="SELECT * from dealer_register_table WHERE mail='"+mailid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			if(rs.next())
			{
				return rs.getInt("dealerid");
			}
		}
		con.close();
		return 0;
	}
	
	public static Userbean getUserById(int id)
	{
		Userbean sb=new Userbean();
		try
		{
			if(des.equalsIgnoreCase("Login As Dealer"))
			{
				Dealerregisterbean db=new Dealerregisterbean();
				Connection cn=Connect.sqlconnection();
				String query="select * from dealer_register_table where dealerid=?";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					db.setDealerid(rs.getInt("dealerid"));
					db.setDealername(rs.getString("dealernm"));
					db.setDealerMail(rs.getString("mail"));
					db.setContactNo(rs.getString("contactno"));
					db.setAddress(rs.getString("address"));
					db.setDealerPassword(rs.getString("password"));
					db.setPhoto(rs.getString("photo"));
				}
				else
				{
					db=null;
				}
				cn.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sb;
	}
	
	public static int getallDealersCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM dealer_register_table WHERE  isActive = 1";
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
	
	public static String encrypt(String s)
	{
		/*char p[]={'a','b','c','d','e','f','g','h',
			'i','j','k','l','m','n','o','p','q','r','s','t','u',
			'v','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};

		char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
			  'K','L','Z','X','C','V','B','N','M','0','9','8','7','6','5','4','3',
			  '2','1'};		*/
		char p[]={'A','B','C','D','E','F','G','H',
				'I','J','K','L','M','N','O','P','Q','R','S','T','U',
				'V','W','X','Y','Z',
				
				'a','b','c','d','e','f','g','h',
				'i','j','k','l','m','n','o','p','q','r','s','t','u',
				'v','w','x','y','z',
				
				'1','2','3','4','5','6','7','8','9','0','!','@','#','$','%','&','*'};

		char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
			  'K','L','Z','X','C','V','B','N','M',
			  
			  'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j',
			  'k','l','z','x','c','v','b','n','m',
			  
			  '0','9','8','7','6','5','4','3','2','1','*','&','%','$','#','@','!'};
		
		/*s=s.toLowerCase();	*/	
		char c[]= new char [(s.length())];
			for(int i=0;i<s.length();i++)
			{
				for(int j=0;j<69;j++)
				{
					if(p[j] == s.charAt(i))
					{
						c[i] = ch[j];
						break;
					}
				}
			}
			return (new String(c));	
	}
	
	public static String decrypt(String s)
	{
		/*char p[]={'a','b','c','d','e','f','g','h',
			'i','j','k','l','m','n','o','p','q','r','s','t','u',
			'v','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};

		char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
			  'K','L','Z','X','C','V','B','N','M','0','9','8','7','6','5','4','3',
			  '2','1'};		*/
		char p[]={'A','B','C','D','E','F','G','H',
				'I','J','K','L','M','N','O','P','Q','R','S','T','U',
				'V','W','X','Y','Z',
				
				'a','b','c','d','e','f','g','h',
				'i','j','k','l','m','n','o','p','q','r','s','t','u',
				'v','w','x','y','z',
				
				'1','2','3','4','5','6','7','8','9','0','!','@','#','$','%','&','*'};

		char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
			  'K','L','Z','X','C','V','B','N','M',
			  
			  'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j',
			  'k','l','z','x','c','v','b','n','m',
			  
			  '0','9','8','7','6','5','4','3','2','1','*','&','%','$','#','@','!'};
		
		char p1[]= new char [(s.length())];
			for(int i=0;i<s.length();i++)
			{
				for(int j=0;j<69;j++)
				{
					if(ch[j] == s.charAt(i))
					{
						p1[i] = p[j];
						break;
					}
				}
			}
		return (new String(p1));		
	}
	
	public static void updateNewPassword(Dealerregisterbean db) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update dealer_register_table set password=?, confimpassword= ? where mail= ?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,db.getDealerPassword());
			ps.setString(2, db.getDealerConfirmPassword());
			ps.setString(3,db.getDealerMail());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void updatePassword(Dealerregisterbean db)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update dealer_register_table set password=?, confimpassword=? where dealerid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,db.getDealerPassword());
			ps.setString(2, db.getDealerConfirmPassword());
			ps.setInt(3,db.getDealerid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void updatePhoto(Dealerregisterbean dealer) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update dealer_register_table set photo=? where dealerid=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);		
			ps.setString(1, dealer.getPhoto());
			ps.setInt(2, dealer.getDealerid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	} 
	
	public static boolean isDealerActive(int id) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();	
		query="SELECT * FROM dealer_register_table WHERE dealerid = '"+id+"' AND isActive = 1 ";
		PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
		rs.close();
		ps.close();						
		cn.close();
		return false;
	}
	
	public void IsActiveDealer(int id) 
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update dealer_register_table set isActive = 1  where dealerid=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
	}	
}

/*=====================================================================================================*/

/*public static String encrypt(String s)
{
	char p[]={'a','b','c','d','e','f','g','h',
		'i','j','k','l','m','n','o','p','q','r','s','t','u',
		'v','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};

	char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
		  'K','L','Z','X','C','V','B','N','M','0','9','8','7','6','5','4','3',
		  '2','1'};
	char p[]={'a','b','c','d','e','f','g','h',
			'i','j','k','l','m','n','o','p','q','r','s','t','u',
			'v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','!','@','#','$','%','&','*'};

	char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
		  'K','L','Z','X','C','V','B','N','M','0','9','8','7','6','5','4','3',
		  '2','1','*','&','%','$','#','@','!'};	
	s=s.toLowerCase();
	char c[]= new char [(s.length())];
		for(int i=0;i<s.length();i++)
		{
			for(int j=0;j<43;j++)
			{
				if(p[j] == s.charAt(i))
				{
					c[i] = ch[j];
					break;
				}
			}
		}
		return (new String(c));	
}

public static String decrypt(String s)
{
	char p[]={'a','b','c','d','e','f','g','h',
		'i','j','k','l','m','n','o','p','q','r','s','t','u',
		'v','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};

	char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
		  'K','L','Z','X','C','V','B','N','M','0','9','8','7','6','5','4','3',
		  '2','1'};
	char p[]={'a','b','c','d','e','f','g','h',
			'i','j','k','l','m','n','o','p','q','r','s','t','u',
			'v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','!','@','#','$','%','&','*'};

	char ch[]={'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J',
		  'K','L','Z','X','C','V','B','N','M','0','9','8','7','6','5','4','3',
		  '2','1','*','&','%','$','#','@','!'};	
	char p1[]= new char [(s.length())];
		for(int i=0;i<s.length();i++)
		{
			for(int j=0;j<43;j++)
			{
				if(ch[j] == s.charAt(i))
				{
					p1[i] = p[j];
					break;
				}
			}
		}
		return (new String(p1));		
}*/


package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import bean.Adminbean;
import connection.Connect;
public class Admindao 
{
	static String des="";
	public static void checkDesignation(String designation)
	{
		des=designation;
	}
	public static boolean isValidAdmin(String email,String password) throws SQLException
	{
		String query = "";
		String pwd1 = Admindao.encrypt(password);
		Connection cn=Connect.sqlconnection();			
		query="SELECT * FROM admin_table WHERE email='"+email+"' AND password='"+pwd1+"'";
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

	public static int getAdminIdByMail(String mail) 
	{			
		try 
		{
			Connection con=Connect.sqlconnection();
			String query="SELECT * from admin_table WHERE email='"+mail+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			if(rs.next())
			{
				return rs.getInt("a_id");
			}
			con.close();
			return 0;
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return 0;		
	}

	public static Adminbean getAdminById(int id) 
	{
		Adminbean ab=new Adminbean();
		try 
		{			
			Connection cn=Connect.sqlconnection();
			String query="select * from admin_table where a_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				ab.setAdmin_id(rs.getInt("a_id"));		
				ab.setFirstName(rs.getString("firstname"));
				ab.setLastName(rs.getString("lastname"));
				ab.setPhoto(rs.getString("photo"));
				ab.setAddress(rs.getString("address"));
				ab.setMobileNo(rs.getString("mobileno"));
				ab.setPassword(rs.getString("password"));
				ab.setConfirmPassword(rs.getString("confirmpassword"));
				ab.setEmail(rs.getString("email"));				
			}
			else
			{
				ab=null;
			}	
			cn.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}		
		return ab;
	}

	public static void updateProfile(Adminbean ab) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();/*photo=?,*/
			String query="update admin_table set firstname=?, lastname=?, address=?, mobileno=?, email=? where a_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,ab.getFirstName());
			ps.setString(2, ab.getLastName());
			/*ps.setString(3, ab.getPhoto());*/
			ps.setString(3, ab.getAdress());
			ps.setString(4, ab.getMobileNo());
			ps.setString(5, ab.getEmail());			
			ps.setInt(6, ab.getAdmin_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	public static void updatePhoto(Adminbean ab) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update admin_table set photo=? where a_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);		
			ps.setString(1, ab.getPhoto());
			ps.setInt(2, ab.getAdmin_id());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	public void updatePassword(Adminbean ub)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update admin_table set password=?, confirmpassword=? where a_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,ub.getPassword());
			ps.setString(2, ub.getConfirmPassword());
			ps.setInt(3,ub.getAdmin_id());
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
			String q="select * from admin_table where email=?";
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
	
	public static void updateNewPassword(Adminbean ab) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update admin_table set password=?, confirmpassword=? where email=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,ab.getPassword());
			ps.setString(2, ab.getConfirmPassword());
			ps.setString(3,ab.getEmail());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
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
}
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
	}	
*/
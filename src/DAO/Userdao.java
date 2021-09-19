// 1 USER ACTIVE
// 0 USER INACTIVE
package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Userbean;
import connection.Connect;
public class Userdao
{
	static String des="";
	public static void checkDesignation(String designation)
	{
		des=designation;
	}
	public void insertuser(Userbean ub)
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into user_table(user_name,password,cpassword,email,mobile_no,address,area,city,state,photo,isActive,doi,dou) values(?,?,?,?,?,?,?,?,?,?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, ub.getUsername());
			ps.setString(2, ub.getPassword());
			ps.setString(3, ub.getConfirmPassword());
			ps.setString(4, ub.getMail());
			ps.setString(5, ub.getMobnum());
			ps.setString(6, ub.getAdd());
			ps.setString(7, ub.getAreaname());
			ps.setString(8, ub.getCityname());
			ps.setString(9, ub.getStatename());
			ps.setString(10,ub.getPhoto());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Userbean> getallUser() throws SQLException
	{
		List<Userbean> list= new ArrayList<Userbean>();
		try
		{
			Connection con=Connect.sqlconnection();			
			String query="SELECT * FROM user_table INNER JOIN area_table ON user_table.`area`=area_table.`area_id` INNER JOIN city_table ON user_table.`city`=city_table.`city_id` INNER JOIN `state_table` ON user_table.`state`=state_table.`state_id`";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet r=ps.executeQuery();
			while(r.next())
			{
					Userbean ub=new Userbean();
					ub.setUserid(r.getInt("user_id"));
					ub.setUsername(r.getString("user_name"));
					ub.setPassword(r.getString("password"));
					ub.setPassword(r.getString("cpassword"));
					ub.setMail(r.getString("email"));
					ub.setMobnum(r.getString("mobile_no"));
					ub.setAdd(r.getString("address"));				
					ub.setAreaname(r.getString("area_name"));
					ub.setCityname(r.getString("city_name"));
					ub.setStatename(r.getString("state_name"));	
					ub.setPhoto(r.getString("photo"));	
					list.add(ub);
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
	public void deleteuser(int id)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update user_table set isActive=0  where user_id=?";
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
	
	public void updateUser(Userbean ub)
	{
		try
		{
			Connection cn=Connect.sqlconnection(); /*, photo=?*/
			String query="update user_table set user_name=?, email=?, mobile_no=?, address=? where user_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,ub.getUsername());
			ps.setString(2,ub.getMail());
			ps.setString(3,ub.getMobnum());
			ps.setString(4,ub.getAdd());
			/*ps.setString(5,ub.getPhoto());*/
			ps.setInt(5,ub.getUserid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 
	
	public static boolean isValidUser(String email,String password) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();
		if(des.equalsIgnoreCase("Login As User"))
		{				
			String pwd1 = Userdao.encrypt(password);
			query="SELECT * FROM user_table WHERE email='"+email+"' AND password='"+pwd1+"'";
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
		/*if(rs.next())
		{
			pwd = rs.getString("password");
			System.out.println("pwd : "+pwd);
			if (pwd.equalsIgnoreCase(pwd1)) 
			//if(pwd == pwd1)
			{
				System.out.println("pwd in loop: "+pwd);
				System.out.println("true");
				temp = 1 ; 
				if(temp==1)
				{			
					if(rs.next())
					{
						return true;
					}
				}
				else
				{
					return false;
				}
			}			
		}*/
	}
	
	public static boolean isUserActive(int id) throws SQLException
	{
		String query="";
		Connection cn=Connect.sqlconnection();	
		query="SELECT * FROM user_table WHERE user_id = '"+id+"' AND isActive = 1 ";
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
	
	public static int getUserIdByMail(String mailid) throws SQLException
	{
		Connection con=Connect.sqlconnection();
		if(des.equalsIgnoreCase("Login As User"))
		{
			
			String query="SELECT * from user_table WHERE email='"+mailid+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet rs= ps.executeQuery();	
			if(rs.next())
			{
				return rs.getInt("user_id");
			}
			rs.close();
			ps.close();
			con.close();
		}	
		return 0;
	}
	
	public static Userbean getUserById(int id)
	{
		Userbean sb=new Userbean();
		try
		{
			if(des.equalsIgnoreCase("Login As User"))
			{
				Connection cn=Connect.sqlconnection();
				String query="select * from user_table where user_id=?";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ps.setInt(1,id);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					sb.setUserid(rs.getInt("user_id"));
					sb.setUsername(rs.getString("user_name"));
					sb.setPassword(rs.getString("password"));
					/*sb.setConfirmPassword(rs.getString("cpassword"));*/
					sb.setMail(rs.getString("email"));
					sb.setMobnum(rs.getString("mobile_no"));
					sb.setAdd(rs.getString("address"));
					sb.setAid(rs.getInt("area"));
					sb.setCid(rs.getInt("city"));
					sb.setSid(rs.getInt("state"));
					sb.setPhoto(rs.getString("photo"));
				}
				else
				{
					sb=null;
				}
				rs.close();
				ps.close();
				cn.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sb;
	}
	
	public boolean exist(String email)
	{
		boolean ans=false;
		try
		{

			Connection cn = Connect.sqlconnection();
			String q="select * from user_table where email=?";
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
	
	public void updateProfile(Userbean ub)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update user_table set user_name=?, email=?, mobile_no=?,address=? where user_id=? ";
			PreparedStatement ps= cn.prepareStatement(query);
			ps.setString(1,ub.getUsername());
			ps.setString(2,ub.getMail());
			ps.setString(3,ub.getMobnum());
			ps.setString(4,ub.getAdd());
			ps.setInt(5,ub.getUserid());		
		 	ps.executeUpdate();
			ps.close();
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
	
	public void updatePassword(Userbean ub)
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update user_table set password=?, cpassword=? where user_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,ub.getPassword());
			ps.setString(2, ub.getConfirmPassword());
			ps.setInt(3,ub.getUserid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	} 
	
	public static int getallUsersCnt() throws SQLException
	{	
		int cnt=0;
		try
		{
			Connection con=Connect.sqlconnection();
			String query ="SELECT * FROM user_table WHERE  isActive = 1";
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
	public static void updateNewPassword(Userbean ub) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update user_table set password=?, cpassword= ? where email= ?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1,ub.getPassword());
			ps.setString(2, ub.getConfirmPassword());
			ps.setString(3,ub.getMail());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static void updatePhoto(Userbean ub) 
	{
		try
		{
			Connection cn=Connect.sqlconnection();
			String query="update user_table set photo=? where user_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);		
			ps.setString(1, ub.getPhoto());
			ps.setInt(2, ub.getUserid());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	public void UpdateuserStatus2(int id) 
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update user_table set status = 2  where user_id=?";
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
	public void IsActiveUser(int id) 
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update user_table set isActive = 1  where user_id=?";
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
	public void UpdateuserStatus1(int id)
	{
		try
		{
			Connection con=Connect.sqlconnection();
			String query="update user_table set status = 1  where user_id=?";
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
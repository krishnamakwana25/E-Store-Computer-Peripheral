package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import bean.Feedbackbean;
import connection.Connect;
public class Feedbackdao 
{
	public void insertfeedback(Feedbackbean fb) 
	{
		try
		{
			Connection cn= Connect.sqlconnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now = LocalDateTime.now();
			String query="insert into feedback_table(name,email,topic,satisfaction,message,is_Active,doi,dou) values(?,?,?,?,?,1,'"+dtf.format(now)+"','"+dtf.format(now)+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, fb.getName());
			ps.setString(2, fb.getMail());
			ps.setString(3, fb.getFeedbackTopic());
			ps.setString(4, fb.getFeedbackSatisfaction());
			ps.setString(5, fb.getFeedbackMessage());
			ps.executeUpdate();
			cn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<Feedbackbean> getallFeedback() throws SQLException
	{
		List<Feedbackbean> list =new ArrayList<Feedbackbean>();
		try
		{
			Connection con=Connect.sqlconnection();				
			String query ="select * from feedback_table WHERE is_Active=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
 			ResultSet r= ps.executeQuery();			
			while(r.next())
			{
				Feedbackbean fb = new Feedbackbean();
				fb.setFeedbackid(r.getInt("feedback_id"));
				fb.setName(r.getString("name"));
				fb.setMail(r.getString("email"));
				fb.setFeedbackTopic(r.getString("topic"));
				fb.setFeedbackSatisfaction(r.getString("satisfaction"));
				fb.setFeedbackMessage(r.getString("message"));
				list.add(fb);
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
	
	public void deleteFeedback(int id)
	{
		try
		{
			Connection cn= Connect.sqlconnection();		
			String query="update feedback_table set is_Active=0 where feedback_id=?";
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

}

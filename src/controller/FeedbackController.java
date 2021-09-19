package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Feedbackdao;
import bean.Feedbackbean;
@WebServlet("/FeedbackController")
public class FeedbackController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		String action=req.getParameter("action");	
		if(action.equalsIgnoreCase("Send Your Message!"))
		{
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}	
			else
			{		
				Feedbackbean fb=new Feedbackbean();
				fb.setMail(req.getParameter("name"));
				fb.setName(req.getParameter("email"));
				fb.setFeedbackTopic(req.getParameter("topic"));
				fb.setFeedbackSatisfaction(req.getParameter("satisfaction"));
				fb.setFeedbackMessage(req.getParameter("message"));
				Feedbackdao fd=new Feedbackdao();
				fd.insertfeedback(fb);
				res.sendRedirect("user/index1_user.jsp");
			}			
		}
		else if(action.equalsIgnoreCase("Send Your Message"))
		{
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}	
			else
			{
				Feedbackbean fb=new Feedbackbean();
				fb.setMail(req.getParameter("name"));
				fb.setName(req.getParameter("email"));
				fb.setFeedbackTopic(req.getParameter("topic"));
				fb.setFeedbackSatisfaction(req.getParameter("satisfaction"));
				fb.setFeedbackMessage(req.getParameter("message"));
				Feedbackdao fd=new Feedbackdao();
				fd.insertfeedback(fb);
				res.sendRedirect("dealer/index1_dealer.jsp");
			}
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));		
			Feedbackdao fd=new Feedbackdao();
			fd.deleteFeedback(id);
			res.sendRedirect("admin/viewfeedback.jsp");		
		}
		else
		{
			res.sendRedirect("user/user_login.jsp?msg=email Or Password Wrong..!");
		}
	}
}

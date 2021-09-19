package controller;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.RateToProductdao;
import bean.RateToProductbean;
@WebServlet("/RateToProductController")
public class RateToProductController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();	
		String action=req.getParameter("action");
		int checkid= (Integer) session.getAttribute("id");
		if(action.equalsIgnoreCase("Submit"))
		{	
			int pid ; 
			pid = Integer.parseInt(req.getParameter("pid1").trim());			
			boolean t;
			try 
			{
				t = RateToProductdao.getRatingByProUserId(pid,checkid);
				 if(t)
				 {
					 res.sendRedirect("user/myOrders.jsp");
				 }
				 else
				 {
					 RateToProductbean rtpb = new RateToProductbean();
					 String rating = req.getParameter("rateus"); 					 
  					 String ouid = req.getParameter("ouid1");
					 int uid1 = Integer.parseInt(req.getParameter("userid"));						
					 pid = Integer.parseInt(req.getParameter("pid1").trim());
					 int opid = Integer.parseInt(req.getParameter("opid1").trim());									
					 rtpb.setUserid(uid1);
					 rtpb.setUserOrderid(ouid);
					 rtpb.setOPid(opid);
					 rtpb.setProductid(pid);
					 rtpb.setRating(rating);
					 RateToProductdao.InsertRating(rtpb); 
					 res.sendRedirect("user/myOrders.jsp");
				 }			
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		else if (action.equalsIgnoreCase("Give Ratings"))
		{
			int id=Integer.parseInt(req.getParameter("pid"));
			int opid=Integer.parseInt(req.getParameter("opid").trim());
			String ouid=req.getParameter("ouid");
			session.setAttribute("opid", opid);
			session.setAttribute("ouid", ouid);
			res.sendRedirect("user/ratingtoproduct.jsp?id="+id);
		}
	}
}


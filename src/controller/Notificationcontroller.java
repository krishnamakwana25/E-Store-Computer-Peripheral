package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Notificationdao;
@WebServlet("/Notificationcontroller")
public class Notificationcontroller extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{			
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Clear All"))
		{
			Notificationdao nd= new Notificationdao();				
			nd.deleteNotification();
			res.sendRedirect("admin/index.jsp");
		}			
	}
}

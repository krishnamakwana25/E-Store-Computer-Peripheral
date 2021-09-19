package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Contactusdao;
import bean.Contactbean;
@WebServlet("/ContactusController")
public class ContactusController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		HttpSession session = req.getSession();
		if(action.equalsIgnoreCase("Send Your Message!"))
		{
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}	
			else
			{
				Contactbean cb=new Contactbean();
				cb.setName(req.getParameter("name"));
				cb.setEmail(req.getParameter("email"));
				cb.setMobile_no(req.getParameter("mobile_no"));
				cb.setMessage(req.getParameter("message"));
				Contactusdao cd=new Contactusdao();
				cd.insertcontactus(cb);					
				res.sendRedirect("user/contact_usByUser.jsp?msg=success");
			/* res.sendRedirect("user/user_register.jsp?msg=alReg"); */
			}
		}
		if(action.equalsIgnoreCase("Send Your Message"))
		{
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}	
			else
			{
				Contactbean cb=new Contactbean();
				cb.setName(req.getParameter("name"));
				cb.setEmail(req.getParameter("email"));
				cb.setMobile_no(req.getParameter("mobile_no"));
				cb.setMessage(req.getParameter("message"));
				Contactusdao cd=new Contactusdao();
				cd.insertcontactus(cb);					
			/* res.sendRedirect("dealer/index1_dealer.jsp"); */
				res.sendRedirect("dealer/index1_dealer.jsp?msg=success");
			}
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));			
			Contactusdao cd=new Contactusdao();
			cd.deletecontactus(id);				
			res.sendRedirect("admin/viewcontact-us.jsp");
		}
	}
}
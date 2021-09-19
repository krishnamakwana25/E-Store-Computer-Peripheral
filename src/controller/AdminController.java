package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
/*import javax.servlet.http.Cookie;*/
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Admindao;
import bean.Adminbean;
@WebServlet("/AdminController")
public class AdminController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action = req.getParameter("action");
		int aid = 0 ;
		boolean status = false;
		String mail = req.getParameter("email");
		String pwd = req.getParameter("password");		
		try 
		{
			status = Admindao.isValidAdmin(mail, pwd);
			
		}
		catch (SQLException e)
		{			
			e.printStackTrace();
		}
		
		try
		{
			aid = Admindao.getAdminIdByMail(mail);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}		
		Adminbean ab = Admindao.getAdminById(aid); 
		if(action.equalsIgnoreCase("Login"))
		{		
			if(status)
			{							
				/*COOKIES*/	
				/*Cookie ck1= new Cookie("email1",mail);
				Cookie ck2 = new Cookie("password", pwd);
				res.addCookie(ck1);
				res.addCookie(ck2);*/
				/*COOKIES OVER*/
				
				
			/*	PrintWriter out = res.getWriter();
			 * 	System.out.println("USER NAME IS : "+ck1.getValue());
				System.out.println("PASSWORD IS : "+ck2.getValue());
				Cookie ck[] = req.getCookies();
				System.out.println("Length of cookie is : "+ck.length);
				out.println("\n User Name1 : "+ck[0].getValue());
				out.println("\n Password : "+ck[1].getValue());*/
				
				
				HttpSession session = req.getSession(true);
				session.setAttribute("email", mail);
				session.setAttribute("aid", ab.getAdmin_id());
				PrintWriter out= res.getWriter();
				out.println("<script src=\"resources/js/sweetalert.js\" type=\"text/javascript\"></script>");
				out.println("<script src=\"resources/js/sweetalert.min.js\" type=\"text/javascript\"></script>");
				out.println("<link href=\"resources/css/sweetalert.css\" rel=\"stylesheet\">");
				out.println("<link href=\"resources/css/sweetalert.min.css\" rel=\"stylesheet\">");
				out.println("<link href=\"resources/css/sweetalert.min.css.map\" rel=\"stylesheet\">");
				
				out.println("<script>");				
				out.println("function fun1(){");
				out.println("swal('Success!','Successfully login','success');");
				out.println("}</script>");
				out.println("<body onload=\"fun1()\">");
				res.sendRedirect("admin/index.jsp");
			}	
			else
			{
				/* res.sendRedirect("admin/logintry.jsp?msg=mail Or Password Wrong..!"); */
				res.sendRedirect("admin/logintry.jsp?msg=failed");
			}
		}
	}
}	

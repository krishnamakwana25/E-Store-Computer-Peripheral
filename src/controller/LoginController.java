package controller;
import java.io.IOException;
import java.sql.SQLException;
/*import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;*/
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Admindao;
import DAO.DealerRegisterdao;
import DAO.Userdao;
/*import bean.Adminbean;*/
import bean.Dealerregisterbean;
import bean.Userbean;
@WebServlet("/LoginController")
public class LoginController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");			
		String des = req.getParameter("designation");
		int id=0,id1 = 0;
		Userdao.checkDesignation(des);
		DealerRegisterdao.checkDesignation(des);
		Admindao.checkDesignation(des);
		boolean status = false, status1 = false, check = false, check1 = false;/* status2 = false;*/
		try
		{
			status = Userdao.isValidUser(email,pass);
			status1 = DealerRegisterdao.isValidDealer(email,pass);
		/*	status2 = Admindao.isValidAdmin(email, pass);*/
		}
		catch (SQLException e1) 
		{
			e1.printStackTrace();
		}		
		try
		{
			id = Userdao.getUserIdByMail(email);
			id1 = DealerRegisterdao.getDealerIdByMail(email);
			/*aid = Admindao.getAdminIdByMail(email);*/
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		Userbean ub = Userdao.getUserById(id);
		Dealerregisterbean db = DealerRegisterdao.getDealerById(id1);
		/*Adminbean ab = Admindao.getAdminById(aid);*/
		if(action.equalsIgnoreCase("Login"))
		{
			if(status)
			{
				HttpSession session= req.getSession(true);
				if(des.equalsIgnoreCase("Login As User"))
				{
					try 
					{
						check = Userdao.isUserActive(id);
						if(check)
						{					
							session.setAttribute("email", email);
							session.setAttribute("id", ub.getUserid());
							/*COOKIES*/
						
						/*	Cookie ck1= new Cookie("email1",email);
							Cookie ck2 = new Cookie("password", pass);
							res.addCookie(ck1);
							res.addCookie(ck2);*/
						
							/*COOKIES OVER*/
							
						/*	PrintWriter out = res.getWriter();
						 System.out.println("USER NAME IS : "+ck1.getValue());
							System.out.println("PASSWORD IS : "+ck2.getValue());
							Cookie ck[] = req.getCookies();
							System.out.println("Length of cookie is : "+ck.length);
							out.println("\n User Name1 : "+ck[0].getValue());
							out.println("\n Password : "+ck[1].getValue());*/
							
							res.sendRedirect("user/index1_user.jsp");
						}
						else
						{
							res.sendRedirect("user/user_login.jsp?msg=blocked");
						}
					} 
					catch (SQLException e) 					
					{
						e.printStackTrace();
					}
					
				}
			}
			else if(status1)
			{		
				HttpSession session= req.getSession(true);
				 if(des.equalsIgnoreCase("Login As Dealer"))
				{
					 try 
					 {
						check1 = DealerRegisterdao.isDealerActive(id1);
						 if(check1)
						 {
							session.setAttribute("email", email);
							session.setAttribute("id", db.getDealerid());
							res.sendRedirect("dealer/index1_dealer.jsp");
						 }
						 else
						 {
							 res.sendRedirect("user/user_login.jsp?msg=blocked");
						 }
					 }
					 catch (SQLException e) 
					 {					
						e.printStackTrace();
					}					
				}				
			}
			/*else if(status2)
			{						
				HttpSession session = req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("aid", ab.getAdmin_id());
				res.sendRedirect("admin/index.jsp");
			}	*/
			else
			{
				/* res.sendRedirect("user/user_login.jsp?msg=email Or Password Wrong..!"); */
				res.sendRedirect("user/user_login.jsp?msg=failed");
			}
		}
		else
		{
			/* res.sendRedirect("user/user_login.jsp?msg=email Or Password Wrong..!"); */
			res.sendRedirect("user/user_login.jsp?msg=failed");
		}
	}	
}
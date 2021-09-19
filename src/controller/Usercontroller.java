package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import DAO.DealerRegisterdao;
import DAO.Notificationdao;
import DAO.Userdao;
import bean.Dealerregisterbean;
import bean.Notificationbean;
import bean.Userbean;
import mail.mailOrder;
@WebServlet("/Usercontroller")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10mb
maxFileSize = 1024 * 1024 * 50, // 50mb
maxRequestSize = 1024 * 1024 * 100)
public class Usercontroller extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("Register")) 
		{
			Part part = req.getPart("photo");
			String path = req.getServletContext().getRealPath("/") + "\\uploadimg\\" + part.getSubmittedFileName();
			part.write(path);
			Userbean user = new Userbean();
			String unm = req.getParameter("usernm");
			user.setUsername(unm);
			String pwd = req.getParameter("upassword");
			String pwd1 = Userdao.encrypt(pwd);
			user.setPassword(pwd1);
			String cnfrmpwd = req.getParameter("ucofirmpassword");
			String cnfrmpwd1 = Userdao.encrypt(cnfrmpwd);
			user.setConfirmPassword(cnfrmpwd1);
			String mail = req.getParameter("email");
			user.setMail(mail);
			user.setMobnum(req.getParameter("mobileno"));
			user.setAdd(req.getParameter("address"));
			user.setAreaname(req.getParameter("selectarea"));
			user.setCityname(req.getParameter("selectcity"));
			user.setStatename(req.getParameter("selectstate"));
			user.setPhoto(part.getSubmittedFileName());
			Userdao ud = new Userdao();
			if (ud.exist(mail)) 
			{
				/*
				 * System.out.println("hy u r alredy registered"); PrintWriter out=
				 * res.getWriter(); out.
				 * println("<script src=\"resources/js/sweetalert2.all.min.js\" type=\"text/javascript\"></script>"
				 * ); out.println("<script src=\"resources/alert/sweetalert.js\"></script>");
				 * out.println("<script>"); out.println("function fun1(){");
				 * out.println("swal('Error!','You are already registered with "+mail+
				 * "','error');"); out.println("}</script>");
				 * out.println("<body onload=\"fun1()\">");
				 * res.sendRedirect("user/user_login.jsp");
				 */
				res.sendRedirect("user/user_register.jsp?msg=alReg");
			}
			else 
			{
				ud.insertuser(user);
				/* ================== */
				/* NOtification */
				String nid = "7";
				String not_des = "New User - User Registered - " + unm + "";
				Notificationbean nb = new Notificationbean();
				nb.setNot_id(nid);
				nb.setNot_description(not_des);
				Notificationdao.InsertIntoNotification(nb);
				/* ======================= */
				res.sendRedirect("user/user_login.jsp");
				System.out.println("hy welcome");
			}
		} 
		else if (action.equalsIgnoreCase("Active"))
		{
			int id = Integer.parseInt(req.getParameter("id"));
			Userdao ud = new Userdao();
			ud.deleteuser(id);
			//ud.UpdateuserStatus2(id);
			/* req.getRequestDispatcher("viewuser.jsp").forward(req,res); */
			res.sendRedirect("admin/viewuser.jsp");
		}
		else if (action.equalsIgnoreCase("InActive"))
		{
			int id = Integer.parseInt(req.getParameter("id"));
			Userdao ud = new Userdao();
			ud.IsActiveUser(id);
			//ud.UpdateuserStatus1(id);
			/* req.getRequestDispatcher("viewuser.jsp").forward(req,res); */
			res.sendRedirect("admin/viewuser.jsp");
		}
		else if (action.equalsIgnoreCase("Edit")) 
		{
			int id = Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updateuser.jsp?id=" + id);
		}
		else if (action.equalsIgnoreCase("Update")) 
		{
			Userbean ub = new Userbean();
			ub.setUserid(Integer.parseInt(req.getParameter("userid")));
			ub.setUsername(req.getParameter("updateuser"));
			ub.setMail(req.getParameter("updatemail"));
			ub.setMobnum(req.getParameter("updatemobile"));
			ub.setAdd(req.getParameter("updateaddress"));
			/* ub.setPhoto(req.getParameter("updatephoto")); */
			Userdao ud = new Userdao();
			ud.updateUser(ub);
			res.sendRedirect("user/profile.jsp");
		}
		else if (action.equalsIgnoreCase("Change Password"))
		{
			Userbean ub = new Userbean();
			Userdao ud = new Userdao();
			String pwd = req.getParameter("updatenewpwd");
			String pwd1 = Userdao.encrypt(pwd);
			ub.setPassword(pwd1);
			String cnfrmpwd = req.getParameter("updatenewconfirmpwd");
			String cnfrmpwd1 = Userdao.encrypt(cnfrmpwd);
			ub.setConfirmPassword(cnfrmpwd1);
			ub.setUserid(Integer.parseInt(req.getParameter("userid")));
			ud.updatePassword(ub);
			res.sendRedirect("user/profile.jsp");
		}
		else if (action.equalsIgnoreCase("searchUserItem")) 
		{
			String name1 = req.getParameter("productname1");
			res.sendRedirect("user/searchItemByUser.jsp?productname1=" + name1);
		} 
		else if (action.equalsIgnoreCase("search")) 
		{
			String name = req.getParameter("productname");
			res.sendRedirect("user/searchItem.jsp?productname=" + name); // +"?maincat="+maincat1+"?subcat="+subcat1
		}
		else if (action.equalsIgnoreCase("Save")) {
			
			String name = req.getParameter("productname");
			res.sendRedirect("user/searchbar.jsp?productname=" + name);
		}
		else if (action.equalsIgnoreCase("Edit Profile")) 
		{
			int id1 = Integer.parseInt(req.getParameter("id1"));
			res.sendRedirect("user/EditProfile.jsp?id1=" + id1);
		}
		else if (action.equalsIgnoreCase("Save Profile")) 
		{
			Userbean ub = new Userbean();
			int id = (Integer.parseInt(req.getParameter("id1")));
			ub.setUserid(id);
			ub.setMail(req.getParameter("mail"));
			ub.setUsername(req.getParameter("unm"));
			ub.setMobnum(req.getParameter("mobileno"));
			ub.setAdd(req.getParameter("add"));
			ub.setUserid(Integer.parseInt(req.getParameter("id1")));
			Userdao ud = new Userdao();
			ud.updateProfile(ub);
			res.sendRedirect("user/profile.jsp");
		} 
		else if (action.equalsIgnoreCase("Submit")) 
		{
			String mail = req.getParameter("Email");
			Userdao ud = new Userdao();
			DealerRegisterdao dd = new DealerRegisterdao();
			if (ud.exist(mail)) 
			{
				String subject = "Your Password has been reset";
				String body = "Hi,\nThis is your new password: ";
				String newpwd = mailOrder.sendPasswordViaMail(mail, subject, body);
				Userbean ub = new Userbean();
				ub.setMail(mail);
				String pwd1 = Userdao.encrypt(newpwd);
				ub.setPassword(pwd1);
				ub.setConfirmPassword(pwd1);
				Userdao.updateNewPassword(ub);
				String message = "";
				try 
				{
					message = "Your password has been reset. Please check your e-mail.";
				}
				catch (Exception ex) 
				{
					ex.printStackTrace();
					message = "There were an error: " + ex.getMessage();
				}
				finally 
				{
					req.setAttribute("message", message);
					int num = 1;
					req.getRequestDispatcher("user/message.jsp?num=" + num).forward(req, res);
				}
			}
			else if (dd.exist(mail))
			{
				String subject = "Your Password has been reset";
				String body = "Hi,\nThis is your new password: ";
				String newpwd = mailOrder.sendPasswordViaMail(mail, subject, body);
				Dealerregisterbean dealer = new Dealerregisterbean();
				dealer.setDealerMail(mail);
				String pwd1 = DealerRegisterdao.encrypt(newpwd);
				dealer.setDealerPassword(pwd1);
				dealer.setDealerConfirmPassword(pwd1);
				DealerRegisterdao.updateNewPassword(dealer);
				String message = "";
				try 
				{
					message = "Your password has been reset. Please check your e-mail.";
				}
				catch (Exception ex) 
				{
					ex.printStackTrace();
					message = "There were an error: " + ex.getMessage();
				}
				finally 
				{
					req.setAttribute("message", message);
					int num = 1;
					req.getRequestDispatcher("user/message.jsp?num=" + num).forward(req, res);
				}
			} 
			else 
			{
				System.out.println("Invalid Login");
				int num = 2;
				String message = "Please enter valid e-mail by which you are registered.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("user/message.jsp?num=" + num).forward(req, res);
			}
		}
		else if (action.equalsIgnoreCase("Submit Your Mail")) 
		{
			String mail = req.getParameter("Email");
			Userdao ud = new Userdao();
			DealerRegisterdao dd = new DealerRegisterdao();
			if (ud.exist(mail)) 
			{
				String subject = "Your Password has been reset";
				String body = "Hi,\nThis is your new password: ";
				String newpwd = mailOrder.sendPasswordViaMail(mail, subject, body);
				Userbean ub = new Userbean();
				ub.setMail(mail);
				String pwd1 = Userdao.encrypt(newpwd);
				ub.setPassword(pwd1);
				ub.setConfirmPassword(pwd1);
				Userdao.updateNewPassword(ub);
				String message = "";
				try 
				{
					message = "Your password has been reset. Please check your e-mail.";
				} 
				catch (Exception ex) 
				{
					ex.printStackTrace();
					message = "There were an error: " + ex.getMessage();
				}
				finally 
				{
					req.setAttribute("message", message);
					int num = 1;
					req.getRequestDispatcher("user/message1.jsp?num=" + num).forward(req, res);
				}
			}
			else if (dd.exist(mail))
			{
				String subject = "Your Password has been reset";
				String body = "Hi,\nThis is your new password: ";
				String newpwd = mailOrder.sendPasswordViaMail(mail, subject, body);
				Dealerregisterbean dealer = new Dealerregisterbean();
				dealer.setDealerMail(mail);
				String pwd1 = DealerRegisterdao.encrypt(newpwd);
				dealer.setDealerPassword(pwd1);
				dealer.setDealerConfirmPassword(pwd1);
				DealerRegisterdao.updateNewPassword(dealer);
				String message = "";
				try 
				{
					message = "Your password has been reset. Please check your e-mail.";
				} 
				catch (Exception ex)
				{
					ex.printStackTrace();
					message = "There were an error: " + ex.getMessage();
				}
				finally 
				{
					req.setAttribute("message", message);
					int num = 1;
					req.getRequestDispatcher("user/message1.jsp?num=" + num).forward(req, res);
				}
			} 
			else 
			{
				System.out.println("Invalid Login");
				int num = 2;
				String message = "Please enter valid e-mail by which you are registered.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("user/message1.jsp?num=" + num).forward(req, res);
			}
		}
		else if(action.equalsIgnoreCase("Change Photo"))
		{
			Part part = req.getPart("photo");
			String path= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part.getSubmittedFileName();
			part.write(path);		
			Userbean ub = new Userbean();
			int uid = Integer.parseInt(req.getParameter("userid"));
			ub.setUserid(uid);
			ub.setPhoto(part.getSubmittedFileName());
			Userdao.updatePhoto(ub);
			res.sendRedirect("user/profile.jsp");
		}
	}
}
package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import DAO.Admindao;
import bean.Adminbean;
import mail.mailOrder;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10mb
maxFileSize = 1024 * 1024 * 50, // 50mb
maxRequestSize = 1024 * 1024 * 100)
@WebServlet("/AdminProfileController")
public class AdminProfileController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action = req.getParameter("action");
		if(action.equalsIgnoreCase("Save Profile"))
		{
			System.out.println("Hy");
		/*	Part part = req.getPart("photo");
			String path= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part.getSubmittedFileName();
			part.write(path);*/
			int aid = Integer.parseInt(req.getParameter("adminid"));
			String fnm = req.getParameter("firstname");
			String lnm = req.getParameter("lastname");
			String address = req.getParameter("address");
			String mobileno = req.getParameter("mobileno");
			String email = req.getParameter("email");				
			Adminbean ab = new Adminbean();
			ab.setAdmin_id(aid);
			ab.setFirstName(fnm);
			ab.setLastName(lnm);
			ab.setAddress(address);
			ab.setMobileNo(mobileno);
			ab.setEmail(email);
			/*ab.setPhoto(part.getSubmittedFileName());*/
			Admindao.updateProfile(ab);
			res.sendRedirect("admin/profile.jsp");
		}
		else if(action.equalsIgnoreCase("Change Password"))
		{
			Adminbean ab = new Adminbean();
			Admindao ad =new Admindao();			
			String pwd = req.getParameter("updatenewpwd");
			String pwd1 = Admindao.encrypt(pwd);
			ab.setPassword(pwd1);
			String cnfrmpwd = req.getParameter("updatenewconfirmpwd");
			String cnfrmpwd1 = Admindao.encrypt(cnfrmpwd);
			ab.setConfirmPassword(cnfrmpwd1);			
			ab.setAdmin_id(Integer.parseInt(req.getParameter("adminid")));
			ad.updatePassword(ab);
			res.sendRedirect("admin/profile.jsp");
		}
		else if(action.equalsIgnoreCase("Submit"))
		{
			String mail = req.getParameter("Email");
			Admindao ad =new Admindao();
			if(ad.exist(mail))
			{
				 String subject = "Your Password has been reset";
				 String body = "Hi Admin, \nThis is your new password: " ;			        
				 String newpwd= mailOrder.sendPasswordViaMail(mail,subject,body);
				 Adminbean ab = new Adminbean();		
				 ab.setEmail(mail);
				 String pwd1 = Admindao.encrypt(newpwd);
				 ab.setPassword(pwd1);
				 ab.setConfirmPassword(pwd1);
				 Admindao.updateNewPassword(ab);
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
		            int num = 1 ;
		            req.getRequestDispatcher("admin/message.jsp?num="+num).forward(req, res);
			     }
			}		
			else
			{
				System.out.println("Invalid Login");
				int num = 2 ;
				String message = "Please enter your valid e-mail.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("admin/message.jsp?num="+num).forward(req, res);
			}
		}
		else if(action.equalsIgnoreCase("Submit Your Mail"))
		{
			String mail = req.getParameter("Email");
			Admindao ad =new Admindao();
			if(ad.exist(mail))
			{
				 String subject = "Your Password has been reset";
				 String body = "Hi Admin,\nThis is your new password: " ;			        
				 String newpwd= mailOrder.sendPasswordViaMail(mail,subject,body);
				 Adminbean ab = new Adminbean();		
				 ab.setEmail(mail);
				 String pwd1 = Admindao.encrypt(newpwd);
				 ab.setPassword(pwd1);
				 ab.setConfirmPassword(pwd1);
				 Admindao.updateNewPassword(ab);
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
		            int num = 1 ;
		            req.getRequestDispatcher("admin/message1.jsp?num="+num).forward(req, res);
			     }
			}		
			else
			{
				System.out.println("Invalid Login");
				int num = 2 ;
				String message = "Please enter your valid e-mail.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("admin/message1.jsp?num="+num).forward(req, res);
			}
		}
		else if(action.equalsIgnoreCase("Change Photo"))
		{
			Part part = req.getPart("photo");
			String path= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part.getSubmittedFileName();
			part.write(path);		
			Adminbean ab = new Adminbean();	
			int aid = Integer.parseInt(req.getParameter("adminid"));
			ab.setAdmin_id(aid);
			ab.setPhoto(part.getSubmittedFileName());
			Admindao.updatePhoto(ab);
			res.sendRedirect("admin/profile.jsp");
		}
	}
}
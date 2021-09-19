package controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import DAO.DealerRegisterdao;
import DAO.Notificationdao;
import bean.Dealerregisterbean;
import bean.Notificationbean;
import mail.mailOrder;
@WebServlet("/DealerRegisterController")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    //10mb
maxFileSize=1024*1024*50,       //50mb
maxRequestSize=1024*1024*100)
public class DealerRegisterController extends HttpServlet
{  
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Register As Dealer"))
		{			
			Part part = req.getPart("photo");
			String path= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part.getSubmittedFileName();
			part.write(path);
			Dealerregisterbean dealer=new Dealerregisterbean();
			String dealernm = req.getParameter("dealernm");
			dealer.setDealername(dealernm);
			String mail = req.getParameter("email");
			dealer.setDealerMail(mail);
			dealer.setContactNo(req.getParameter("contactno"));
			dealer.setAddress(req.getParameter("address"));
			
			String pwd = req.getParameter("password");
			String pwd1 = DealerRegisterdao.encrypt(pwd);
			dealer.setDealerPassword(pwd1);
			String cnfrmpwd = req.getParameter("cofirmpassword");
			String cnfrmpwd1 = DealerRegisterdao.encrypt(cnfrmpwd);
			dealer.setDealerConfirmPassword(cnfrmpwd1);
			dealer.setPhoto(part.getSubmittedFileName());
			DealerRegisterdao dd=new DealerRegisterdao();
			if(dd.exist(mail))
			{
				System.out.println("hy u r alredy registered");
				PrintWriter out= res.getWriter();
				out.println("<script src=\"resources/js/sweetalert2.all.min.js\" type=\"text/javascript\"></script>");
				out.println("<script>");				
				out.println("function fun1(){");
				out.println("swal('Error!','You are already registered with "+mail+"','error');");
				out.println("}</script>");
				out.println("<body onload=\"fun1()\">");  				
				res.sendRedirect("user/user_login.jsp");
			}						
			else
			{
				dd.insertDealer(dealer);
				/*=========Notification=========*/				
				String nid = "8" ;
				String not_des = "New Dealer -New Dealer Registered - "+dealernm+"";
				Notificationbean nb = new Notificationbean();
				nb.setNot_id(nid);
				nb.setNot_description(not_des);			
				Notificationdao.InsertIntoNotification(nb);
				/*=======================*/
			res.sendRedirect("user/user_login.jsp");
			}
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
		
		}
		else if (action.equalsIgnoreCase("Active"))
		{
			int id=Integer.parseInt(req.getParameter("dealerid"));
			DealerRegisterdao sd=new DealerRegisterdao();
			sd.deleteDealer(id);		
			res.sendRedirect("admin/viewdealers.jsp");
		}
		else if (action.equalsIgnoreCase("InActive"))
		{
			int id=Integer.parseInt(req.getParameter("dealerid"));
			DealerRegisterdao sd=new DealerRegisterdao();
			sd.IsActiveDealer(id);		
			res.sendRedirect("admin/viewdealers.jsp");
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updateDealer.jsp?id="+id);
		}
	/*	else if(action.equalsIgnoreCase("Update"))
		{
			Dealerregisterbean db=new Dealerregisterbean();
			db.setDealerid(Integer.parseInt(req.getParameter("id")));
			db.setDealername(req.getParameter("updatedealernm"));
			db.setDealerMail(req.getParameter("updatemail"));
			db.setContactNo(req.getParameter("updatecontactno"));
			db.setAddress(req.getParameter("updateaddress"));
			db.setDealerPassword(req.getParameter("updatepwd"));
			db.setDealerConfirmPassword(req.getParameter("updateconfirmpwd"));
			DealerRegisterdao dd =new DealerRegisterdao();
			dd.updateDealer(db);
			res.sendRedirect("admin/viewDealer.jsp");
		}*/
		else if(action.equalsIgnoreCase("searchDealerItem"))
		{
			String name1 = req.getParameter("productname1");
			res.sendRedirect("dealer/searchItemByDealerID.jsp?productname1="+name1);
		}
		else if(action.equalsIgnoreCase("search"))
		{
			String name = req.getParameter("productname");
			res.sendRedirect("dealer/searchItem.jsp?productname="+name); //+"?maincat="+maincat1+"?subcat="+subcat1
		}
		else if(action.equalsIgnoreCase("Change Password"))
		{
			Dealerregisterbean dealer=new Dealerregisterbean();
			DealerRegisterdao dd =new DealerRegisterdao();			
			String pwd = req.getParameter("updatenewpwd");
			String pwd1 = DealerRegisterdao.encrypt(pwd);
			dealer.setDealerPassword(pwd1);
			String cnfrmpwd = req.getParameter("updatenewconfirmpwd");
			String cnfrmpwd1 = DealerRegisterdao.encrypt(cnfrmpwd);
			dealer.setDealerConfirmPassword(cnfrmpwd1);			
			dealer.setDealerid(Integer.parseInt(req.getParameter("dealerid")));
			dd.updatePassword(dealer);
			res.sendRedirect("dealer/DealerProfile.jsp");
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			Dealerregisterbean dealer=new Dealerregisterbean();
			dealer.setDealerid(Integer.parseInt(req.getParameter("dealerid")));
			dealer.setDealername(req.getParameter("updateuser"));
			dealer.setDealerMail(req.getParameter("updatemail"));
			dealer.setContactNo(req.getParameter("updatemobile"));
			dealer.setAddress(req.getParameter("updateaddress"));
			/*dealer.setPhoto(req.getParameter("updatephoto"));*/
			DealerRegisterdao dd =new DealerRegisterdao();
			dd.updateDealer(dealer);
			res.sendRedirect("dealer/DealerProfile.jsp");
		}
		else if(action.equalsIgnoreCase("Submit Your Mail"))
		{
			String mail = req.getParameter("Email");
			DealerRegisterdao dd =new DealerRegisterdao();
			if(dd.exist(mail))
			{
				 String subject = "Your Password has been reset";
				 String body = "Hi,\nThis is your new password: " ;			        
				 String newpwd= mailOrder.sendPasswordViaMail(mail,subject,body);
				 Dealerregisterbean dealer=new Dealerregisterbean();	
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
		            int num = 1 ;
		            req.getRequestDispatcher("dealer/message1.jsp?num="+num).forward(req, res);
			     }
			}		
			else
			{
				System.out.println("Invalid Login");
				int num = 2 ;
				String message = "Please enter your valid e-mail.";
				req.setAttribute("message", message);
				req.getRequestDispatcher("dealer/message1.jsp?num="+num).forward(req, res);
			}
		}
		else if(action.equalsIgnoreCase("Change Photo"))
		{
			Part part = req.getPart("photo");
			String path= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part.getSubmittedFileName();
			part.write(path);		
			Dealerregisterbean dealer=new Dealerregisterbean();
			int did = Integer.parseInt(req.getParameter("dealerid"));
			dealer.setDealerid(did);
			dealer.setPhoto(part.getSubmittedFileName());
			DealerRegisterdao.updatePhoto(dealer);
			res.sendRedirect("dealer/DealerProfile.jsp");
		}
	}
}


package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.DealerStockdao;
import bean.DealerStockbean;
import mail.mailOrder;
@WebServlet("/DealerStockController")
public class DealerStockController  extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{	
		String action=req.getParameter("action");	
		HttpSession session = req.getSession();
		int id  = (Integer) session.getAttribute("id");
		if(action.equalsIgnoreCase("Send"))
		{
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{		
				int proid=Integer.parseInt(req.getParameter("proid"));						
				String dealermail = req.getParameter("email");			
				String contactno = req.getParameter("contactno");				
				int qty = Integer.parseInt(req.getParameter("qty"));
				String dealername  = req.getParameter("dealername");				
				DealerStockbean dsb = new DealerStockbean();
				dsb.setDealerid(id);
				dsb.setProductid(proid);
				dsb.setDealername(dealername);
				dsb.setDealerMail(dealermail);
				dsb.setContactNo(contactno);
				dsb.setStockQty(qty);
				DealerStockdao.insertDealerStock(dsb);
				res.sendRedirect("dealer/QuickOutOfStockItem.jsp");
			}
		}
		else if(action.equalsIgnoreCase("Decline"))
		{
			int id1=Integer.parseInt(req.getParameter("id"));		
			DealerStockdao dsd=new DealerStockdao();
			dsd.deleteStock(id1);
			res.sendRedirect("admin/dealerStock.jsp");		
		}
		else if(action.equalsIgnoreCase("Accept"))
		{
			int id1=Integer.parseInt(req.getParameter("id"));		
			DealerStockdao dsd=new DealerStockdao();
			dsd.UpdateStock(id1);
			String dealermail = req.getParameter("email");	
			String dealername  = req.getParameter("dealername");
			String subject ="Your request regarding to stock has been accepted";
			String body = "Hey, "+dealername+"\nWe accept your request regarding to the stock which you are going to provide us.\nWe will do further process regarding to stock and price. \nThank You..! ";
			mailOrder.ResponseTodealerStock(dealermail,subject,body);
			res.sendRedirect("admin/dealerStock.jsp");		
		}
		else
		{
			res.sendRedirect("user/user_login.jsp?msg=email Or Password Wrong..!");
		}
	}
}	
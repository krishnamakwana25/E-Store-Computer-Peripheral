package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.CustomCancelorderdao;
import DAO.CustomOPStatusdao;
import DAO.CustomeOPdao;
import DAO.Custproddao;
import DAO.Notificationdao;
import bean.CustProdBean;
import bean.CustomCancelOrderbean;
import bean.CustomOpStatusBean;
import bean.CustomeOPbean;
import bean.Notificationbean;
import mail.mailOrder;
@WebServlet("/CustomCancelOrderController")
public class CustomCancelOrderController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();	
		String action=req.getParameter("action");
		String email = (String) session.getAttribute("email");
		int checkid= (Integer) session.getAttribute("id");
		if(action.equalsIgnoreCase("Submit"))
		{		
			String customuoid = req.getParameter("customuoid");			
			String reason = req.getParameter("reason");
			String unm = req.getParameter("username");
			String subject ="Order update - Your customize order has been cancelled";
			String body = "Dear "+unm+",\nYour customize order has been cancelled, Your customize order id is "+customuoid+"\n\nThank You";
			 mailOrder.sendCancelOrderViaMail(email,subject,body);				
			
			CustomCancelOrderbean ccob = new CustomCancelOrderbean();	
			int pid = 0 ,copid = 0 ;
			int uid1 = Integer.parseInt(req.getParameter("userid"));
			if(checkid==uid1)
			{
				try 
				{								
					List<CustomeOPbean> ccopb = CustomeOPdao.getallOPByUserOrderId(customuoid);				
						for(CustomeOPbean cop: ccopb)
						{								
							ccob.setCustomProductid(cop.getCustomProductid());
							ccob.setCustomOPid(cop.getCustomOPid());
							copid = cop.getCustomOPid();
							pid = cop.getCustomProductid();
							ccob.setCustomUserOrderid(customuoid);
							ccob.setPCName(cop.getPCName());
							ccob.setReason(reason);
							ccob.setUserid(checkid);			
							CustomCancelorderdao.InsertIntoCustomOrderCancel(ccob);							
							CustomeOPdao.CancelOrder(cop.getCustomOPid(),customuoid);
							/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
							int id = cop.getCustomProductid();
							int qty = cop.getCustomOrderQty();
							int totalqty = cop.getCustomProductQty1();
							int finalqty = qty + totalqty ; 
							CustProdBean cpb1 = new CustProdBean();
							cpb1.setCustproid(id);
							cpb1.setCustproqty(finalqty);
							Custproddao.SetQuantityAftrOrder(cpb1);
							/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
							
							String nid = "6" ;
							String not_des = "Customize Cancel Order - \nOrder I'd "+customuoid+" is cancelled";
							Notificationbean nb = new Notificationbean();
							nb.setNot_id(nid);
							nb.setNot_description(not_des);
							Notificationdao.InsertIntoNotification(nb);
						}
						List<CustomOpStatusBean> orp1 = CustomOPStatusdao.getCustomOrderStatus(copid,pid,checkid);
						for(CustomOpStatusBean orpb: orp1)
						{	
							orpb.setCustomizeprodid(pid);
							orpb.setStatus_id(orpb.getStatus_id());
							CustomOPStatusdao.deleteCustomOrderStatus(orpb);
						}
					}
					catch (Exception e) 
					{			
						e.printStackTrace();
					}						
				res.sendRedirect("user/customMyOrders.jsp");
			}
		}
	}
}
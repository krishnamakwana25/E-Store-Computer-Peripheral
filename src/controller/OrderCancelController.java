package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.Notificationdao;
import DAO.OrderCanceldao;
import DAO.OrderProductdao;
import DAO.OrderStatusdao;
import DAO.Productdao;
import bean.Notificationbean;
import bean.OrderCancelbean;
import bean.OrderProductbean;
import bean.OrderStatusBean;
import bean.Productbean;
import mail.mailOrder;
@WebServlet("/OrderCancelController")
public class OrderCancelController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();	
		String action=req.getParameter("action");
		String email = (String) session.getAttribute("email");
		int checkid= (Integer) session.getAttribute("id");
		int pid1 = 0 ;
		if(action.equalsIgnoreCase("Submit"))
		{		
			String ouid = req.getParameter("ouid");			
			String reason = req.getParameter("reason");
			String unm = req.getParameter("username");
			String subject ="Order update - Your order has been cancelled";
			String body = "Dear "+unm+",\nYour order has been cancelled, Your order id is "+ouid+"\n\nThank You";
			 mailOrder.sendCancelOrderViaMail(email,subject,body);				
			
			OrderCancelbean ocb = new OrderCancelbean();	
			int uid1 = Integer.parseInt(req.getParameter("userid"));
			int opid = Integer.parseInt(req.getParameter("opid"));
			if(checkid==uid1)
			{
				try 
				{								
					List<OrderProductbean> opb1 = OrderProductdao.getallOPByUserOrderId(ouid);				
						for(OrderProductbean opb: opb1)
						{								
							ocb.setProductid(opb.getProductid());
							pid1 = opb.getProductid() ;
							ocb.setOPid(opb.getOPid());
							ocb.setUserOrderid(ouid);
							ocb.setReason(reason);
							ocb.setUserid(checkid);			
							OrderCanceldao.InsertIntoOrderCancel(ocb);
							OrderProductdao.CancelOrder(opb.getOPid(),ouid);
							
							/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
							int id = opb.getProductid();
							int qty = opb.getOrderQty();
							int totalqty = opb.getProductQty1();
							int finalqty = qty + totalqty ; 
							Productbean pb1 = new Productbean();
							pb1.setProductid(id);
							pb1.setProductQty1(finalqty);
							Productdao.SetQuantityAftrOrder(pb1);
							/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
							
							String nid = "4" ;
							String not_des = "Cancel Order - \nOrder I'd "+ouid+"is cancelled";
							Notificationbean nb = new Notificationbean();
							nb.setNot_id(nid);
							nb.setNot_description(not_des);
							Notificationdao.InsertIntoNotification(nb);
						}
						List<OrderStatusBean> opb2 = OrderStatusdao.getOrderStatus(opid,pid1, checkid);				
						for(OrderStatusBean opb: opb2)
						{	
							opb.setProduct_id(pid1);
							opb.setStatus_id(opb.getStatus_id());
							OrderStatusdao.deleteOrderStatus(opb);
						}
					}
					catch (Exception e) 
					{			
						e.printStackTrace();
					}						
					res.sendRedirect("user/myOrders.jsp");
			}
		}
	}
}

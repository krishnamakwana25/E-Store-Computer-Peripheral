package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.Notificationbean;
import bean.ORPStatusBean;
import bean.ORPbean;
import bean.RentOrderCancelbean;
import bean.Rentprodbean;
import mail.mailOrder;
import DAO.Notificationdao;
import DAO.ORPStatusdao;
import DAO.ORPdao;
import DAO.RentOrderCanceldao;
import DAO.Rentproddao;
@WebServlet("/RentOrderCancelController")
public class RentOrderCancelController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();	
		String action=req.getParameter("action");
		String email = (String) session.getAttribute("email");
		if(action.equalsIgnoreCase("Submit"))
		{
			int checkid= (Integer) session.getAttribute("id");
			String ouid = req.getParameter("ouid");
			String reason = req.getParameter("reason");
			String unm = req.getParameter("username");
			String subject ="Rent Order update - Your rent order has been cancelled";
			String body = "Dear "+unm+",\nYour rent order has been cancelled, Your order id is "+ouid+"\n\nThank You";
			 mailOrder.sendCancelOrderViaMail(email,subject,body);				
			 int pid1 = 0, orpid = 0;
			RentOrderCancelbean rob = new RentOrderCancelbean();	
			int uid1 = Integer.parseInt(req.getParameter("userid"));
			if(checkid==uid1)
			{
				try 
				{								
					List<ORPbean> opb1 = ORPdao.getallORPByUserOrderId(ouid);				
					for(ORPbean opb: opb1)
					{								
						rob.setRentProid(opb.getRentProid());
						pid1 = opb.getRentProid();
						rob.setORPid(opb.getORPid());
						orpid = opb.getORPid();
						rob.setUserRentOrderid(ouid);
						rob.setReason(reason);
						rob.setUserid(checkid);			
						RentOrderCanceldao.InsertIntoORCancel(rob);
						ORPdao.CancelRentOrder(opb.getORPid(),ouid);											
						/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
						int id = opb.getRentProid();
						int qty = opb.getQuantity();
						int totalqty = opb.getProductQty1();						
						int finalqty = qty + totalqty ; 
						Rentprodbean rpb1 = new Rentprodbean();
						rpb1.setRentProid(id);
						rpb1.setRentProductQty1(finalqty);						
						Rentproddao.SetQuantityAftrOrder(rpb1);
						/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
						
						String nid = "5" ;
						String not_des = "Rent Order Cancel - \nOrder I'd "+ouid+"is cancelled";
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(nid);
						nb.setNot_description(not_des);
						Notificationdao.InsertIntoNotification(nb);
					}
					List<ORPStatusBean> orpb2 = ORPStatusdao.getRentOrderStatus(orpid, pid1, checkid);			
					for(ORPStatusBean orpb: orpb2)
					{	
						orpb.setRentprodid(pid1);
						orpb.setStatus_id(orpb.getStatus_id());
						ORPStatusdao.deleteRentOrderStatus(orpb);
					}
				}
				catch (Exception e) 
				{			
					e.printStackTrace();
				}						
				res.sendRedirect("user/myRentOrders.jsp");
			}
		}
	}
}
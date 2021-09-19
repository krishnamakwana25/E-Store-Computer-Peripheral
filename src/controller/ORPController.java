package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Notificationdao;
import DAO.ORPStatusdao;
import DAO.ORPdao;
import DAO.RentOrderdao;
import DAO.Rentproddao;
import bean.Notificationbean;
import bean.ORPbean;
import bean.ORPStatusBean;
import bean.RentOrderbean;
import bean.Rentprodbean;
import mail.mailOrder;
@WebServlet("/ORPController")
public class ORPController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{	
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Place Order"))
		{
			HttpSession session = req.getSession();
			String email = (String) session.getAttribute("email");
			String data = RentOrderdao.getLastRentOrderId();
			String data1[] = data.split(" ");
			String roid1 = data1[0];
			String rpid1 = data1[1];
			String sd = data1[2];
			String ed = data1[3];
			String p = data1[4];
			String q = data1[5];
			String d = data1[6];
			String t = data1[7];
			ORPbean orp = new ORPbean();
			ORPStatusBean osrb = new ORPStatusBean();
			int roid = Integer.parseInt(roid1.trim());
			int checkid= (Integer) session.getAttribute("id");
			int rpid = Integer.parseInt(rpid1.trim());
			String startdate = sd;
			String enddate = ed;
			int price = Integer.parseInt(p.trim());
			int qty = Integer.parseInt(q.trim());			
			int duration = Integer.parseInt(d.trim());
			int total = Integer.parseInt(t.trim());
			String ptype = req.getParameter("COD");
			
			String rpnm = req.getParameter("rpnm");
			String orderdate = req.getParameter("orderdate");
			String username = req.getParameter("username");			
			String subject ="Rent Order Confirmation - Your rent order has been booked";
			String body = "Your rent order has been booked for "+rpnm+"\n\nOrder Details:-\n\nOrder Date : "+orderdate+"\nStart Date : "+sd+"\nEnd Date : "+ed+"\nProduct Name : "+rpnm+"\nProduct Price : "+price+"\nQuantity : "+qty+"\nDuration(Month) : "+duration+"\nTotal Price : "+total+"\nYour rent order id : ";
			String ruorderid = mailOrder.sendMail(email,subject,body,username);	

			orp.setRentOrderId(roid);
			orp.setUserid(checkid);
			orp.setRentProid(rpid);
			orp.setUserRentOrderid(ruorderid);
			orp.setBookDate(startdate);
			orp.setEndDate(enddate);
			orp.setPrice(price);
			orp.setQuantity(qty);
			orp.setDuration(duration);
			orp.setOrderTotal(total);
			orp.setPaymnetType(ptype);
			
			ORPdao.InsertIntoORP(orp);
			RentOrderdao rod = new RentOrderdao();			
			try
			{
				List<RentOrderbean> ro1 = RentOrderdao.getRentOrderProductById(checkid);
				for(RentOrderbean ro: ro1)
				{	
					rod.deleteRentOrderItem(ro.getRentOrderId());
				}
			}
			catch (SQLException e) 
			{				
				e.printStackTrace();
			}						
			int totalqty = Rentproddao.GetTotalQTY(rpid);									
			int tqty = totalqty - qty ; 
			Rentprodbean rpb1 = new Rentprodbean();
			rpb1.setRentProid(rpid);
			rpb1.setRentProductQty1(tqty);		
			Rentproddao.SetQuantityAftrOrder(rpb1);		
			/*NOTIFICATIONS*/
			if(tqty == 0 )
			{
				String nid = "10" ;
				String not_des = "Out of Stock  - \nRent Product : "+rpid+" id is Out of Stock";
				Notificationbean nb = new Notificationbean();
				nb.setNot_id(nid);
				nb.setNot_description(not_des);
				Notificationdao.InsertIntoNotification(nb);
			}
			String nid = "2" ;
			String not_des = "Rent Order - \nYou have rent order";
			Notificationbean nb = new Notificationbean();
			nb.setNot_id(nid);
			nb.setNot_description(not_des);
			Notificationdao.InsertIntoNotification(nb);
			/*===========================*/			
			/*FOR STATUS*/
			try 
			{
				List<ORPbean> orp1 = ORPdao.getallORPByUserIdForStatus(checkid);
				for(ORPbean orpb: orp1)
				{
					osrb.setOrp_id(orpb.getORPid());
					osrb.setUser_id(checkid);
					osrb.setRentprodid(rpid);
					String  status = "Ordered" ;
					osrb.setStatus(status);
					ORPStatusdao.InsertIntoRentStatus(osrb);							
				}
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
			/*FOR STATUS*/
			res.sendRedirect("user/rentOrder.jsp");	
		}
		
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			ORPdao orp=new ORPdao();
			orp.deleteRentOrder(id);			
			res.sendRedirect("admin/viewRentOrders.jsp");
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			ORPStatusBean osb = new ORPStatusBean();
			String status = req.getParameter("status");
			int status_id = Integer.parseInt(req.getParameter("id"));
			osb.setStatus(status);
			osb.setStatus_id(status_id);
			ORPStatusdao.updateStatus(osb);
			res.sendRedirect("admin/viewRentOrderStatus.jsp");
		}
	}
}

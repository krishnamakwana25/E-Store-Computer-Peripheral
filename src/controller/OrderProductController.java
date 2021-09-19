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

import bean.Notificationbean;
import bean.OrderProductbean;
import bean.OrderStatusBean;
import bean.Orderbean;
import bean.Productbean;
import mail.mailOrder;
import DAO.Notificationdao;
import DAO.OrderProductdao;
import DAO.OrderStatusdao;
import DAO.Orderdao;
import DAO.Productdao;
@WebServlet("/OrderProductController")
public class OrderProductController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{	
		HttpSession session = req.getSession();
		String action=req.getParameter("action");
		
		if(action.equalsIgnoreCase("Place Order"))
		{
			int checkid= (Integer) session.getAttribute("id");			
			String email = (String) session.getAttribute("email");
			String pnm = req.getParameter("pnm");
			String orderdate = req.getParameter("orderdate");
			String username = req.getParameter("username");
			int price = Integer.parseInt(req.getParameter("price"));
			int qty1 = Integer.parseInt(req.getParameter("qty"));
			int total = Integer.parseInt(req.getParameter("total"));
			String subject ="Order Confirmation - Your order has been booked";
			String body = "Your order has been booked for "+pnm+"\n\nOrder Details:-\n\nOrder Date : "+orderdate+"\nProduct Name : "+pnm+"\nProduct Price : "+price+"\nQuantity : "+qty1+"\nTotal Price : "+total+"\nYour order id : ";
			String userorderid = mailOrder.sendMail(email,subject,body,username);				
			Orderdao od = new Orderdao();
			OrderProductbean op = new OrderProductbean();	
			OrderStatusBean osb = new OrderStatusBean();
			int uid1 = Integer.parseInt(req.getParameter("userid"));
			int proid = Integer.parseInt(req.getParameter("pid"));
			int qty=0,totalqty=0,tqty=0,pid1=0;
			if(checkid==uid1)
			{
				String ptype = req.getParameter("COD");				
				try 
				{
					int q = Productdao.GetTotalQTY(proid);
					if(q>0)
					{
						List<Orderbean> o1 = Orderdao.getallOrdersByUserId(checkid);
						for(Orderbean order: o1)
						{				
							qty = order.getProductQty();
							op.setOrderid(order.getOrderid());
							op.setUserid(checkid);
							pid1 = order.getProductid();
							op.setProductid(pid1);
							op.setUserOrderid(userorderid);
							op.setOrderPlaceDate(order.getBookdate());
							op.setOrderQty(qty);
							op.setOrderPrice(order.getProductPrice());
							op.setOrderTotal(order.getProductTotalPrice());
							op.setPaymnetType(ptype);			
							
							OrderProductdao.InsertIntoOP(op);									
							od.deleteOrderItem(order.getOrderid());
							totalqty = order.getProductQty1();													
							tqty = totalqty - qty ; 
							Productbean pb1 = new Productbean();
							pb1.setProductid(pid1);
							pb1.setProductQty1(tqty);							
							Productdao.SetQuantityAftrOrder(pb1);
							/*NOTIFICATIONS*/
							if(tqty == 0 )
							{
								String nid = "9" ;
								String not_des = "Out of Stock  - \nProduct : "+proid+" id is Out of Stock";
								Notificationbean nb = new Notificationbean();
								nb.setNot_id(nid);
								nb.setNot_description(not_des);
								Notificationdao.InsertIntoNotification(nb);
							}
							String nid = "1" ;
							String not_des = "Order - \nYou have an order";
							Notificationbean nb = new Notificationbean();
							nb.setNot_id(nid);
							nb.setNot_description(not_des);
							Notificationdao.InsertIntoNotification(nb);
							/*NOTIFICATIONS*/
						}
						/*FOR STATUS*/
						List<OrderProductbean> opb1 = OrderProductdao.getallOPByUserIdForStatus(checkid);
						for(OrderProductbean order: opb1)
						{
							osb.setOp_id(order.getOPid());
							osb.setUser_id(checkid);
							osb.setProduct_id(pid1);
							String  status = "Ordered" ;
							osb.setStatus(status);
							OrderStatusdao.InsertIntoStatus(osb);							
						}
						/*FOR STATUS*/
					}
					else
					{
						System.out.println("out of stock");
					}
				}
				catch (SQLException e) 
				{	
					e.printStackTrace();
				}													
			}
			res.sendRedirect("user/order.jsp");	
		}		
		else if(action.equalsIgnoreCase("Update"))
		{
			OrderStatusBean osb = new OrderStatusBean();
			String status = req.getParameter("status");
			int status_id = Integer.parseInt(req.getParameter("id"));
			osb.setStatus(status);
			osb.setStatus_id(status_id);
			OrderStatusdao.updateStatus(osb);
			res.sendRedirect("admin/viewOrderStatus.jsp");
		}
	/*	else if(action.equalsIgnoreCase("Track Your Order"))
		{
			int pid = Integer.parseInt(req.getParameter("pid"));		
			res.sendRedirect("user/viewOrderStatus.jsp?pid="+pid);
		}*/
	}	
}
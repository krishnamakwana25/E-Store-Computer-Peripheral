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
import bean.CustomOpStatusBean;
import bean.CustomOrderBean;
import bean.CustomeOPbean;
import bean.Notificationbean;
import mail.mailOrder;
import DAO.CustOrderdao;
import DAO.CustomOPStatusdao;
import DAO.CustomeOPdao;
import DAO.Notificationdao;
@WebServlet("/CustomeOPController")
public class CustomeOPController extends HttpServlet
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
			String orderdate = req.getParameter("orderdate");
			String username = req.getParameter("username");
			String pcname = req.getParameter("pcname");
			int price = Integer.parseInt(req.getParameter("totalprice"));
			String subject ="Customize Order Confirmation - Your customize order has been booked";
			String body = "Your customize order has been booked for "+pcname+"\n\nOrder Details:-\n\nOrder Date : "+orderdate+"\nYour PC Name : "+pcname+"\nProduct Price : "+price+"\nYour Customize order id : ";
			String userorderid = mailOrder.sendMail(email,subject,body,username);				
			CustOrderdao cd = new CustOrderdao();
			CustomeOPbean cop = new CustomeOPbean();	
			int uid1 = Integer.parseInt(req.getParameter("userid"));			
			int pid1=0;
			if(checkid==uid1)
			{
				String ptype = req.getParameter("COD");				
				try 
				{
					List<CustomOrderBean>co1=CustOrderdao.getLastProducts(checkid);							
	          		for(CustomOrderBean CustOrder: co1)								    	          			
    	      		{								          		
						cop.setCustomOrderid(CustOrder.getCustorderid());
						cop.setUserid(checkid);
						pid1 = CustOrder.getCustomizeprodid();
						cop.setPCName(pcname);
						cop.setCustomProductid(pid1);
						cop.setCustomUserOrderid(userorderid);
						cop.setCustomOrderPlaceDate(CustOrder.getBook_date());
						cop.setCustomProductPrice(price);
						cop.setCustomtOrderTotal(CustOrder.getTotalprice());
						cop.setCustomPaymnetType(ptype);														
						CustomeOPdao.InsertIntoCustomeOP(cop);					
						
						List<CustomOrderBean>co2=CustOrderdao.getallOrdersByUserId(checkid);							
		          		for(CustomOrderBean CustOrder1: co2)								    	          			
	    	      		{	
		          			cd.deleteCustOrderItem(CustOrder1.getCustorderid());
	    	      		}
						/*totalqty = CustOrder.getTotalQty();	
						tqty = totalqty - qty ; 
						CustProdBean cob = new CustProdBean();
						cob.setCustproid(pid1);
						cob.setCustproqty(tqty);							
						Custproddao.SetQuantityAftrOrder(cob);*/
						String nid = "3" ;
						String not_des = "Customize Order - \nYou have customize PC order";
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(nid);
						nb.setNot_description(not_des);
						Notificationdao.InsertIntoNotification(nb);						
						/*FOR STATUS*/
						CustomOpStatusBean cosb = new CustomOpStatusBean();
						try 
						{		
							List<CustomeOPbean> orp1 = CustomeOPdao.getallCOPByUserIdForStatus(checkid);
							for(CustomeOPbean orpb: orp1)
							{
								cosb.setCust_op_id(orpb.getCustomOPid());
								cosb.setUser_id(checkid);
								cosb.setCustomizeprodid(pid1);
								String  status = "Ordered" ;
								cosb.setStatus(status);
								CustomOPStatusdao.InsertIntoCustomStatus(cosb);							
							}
						}
						catch (SQLException e) 
						{
							e.printStackTrace();
						}
						/*FOR STATUS*/
					}			
				}
				catch (SQLException e) 
				{	
					e.printStackTrace();
				}													
			}
			res.sendRedirect("user/custOrder.jsp");	
		}		
		else if(action.equalsIgnoreCase("Update"))
		{
			CustomOpStatusBean cosb = new CustomOpStatusBean();
			String status = req.getParameter("status");
			int status_id = Integer.parseInt(req.getParameter("id"));
			cosb.setStatus(status);
			cosb.setStatus_id(status_id);
			CustomOPStatusdao.updateCustomStatus(cosb);
			res.sendRedirect("admin/viewCustomOrderStatus.jsp");
		}
	}
}
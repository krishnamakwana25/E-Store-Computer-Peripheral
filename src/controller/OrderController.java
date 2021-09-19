package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Cartdao;
import DAO.Orderdao;
import bean.Cartbean;
import bean.Orderbean;
@WebServlet("/OrderController")
public class OrderController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();	
		String action=req.getParameter("action");
		String email = (String) session.getAttribute("email");		
		if(action.equalsIgnoreCase("Checkout"))
		{			
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{
				Cartdao cd=new Cartdao();	
				Orderbean order=new Orderbean();			
				int checkid= (Integer) session.getAttribute("id");
				int uid1 = Integer.parseInt(req.getParameter("userid"));
				if(checkid==uid1)
				{
					int totalamt = Integer.parseInt(req.getParameter("totalamt").trim());
					String unm = req.getParameter("unm");		
					String mobileno = req.getParameter("mobileno");
					String address = req.getParameter("address");					
					
					/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
					boolean check = Orderdao.CheckItem();
					if(check)
					{
						Orderdao.deleteItem();
					}
					/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
					List<Cartbean> cart1 = Cartdao.getCartListByUserId(checkid);				
					for(Cartbean cart: cart1)
					{								
						order.setCartid(cart.getCartid());
						order.setProductid(cart.getProductid());		
						order.setProductPrice(cart.getProductPrice());
						order.setProductQty(cart.getProductQty());											
						order.setProductTotalPrice(totalamt);
						order.setUserid(checkid);
						order.setUsername(unm);
						order.setMail(email);
						order.setMobnum(mobileno);
						order.setAdd(address);										
						Orderdao.insertOrder(order);	
						cd.deleteCartItemByCheckout(cart.getCartid());
					}					
				}
				res.sendRedirect("user/order.jsp");
			}
		}		
		else if(action.equalsIgnoreCase("Update1"))
		{
			Orderbean Order=new Orderbean();
			Order.setProductQty(Integer.parseInt(req.getParameter("qty1")));
			Order.setOrderid(Integer.parseInt(req.getParameter("oid")));
			Orderdao od=new Orderdao();
			od.UpdateQuantity(Order);
			res.sendRedirect("user/cart.jsp");
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id1=Integer.parseInt(req.getParameter("id1"));			
			res.sendRedirect("user/EditShippingInfo.jsp?id1="+id1);
		}
		else if(action.equalsIgnoreCase("Save"))
		{
			Orderbean Order=new Orderbean();			
			Order.setUsername(req.getParameter("updateusername"));
			Order.setMail(req.getParameter("updatemail"));
			Order.setMobnum(req.getParameter("updatephone"));
			Order.setAdd(req.getParameter("updateaddress"));
			Order.setOrderid(Integer.parseInt(req.getParameter("id")));
			Order.setUserid(Integer.parseInt(req.getParameter("id1")));
			Orderdao od = new Orderdao();
			od.updateOrderInfo(Order);
			res.sendRedirect("user/order.jsp");			
		}		
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("orderid"));
		int cnt = Orderdao.getTotalItem();
		Orderdao od=new Orderdao();
		if(cnt == 1)
		{
			od.deleteOrderItem(id);		
			res.sendRedirect("user/index1_user.jsp");		
		}
		else
		{
			od.deleteOrderItem(id);
		}
	}
}
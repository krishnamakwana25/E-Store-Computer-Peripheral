package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.RentOrderdao;
import bean.RentOrderbean;
@WebServlet("/RentOrderController")
public class RentOrderController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("email");
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("Continue"))
		{		
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{
				/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
				boolean check = RentOrderdao.CheckItem();
				if(check)
				{
					RentOrderdao.deleteItem();
				}
				/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
				int uid = (Integer) session.getAttribute("id");
				int rentproid=Integer.parseInt(req.getParameter("rid").trim());						
				String rentprice = req.getParameter("rentprice");
				int rentqty = Integer.parseInt(req.getParameter("rentqty").trim());
				int durationval = Integer.parseInt(req.getParameter("durationval").trim());
				int renttotal = Integer.parseInt(req.getParameter("total").trim());
				int deposite = Integer.parseInt(req.getParameter("deposite").trim());
				String unm = req.getParameter("unm");		
				String mobileno = req.getParameter("mobileno");
				String address = req.getParameter("address");
			
				RentOrderbean rob = new RentOrderbean();			
				rob.setRentProid(rentproid);
				rob.setRentOrderPrice(rentprice);
				rob.setQunatity(rentqty);
				rob.setDuration(durationval);
				rob.setTotalAmount(renttotal);		
				rob.setDeposite(deposite);
				rob.setUserid(uid);
				rob.setUsername(unm);
				rob.setMail(email);
				rob.setMobnum(mobileno);
				rob.setAdd(address);
				RentOrderdao.InsertIntoRentOrderTable(rob);
				res.sendRedirect("user/rentOrder.jsp");		
			}
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id1=Integer.parseInt(req.getParameter("id1"));			
			res.sendRedirect("user/rentOrderEditShippingInfo.jsp?id1="+id1);
		}
		else if(action.equalsIgnoreCase("Save"))
		{
			RentOrderbean RentOrder=new RentOrderbean();			
			RentOrder.setUsername(req.getParameter("updateusername"));
			RentOrder.setMail(req.getParameter("updatemail"));
			RentOrder.setMobnum(req.getParameter("updatephone"));
			RentOrder.setAdd(req.getParameter("updateaddress"));
			RentOrder.setRentOrderId(Integer.parseInt(req.getParameter("id")));
			RentOrder.setUserid(Integer.parseInt(req.getParameter("id1")));
			RentOrderdao rod = new RentOrderdao();
			rod.updateRentOrderInfo(RentOrder);
			res.sendRedirect("user/rentOrder.jsp");			
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("orderid"));
		RentOrderdao rod=new RentOrderdao();
		rod.deleteRentOrderItem(id);
		int cnt = RentOrderdao.getTotalItem();
		if(cnt == 1)
		{
			rod.deleteRentOrderItem(id);
			res.sendRedirect("user/index1_user.jsp");		
		}
		else
		{
			rod.deleteRentOrderItem(id);
		}
	}
}
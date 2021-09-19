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
import DAO.Productdao;
import bean.Cartbean;
import bean.Orderbean;
@WebServlet("/Cartcontroller")
public class Cartcontroller extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();
		String action=req.getParameter("action");
		String email = (String) session.getAttribute("email");		
		if(action.equalsIgnoreCase("Add to Cart"))
		{		
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{
				
				int flag=0;
				int checkid= (Integer) session.getAttribute("id");
				String pid = req.getParameter("pid").trim();		
				int proid=Integer.parseInt(pid);
				Cartbean cart=new Cartbean();
				int q = Productdao.GetTotalQTY(proid);				
				if(q != 0)
				{
					List<Cartbean> cart1 = Cartdao.getCartListByUserId(checkid);
					for(Cartbean c1: cart1)
					{		
						if(c1.getProductid() == proid)
						{
							flag=1;
							break;
						}
					}			
					if(flag==1)
					{
						Cartbean c2=new Cartbean();
						int q1 = Integer.parseInt(req.getParameter("qty"));
						int p1 = Integer.parseInt(req.getParameter("pid").trim());
						c2.setProductQty(q1);
						c2.setProductid(p1);			
						Cartdao cd1=new Cartdao();
						cd1.UpdateQuantity1(c2);
						res.sendRedirect("user/cart.jsp");
					}
					else
					{				
						cart.setProductid(Integer.parseInt(pid));
						cart.setUserid(checkid);
						cart.setMail(email);							
						String qty = req.getParameter("qty").trim();
						cart.setProductQty(Integer.parseInt(qty));	
						Cartdao.insertCart(cart);
						res.sendRedirect("user/cart.jsp");				
					}
				}
				else
				{
					System.out.println("out of stock");
				}			
			}
		}	
		else if(action.equalsIgnoreCase("Cart"))
		{
			try 
			{
				int checkid= (Integer) session.getAttribute("id");
				int flag=0;
				List<Cartbean> cart1 = Cartdao.getCartListByUserId(checkid);
				for(Cartbean c1: cart1)
				{			
					if(c1.getUserid() == checkid)
					{
						flag = 1;
						break;
					}
				}
				if(flag != 1)
				{
					res.sendRedirect("user/EmptyCart.jsp");		
				}
				else
				{
					res.sendRedirect("user/cart.jsp");	
				}
			}
			catch (Exception e) 
			{			
				e.printStackTrace();
			}			
		}
		
		else if(action.equalsIgnoreCase("Re-Order"))
		{		
			int checkid= (Integer) session.getAttribute("id");
			String pid = req.getParameter("pid").trim();	
			int qty = Integer.parseInt(req.getParameter("qty").trim());
			int proid=Integer.parseInt(pid);
			Cartbean cart=new Cartbean();
			/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
			boolean check = Orderdao.CheckItem();
			if(check)
			{
				Orderdao.deleteItem();
			}
			/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/			
			cart.setUserid(checkid);
			cart.setMail(email);
			cart.setProductid(proid);
			cart.setProductQty(qty);
			Cartdao.insertCart(cart);
			
			List<Cartbean> cart1 = Cartdao.getCartListByUserId(checkid);
			for(Cartbean c1: cart1)
			{		

				Cartdao cd = new Cartdao();
				Orderbean order=new Orderbean();	
				int totalamt = Integer.parseInt(req.getParameter("totalamt").trim());
				String unm = req.getParameter("unm");		
				String mobileno = req.getParameter("mobo");
				String address = req.getParameter("add");
				int price = Integer.parseInt(req.getParameter("price").trim());
				String qty1 = req.getParameter("qty").trim();
				if(c1.getProductid() == proid)
				{
					order.setCartid(c1.getCartid());
					order.setProductid(proid);		
					order.setProductPrice(price);
					order.setProductQty(Integer.parseInt(qty1));											
					order.setProductTotalPrice(totalamt);
					order.setUserid(checkid);
					order.setUsername(unm);
					order.setMail(email);
					order.setMobnum(mobileno);
					order.setAdd(address);										
					Orderdao.insertOrder(order);	
					cd.deleteCartItemByReOrder(order.getCartid());
				}
			}
			res.sendRedirect("user/order.jsp");
		}			
		else if(action.equalsIgnoreCase("Update"))
		{
			Cartbean cart=new Cartbean();
			cart.setProductQty(Integer.parseInt(req.getParameter("qty")));
			cart.setProductid(Integer.parseInt(req.getParameter("pid")));			
			Cartdao cd=new Cartdao();
			cd.UpdateQuantity(cart);
			res.sendRedirect("user/cart.jsp");
		}	
		else if(action.equalsIgnoreCase("Buy Now"))
		{	
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{
				int checkid= (Integer) session.getAttribute("id");
				String pid = req.getParameter("pid").trim();	
				int qty = Integer.parseInt(req.getParameter("qty").trim());
				int proid=Integer.parseInt(pid);
				Cartbean cart=new Cartbean();
				
				cart.setUserid(checkid);
				cart.setMail(email);
				cart.setProductid(proid);
				cart.setProductQty(qty);
				Cartdao.insertCart(cart);
				
				List<Cartbean> cart1 = Cartdao.getCartListByUserId(checkid);
				for(Cartbean c1: cart1)
				{		
	
					Cartdao cd = new Cartdao();
					Orderbean order=new Orderbean();	
					int totalamt = Integer.parseInt(req.getParameter("totalamt").trim());
					String unm = req.getParameter("unm");		
					String mobileno = req.getParameter("mobo");
					String address = req.getParameter("add");
					int price = Integer.parseInt(req.getParameter("price").trim());
					String qty1 = req.getParameter("qty").trim();
					if(c1.getProductid() == proid)
					{
						order.setCartid(c1.getCartid());
						order.setProductid(proid);		
						order.setProductPrice(price);
						order.setProductQty(Integer.parseInt(qty1));											
						order.setProductTotalPrice(totalamt);
						order.setUserid(checkid);
						order.setUsername(unm);
						order.setMail(email);
						order.setMobnum(mobileno);
						order.setAdd(address);										
						Orderdao.insertOrder(order);	
						cd.deleteCartItemByReOrder(order.getCartid());
					}
				}
				res.sendRedirect("user/order.jsp");
			}
		}
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		Cartdao cd=new Cartdao();
		int id=Integer.parseInt(req.getParameter("cid"));				
		cd.deleteCartItem(id);
		res.sendRedirect("user/cart.jsp");							
	}
}
package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.Wishlistdao;
import bean.Wishlistbean;
@WebServlet("/WishlistController")
public class WishlistController extends HttpServlet{
		private static final long serialVersionUID = 1L;
		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
		{
			HttpSession session = req.getSession();
			String action=req.getParameter("action");	
			if(action.equalsIgnoreCase("wishlist"))
			{			
				if(null == session.getAttribute("id"))
				{
					res.sendRedirect("user/user_login.jsp");
				}
				else
				{
					int flag=0;					
					int checkid= (Integer) session.getAttribute("id");
					String proid=req.getParameter("proid").trim();
					int pid=Integer.parseInt(proid);
					Wishlistbean wb=new Wishlistbean();				
					List<Wishlistbean> wish1 = Wishlistdao.getWishListByUserId(checkid);
					for(Wishlistbean w1: wish1)
					{		
						if(w1.getProductid() == pid)
						{
							flag=1;
							break;
						}
					}			
					if(flag==1)
					{
						Wishlistdao wd=new Wishlistdao();
						wd.deleteWishlistItem1(pid);
						res.sendRedirect("user/wishlist.jsp");
						
					}
					else
					{				
						wb.setProductid(pid);	
						wb.setUserid(checkid);				
						Wishlistdao wd=new Wishlistdao();
						wd.insertwishlist(wb);				
						res.sendRedirect("user/wishlist.jsp");							
					}
				}
			}
			else if(action.equalsIgnoreCase("wishlist1"))
			{
				int checkid= (Integer) session.getAttribute("id");								
				try 
				{
					int flag=0;
					List<Wishlistbean> wish1 = Wishlistdao.getWishListByUserId(checkid);
					for(Wishlistbean w1: wish1)
					{			
						if(w1.getUserid() == checkid)
						{
							flag = 1;
							break;
						}
					}
					if(flag != 1)
					{
						res.sendRedirect("user/EmptyWishlist.jsp");		
					}
					else
					{
						res.sendRedirect("user/wishlist.jsp");	
					}
				}
				catch (Exception e) 
				{			
					e.printStackTrace();
				}
			}	
		}
	
		public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
		{
			int id=Integer.parseInt(req.getParameter("cid"));
			Wishlistdao wd=new Wishlistdao();
			wd.deleteWishlistItem(id);
		}
}
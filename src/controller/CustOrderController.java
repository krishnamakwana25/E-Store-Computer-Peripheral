package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DAO.CustListDao;
import DAO.CustOrderdao;
import bean.CustomListBean;
import bean.CustomOrderBean;
@WebServlet("/CustOrderController")
public class CustOrderController extends HttpServlet
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
				/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
				boolean check = CustOrderdao.CheckItem();
				if(check)
				{
					CustOrderdao.deleteItem();
				}
				/***DELETE ITEM IF ITEM IS ALREADY IN ORDER PAGE AND USER TRYING TO ADD ITEM FROM HOME***/
				CustListDao cld=new CustListDao();	
				CustomOrderBean custorder=new CustomOrderBean();			
				int checkid= (Integer) session.getAttribute("id");
				int uid1 = Integer.parseInt(req.getParameter("userid"));				
				if(checkid==uid1)
				{
					String pcname= req.getParameter("pcname");
					int totalamt = Integer.parseInt(req.getParameter("totalamt").trim());
					String unm = req.getParameter("unm");		
					String mobileno = req.getParameter("mobileno");
					String address = req.getParameter("address");										
					List<CustomListBean> custlist1 = CustListDao.getCustListByUserId(checkid);				
					for(CustomListBean cust: custlist1)
					{								
						custorder.setList_id(cust.getList_id());
						custorder.setCustomizeprodid(cust.getCustomizeprodid());
						custorder.setPCName(pcname);
						custorder.setCustproprice(cust.getCustproprice());
						custorder.setQuantity(cust.getQty());											
						custorder.setTotalprice(totalamt);
						custorder.setUser_id(checkid);
						custorder.setUnm(unm);
						custorder.setMail(email);
						custorder.setMobile(mobileno);
						custorder.setAdd(address);											
						CustOrderdao.insertCustOrder(custorder);							
						cld.deleteCustListItemByCheckout(cust.getList_id());
					}					
				}
				res.sendRedirect("user/custOrder.jsp");
			}
		}		
		else if(action.equalsIgnoreCase("Update1"))
		{
			CustomOrderBean CustOrder=new CustomOrderBean();
			CustOrder.setQuantity(Integer.parseInt(req.getParameter("qty1")));
			CustOrder.setCustorderid(Integer.parseInt(req.getParameter("coid")));
			CustOrderdao cod=new CustOrderdao();
			cod.UpdateQuantity(CustOrder);
			res.sendRedirect("user/CustList.jsp");
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int uid=Integer.parseInt(req.getParameter("id1"));			
			res.sendRedirect("user/custEditShippingInfo.jsp?uid="+uid);
		}
		else if(action.equalsIgnoreCase("Save"))
		{
			CustomOrderBean CustOrder=new CustomOrderBean();			
			CustOrder.setUnm(req.getParameter("updateusername"));
			CustOrder.setMail(req.getParameter("updatemail"));
			CustOrder.setMobile(req.getParameter("updatephone"));
			CustOrder.setAdd(req.getParameter("updateaddress"));
			CustOrder.setCustorderid(Integer.parseInt(req.getParameter("id")));
			CustOrder.setUser_id(Integer.parseInt(req.getParameter("id1")));
			CustOrderdao cod = new CustOrderdao();
			cod.updateOrderInfo(CustOrder);
			res.sendRedirect("user/custOrder.jsp");			
		}		
		else if(action.equalsIgnoreCase("Re-List"))
		{
			CustOrderdao cd=new CustOrderdao();
			cd.deleteOrder();
			res.sendRedirect("user/CustomizeProductById.jsp");	
		}
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("orderid"));
		CustOrderdao cd=new CustOrderdao();
		cd.deleteCustOrderItem(id);		
	}
}

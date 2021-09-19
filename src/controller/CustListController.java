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
@WebServlet("/CustListController")
public class CustListController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{		
		HttpSession session = req.getSession();		
		String action=req.getParameter("action");
		String email = (String) session.getAttribute("email");		
		if(action.equalsIgnoreCase("Add to List"))
		{		
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{
				int checkid= (Integer) session.getAttribute("id");
				int flag=0;			
				String cpid = req.getParameter("cpid").trim();				
				int customizeprodid=Integer.parseInt(cpid);
				CustomListBean custlist=new CustomListBean();			
				List<CustomListBean> custlist1 = CustListDao.getCustListByUserId(checkid);
				for(CustomListBean cl1: custlist1)
				{		
					if(cl1.getCustomizeprodid() == customizeprodid)
					{
						flag=1;
						break;
					}
				}		
				if(flag==1)
				{
					CustomListBean cl2=new CustomListBean();
					int q1 = Integer.parseInt(req.getParameter("qty"));
					int p1 = Integer.parseInt(req.getParameter("cpid").trim());
					cl2.setQty(q1);
					cl2.setCustomizeprodid(p1);			
					CustListDao cld1=new CustListDao();
					cld1.UpdateQuantity1(cl2);
					res.sendRedirect("user/CustList.jsp");
				}			
				else 
				{				
					custlist.setCustomizeprodid(Integer.parseInt(cpid));
					custlist.setUser_id(checkid);
					custlist.setEmail(email);							
					String qty = req.getParameter("qty").trim();
					custlist.setQty(Integer.parseInt(qty));	
					CustListDao.insertCustList(custlist);
					res.sendRedirect("user/CustomizeProductById.jsp");				
				}				
			}
		}
		else if(action.equalsIgnoreCase("Added to List"))
		{		
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{
				int checkid= (Integer) session.getAttribute("id");
				int flag1=0;
				String cpid = req.getParameter("cpid").trim();	
				int customizeprodid=Integer.parseInt(cpid);
				CustomListBean custlist=new CustomListBean();
				List<CustomListBean> custlist1 = CustListDao.getCustListByUserId(checkid);
				for(CustomListBean cl1: custlist1)
				{		
					if(cl1.getCustomizeprodid() == customizeprodid)
					{
						flag1=1;
						break;
					}
				}					
				if(flag1==1)
				{
					CustListDao cld=new CustListDao();				
					cld.deleteCustItemByProID(Integer.parseInt(cpid));
					res.sendRedirect("user/CustomizeProductById.jsp");	
				}
				else 
				{				
					custlist.setCustomizeprodid(Integer.parseInt(cpid));
					custlist.setUser_id(checkid);
					custlist.setEmail(email);							
					String qty = req.getParameter("qty").trim();
					custlist.setQty(Integer.parseInt(qty));	
					CustListDao.insertCustList(custlist);
					res.sendRedirect("user/CustomizeProductById.jsp");				
				}				
			}
		}	
		else if(action.equalsIgnoreCase("Re-List"))
		{
			CustListDao cd=new CustListDao();
			cd.deleteOrder();
			res.sendRedirect("user/CustomizeProductById.jsp");	
		}
		else if(action.equalsIgnoreCase("Go To List"))
		{
			int f1 = 0,f2 = 0,f3 = 0,f4 = 0,f5 = 0,f6 = 0;
			int checkid1 = (Integer) session.getAttribute("id");
			List<CustomListBean>list=CustListDao.getCustListByUserId(checkid1);							
      		for(CustomListBean custlist: list)
      		{
				if(custlist.getCustmaincatid() == 1)
				{
					f1=1;				
				}
				if(custlist.getCustmaincatid() == 2)
				{
					f2=1;			
				}
				if(custlist.getCustmaincatid() == 3)
				{
					f3=1;					
				}
				if(custlist.getCustmaincatid() == 4)
				{
					f4=1;	
				}
				if(custlist.getCustmaincatid() == 5)
				{
					f5=1;	
				}
				if(custlist.getCustmaincatid() == 6)
				{			
					f6=1;	
				}
			}	
			
			if( ( (f1 == 1) && (f2 == 1) && (f3 == 1) && (f4 == 1) && (f5 == 1) ) || ( (f1 == 1) && (f2 == 1) && (f3 == 1) && (f4 == 1) && (f5 == 1) && (f6 == 1)) )
			{
				res.sendRedirect("user/CustList.jsp");	
			}
			else
			{
				res.sendRedirect("user/CustomizeProductById.jsp?msg=failed");	
			}
		}
		else if(action.equalsIgnoreCase("Re-Order"))
		{		
			int checkid= (Integer) session.getAttribute("id");
			String cpid = req.getParameter("cpid").trim();	
			int qty = Integer.parseInt(req.getParameter("qty").trim());
			int customizeprodid=Integer.parseInt(cpid);
			CustomListBean custlist=new CustomListBean();
			
			custlist.setUser_id(checkid);
			custlist.setEmail(email);
			custlist.setCustomizeprodid(customizeprodid);
			custlist.setQty(qty);
			CustListDao.insertCustList(custlist);
			
			List<CustomListBean> custlist1 = CustListDao.getCustListByUserId(checkid);
			for(CustomListBean cl1: custlist1)
			{		

				CustListDao cld = new CustListDao();
				CustomOrderBean custorder=new CustomOrderBean();	
				int totalamt = Integer.parseInt(req.getParameter("totalamt").trim());
				String unm = req.getParameter("unm");		
				String mobileno = req.getParameter("mobo");
				String address = req.getParameter("add");
				int price = Integer.parseInt(req.getParameter("price").trim());
				String qty1 = req.getParameter("qty").trim();
				if(cl1.getCustomizeprodid() == customizeprodid)
				{
					custorder.setList_id(cl1.getList_id());
					custorder.setCustomizeprodid(customizeprodid);		
					custorder.setCustproprice(price);
					custorder.setQuantity(Integer.parseInt(qty1));											
					custorder.setTotalprice(totalamt);
					custorder.setUser_id(checkid);
					custorder.setUnm(unm);
					custorder.setMail(email);
					custorder.setMobile(mobileno);
					custorder.setAdd(address);										
					CustOrderdao.insertCustOrder(custorder);	
					cld.deleteCustListItemByReOrder(custorder.getCustorderid());
				}
			}
			res.sendRedirect("user/custorder.jsp");
		}			
		else if(action.equalsIgnoreCase("Update"))
		{
			CustomListBean custlist=new CustomListBean();
			int qty  = Integer.parseInt(req.getParameter("qty"));
			custlist.setQty(qty);
			int cid = Integer.parseInt(req.getParameter("cid"));
			custlist.setCustomizeprodid(cid);			
			CustListDao cld=new CustListDao();
			cld.UpdateQuantity(custlist);
			res.sendRedirect("user/CustList.jsp");
		}		
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		CustListDao cld=new CustListDao();
		int id=Integer.parseInt(req.getParameter("cid"));				
		cld.deleteCustListItem(id);
		res.sendRedirect("user/CustList.jsp");							
	}
}
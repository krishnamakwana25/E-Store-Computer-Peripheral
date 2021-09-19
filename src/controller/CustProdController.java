package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import DAO.CustomCancelorderdao;
import DAO.CustomOPStatusdao;
import DAO.CustomeOPdao;
import DAO.Custproddao;
import DAO.Notificationdao;
import bean.CustProdBean;
import bean.CustomCancelOrderbean;
import bean.CustomOpStatusBean;
import bean.CustomeOPbean;
import bean.Notificationbean;
import mail.mailOrder;
@WebServlet("/CustProdController")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    //10mb
maxFileSize=1024*1024*50,       //50mb
maxRequestSize=1024*1024*100)
public class CustProdController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Insert"))
		{
			Part part1 = req.getPart("custprophoto1");
			String path1= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part1.getSubmittedFileName();
			part1.write(path1);
			
			Part part2 = req.getPart("custprophoto2");
			String path2= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part2.getSubmittedFileName();
			part2.write(path2);
			
			Part part3 = req.getPart("custprophoto3");
			String path3= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part3.getSubmittedFileName();
			part3.write(path3);
			
			Part part4 = req.getPart("custprophoto4");
			String path4= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part4.getSubmittedFileName();
			part4.write(path4);						
			String q=req.getParameter("custproqty");
			CustProdBean Cust=new CustProdBean();
			Cust.setCustcatname(req.getParameter("selectcustcat"));
			Cust.setCustproname(req.getParameter("custproname"));
			Cust.setCustprophoto1(part1.getSubmittedFileName());
			Cust.setCustprophoto2(part2.getSubmittedFileName());
			Cust.setCustprophoto3(part3.getSubmittedFileName());
			Cust.setCustprophoto4(part4.getSubmittedFileName());
			Cust.setCustproprice(req.getParameter("custproprice"));
			Cust.setCustproqty(Integer.parseInt(q));
			Cust.setCustprospecification(req.getParameter("custprospecification"));
			Cust.setCustproddescription(req.getParameter("custproddescription"));
			Custproddao cpd=new Custproddao();
			cpd.insertproduct(Cust);
			res.sendRedirect("admin/viewCustProd.jsp");		
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			Custproddao cpd=new Custproddao();
			cpd.deleteProduct(id);
			res.sendRedirect("admin/viewCustProd.jsp");
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updatecustprod.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			CustProdBean cb=new CustProdBean();		
			cb.setCustproid(Integer.parseInt(req.getParameter("updatecustproid")));
			cb.setCustproname(req.getParameter("updatecustproname"));
			cb.setCustproprice(req.getParameter("updatecustproprice"));
			cb.setCustproqty(Integer.parseInt(req.getParameter("updatecustqty")));
			cb.setCustprospecification(req.getParameter("updatecustprospecification"));
			cb.setCustcatname(req.getParameter("updatecustcat"));		
			Custproddao cd =new Custproddao();
			cd.updateCustProduct(cb);
			res.sendRedirect("admin/viewCustProd.jsp");
			/*req.getRequestDispatcher("viewproduct.jsp").forward(req,res);*/
		}
		
		else if(action.equalsIgnoreCase("customquickview"))
		{	
			HttpSession session= req.getSession();			
			int mainid = Integer.parseInt(req.getParameter("maincatid").trim());
			int proid=Integer.parseInt(req.getParameter("productid").trim());		
			session.setAttribute("proid", proid);
			res.sendRedirect("user/CustomSingle.jsp?mainid="+mainid);			
		}
		
		else if(action.equalsIgnoreCase("customquickviewById"))
		{	
			HttpSession session= req.getSession();			
			int mainid = Integer.parseInt(req.getParameter("maincatid").trim());
			int proid=Integer.parseInt(req.getParameter("productid").trim());		
			session.setAttribute("proid", proid);
			res.sendRedirect("user/CustomSingleById.jsp?mainid="+mainid);			
		}
		
		else if (action.equalsIgnoreCase("Edit Inventory"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/inventoryUpdateCustom.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update Inventory"))
		{
			CustProdBean cpb=new CustProdBean();		
			cpb.setCustproid(Integer.parseInt(req.getParameter("updatecustomproid")));
			cpb.setCustproname(req.getParameter("updatecustomproname"));
			cpb.setCustproprice(req.getParameter("updatecustomproprice"));
			cpb.setCustproqty(Integer.parseInt(req.getParameter("updatecustomqty")));
			Custproddao cpd =new Custproddao();
			cpd.updateCustomInventory(cpb);
			res.sendRedirect("admin/inventoryCustomize.jsp");			
		}
		else if(action.equalsIgnoreCase("Delete Product"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			Custproddao cpd=new Custproddao();
			cpd.deleteProduct(id);
			res.sendRedirect("admin/inventoryCustomize.jsp");
		}
		
		else if(action.equalsIgnoreCase("Delete Order"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("email");	
			String unm = req.getParameter("username");
			String productname = req.getParameter("productname");
			String userorderid = req.getParameter("userorderid");
			int checkid=Integer.parseInt(req.getParameter("userid"));
			int pid = Integer.parseInt(req.getParameter("proid"));
			CustomCancelOrderbean ccob = new CustomCancelOrderbean();
			String reason = "Due to technical reason";
			try 
			{								
				List<CustomeOPbean> ccopb = CustomeOPdao.getallOPByUserOrderId(userorderid);				
					for(CustomeOPbean cop: ccopb)
					{								
						ccob.setCustomProductid(cop.getCustomProductid());
						ccob.setCustomOPid(cop.getCustomOPid());
						pid = cop.getCustomProductid();
						ccob.setCustomUserOrderid(userorderid);
						ccob.setPCName(cop.getPCName());
						ccob.setReason(reason);
						ccob.setUserid(checkid);			
						CustomCancelorderdao.InsertIntoCustomOrderCancel(ccob);							
						CustomeOPdao.CancelOrder(cop.getCustomOPid(),userorderid);
						/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
						int id1 = cop.getCustomProductid();
						int qty = cop.getCustomOrderQty();
						int totalqty = cop.getCustomProductQty1();
						int finalqty = qty + totalqty ; 
						CustProdBean cpb1 = new CustProdBean();
						cpb1.setCustproid(id1);
						cpb1.setCustproqty(finalqty);
						Custproddao.SetQuantityAftrOrder(cpb1);
						/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
						
						String nid = "6" ;
						String not_des = "Customize Cancel Order - \nOrder I'd "+userorderid+" is cancelled";
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(nid);
						nb.setNot_description(not_des);
						Notificationdao.InsertIntoNotification(nb);
					}
					List<CustomOpStatusBean> orp1 = CustomOPStatusdao.getCustomOrderStatus(id,pid,checkid);
					for(CustomOpStatusBean orpb: orp1)
					{	
						orpb.setCustomizeprodid(pid);
						orpb.setStatus_id(orpb.getStatus_id());
						CustomOPStatusdao.deleteCustomOrderStatus(orpb);
					}
				}
				catch (Exception e) 
				{			
					e.printStackTrace();
				}				
			
/*			try 
			{
				List<CustomOpStatusBean> orp1 = CustomOPStatusdao.getCustomOrderStatus(pid,checkid);
				for(CustomOpStatusBean orpb: orp1)
				{	
					orpb.setCustomizeprodid(pid);
					orpb.setStatus_id(orpb.getStatus_id());
					CustomOPStatusdao.deleteCustomOrderStatus(orpb);
				}
			}
			catch (SQLException e) 
			{			
				e.printStackTrace();
			}
*/			
			CustomeOPdao opd= new CustomeOPdao();
			opd.deleteOrder(id);
			String subject ="Customize Order Cancelled";
			String body = "Dear "+unm+",\nYour customize order has been cancelled due to some reason.\n\nPRODUCT NAME : "+productname+"\nORDER ID : "+userorderid+"\n\nThank You";
			mailOrder.sendCancelOrderViaMail(email,subject,body);	

			res.sendRedirect("admin/viewCustomizeOrders.jsp");
		}
	}
}
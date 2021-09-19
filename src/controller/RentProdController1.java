package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import DAO.Notificationdao;
import DAO.ORPStatusdao;
import DAO.ORPdao;
import DAO.RentOrderCanceldao;
import DAO.Rentproddao;
import bean.Notificationbean;
import bean.ORPStatusBean;
import bean.ORPbean;
import bean.RentOrderCancelbean;
import bean.Rentprodbean;
import mail.mailOrder;
@WebServlet("/RentProdController1")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    //10mb
maxFileSize=1024*1024*50,       //50mb
maxRequestSize=1024*1024*100)
public class RentProdController1 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session = req.getSession();	
		String action = req.getParameter("action");
		if (action.equalsIgnoreCase("Insert"))
		{
			Part part1 = req.getPart("rentproductphoto1");
			String path1 = req.getServletContext().getRealPath("/") + "\\uploadimg\\" + part1.getSubmittedFileName();
			part1.write(path1);

			Part part2 = req.getPart("rentproductphoto2");
			String path2 = req.getServletContext().getRealPath("/") + "\\uploadimg\\" + part2.getSubmittedFileName();
			part2.write(path2);

			String q = req.getParameter("rentproductqty");
			Rentprodbean rent = new Rentprodbean();
			rent.setRentProName(req.getParameter("rentproductname"));
			rent.setRentProPhoto1(part1.getSubmittedFileName());
			rent.setRentProPhoto2(part2.getSubmittedFileName());
			rent.setRentProductPrice(req.getParameter("rentproductprice"));
			rent.setRentProductQty1(Integer.parseInt(q));
			rent.setRentProductSpecification1(req.getParameter("rentproductspecification"));
			rent.setRentProductDescription(req.getParameter("rentproductdescription"));
			Rentproddao rpd = new Rentproddao();
			rpd.insertproduct(rent);
			res.sendRedirect("admin/viewrentprod.jsp");
		}
		else if(action.equalsIgnoreCase("On Rent"))
		{		
			if(null == session.getAttribute("id"))
			{
				res.sendRedirect("user/user_login.jsp");
			}
			else
			{				
				int rqty = Integer.parseInt(req.getParameter("rentqty").trim());
				int rid = Integer.parseInt(req.getParameter("rentpid").trim());
				session.setAttribute("rid", rid);
				res.sendRedirect("user/rentform.jsp?rentqty="+rqty);
			}		
		}
		else if(action.equalsIgnoreCase("Re-Order"))
		{
			int rqty = Integer.parseInt(req.getParameter("rentqty").trim());
			int rid = Integer.parseInt(req.getParameter("rentpid").trim());
			session.setAttribute("rid", rid);
			res.sendRedirect("user/rentform.jsp?rentqty="+rqty);				
		}
		else if(action.equalsIgnoreCase("rentquickview"))
		{		
			int rentproid=Integer.parseInt(req.getParameter("productid").trim());				
			res.sendRedirect("user/quickRentProduct.jsp?rentproid="+rentproid);			
		}
		else if(action.equalsIgnoreCase("rentquickviewByUser"))
		{		
			int rentproid=Integer.parseInt(req.getParameter("productid").trim());		
			res.sendRedirect("user/quickRentProductByUserID.jsp?rentproid="+rentproid);			
		}	
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updaterentprod.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			Rentprodbean rpb=new Rentprodbean();		
			rpb.setRentProid(Integer.parseInt(req.getParameter("updateproid")));
			rpb.setRentProName(req.getParameter("updaterentproname"));
			rpb.setRentProductPrice(req.getParameter("updaterentproprice"));
			rpb.setRentProductQty1(Integer.parseInt(req.getParameter("updaterentqty")));
			rpb.setRentProductSpecification1(req.getParameter("updaterentprospecification"));
			Rentproddao rpd =new Rentproddao();
			rpd.updateRentproduct(rpb);
			res.sendRedirect("admin/viewrentprod.jsp");			
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			Rentproddao rpd=new Rentproddao();
			rpd.deleteRentProduct(id);
			res.sendRedirect("admin/viewrentprod.jsp");
		}
		else if (action.equalsIgnoreCase("Edit Inventory"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/inventoryUpdateRent.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update Rent Inventory"))
		{
			Rentprodbean rpb=new Rentprodbean();		
			rpb.setRentProid(Integer.parseInt(req.getParameter("updateproid")));
			rpb.setRentProName(req.getParameter("updaterentproname"));
			rpb.setRentProductPrice(req.getParameter("updaterentproprice"));
			rpb.setRentProductQty1(Integer.parseInt(req.getParameter("updaterentqty")));
			Rentproddao rpd =new Rentproddao();
			rpd.updateRentInventory(rpb);
			res.sendRedirect("admin/inventoryRent.jsp");			
		}
		else if(action.equalsIgnoreCase("Delete Rent Order"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			String email = req.getParameter("email");	
			String unm = req.getParameter("username");
			String productname = req.getParameter("productname");
			String userorderid = req.getParameter("userorderid");
			int checkid=Integer.parseInt(req.getParameter("userid"));
			int pid = Integer.parseInt(req.getParameter("proid"));
			String reason = "Due to technical reason";
			RentOrderCancelbean rob = new RentOrderCancelbean();	
			
			try 
			{			
				/*int pid1 =0 ;*/
				List<ORPbean> opb1 = ORPdao.getallORPByUserOrderId(userorderid);				
				for(ORPbean opb: opb1)
				{								
					rob.setRentProid(opb.getRentProid());
					/*pid1 = opb.getRentProid();*/
					rob.setORPid(opb.getORPid());
					rob.setUserRentOrderid(userorderid);
					rob.setReason(reason);
					rob.setUserid(checkid);			
					RentOrderCanceldao.InsertIntoORCancel(rob);
					ORPdao.CancelRentOrder(opb.getORPid(),userorderid);											
					/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
					int id1 = opb.getRentProid();
					int qty = opb.getQuantity();
					int totalqty = opb.getProductQty1();						
					int finalqty = qty + totalqty ; 
					Rentprodbean rpb1 = new Rentprodbean();
					rpb1.setRentProid(id1);
					rpb1.setRentProductQty1(finalqty);						
					Rentproddao.SetQuantityAftrOrder(rpb1);
					/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
					
					String nid = "5" ;
					String not_des = "Rent Order Cancel - \nOrder I'd "+userorderid+"is cancelled";
					Notificationbean nb = new Notificationbean();
					nb.setNot_id(nid);
					nb.setNot_description(not_des);
					Notificationdao.InsertIntoNotification(nb);
				}
				List<ORPStatusBean> orpb2 = ORPStatusdao.getRentOrderStatus(id,pid, checkid);
				for(ORPStatusBean orpb: orpb2)
				{	
					orpb.setRentprodid(pid);
					orpb.setStatus_id(orpb.getStatus_id());
					ORPStatusdao.deleteRentOrderStatus(orpb);
				}
			}
			catch (Exception e) 
			{			
				e.printStackTrace();
			}		
			
			/*try 
			{
				List<ORPStatusBean> orpb2 = ORPStatusdao.getRentOrderStatus(pid, checkid);
				for(ORPStatusBean orpb: orpb2)
				{	
					orpb.setRentprodid(pid);
					orpb.setStatus_id(orpb.getStatus_id());
					ORPStatusdao.deleteRentOrderStatus(orpb);
				}
			}
			catch (SQLException e) 
			{			
				e.printStackTrace();
			}	*/		
			ORPdao orp=new ORPdao();
			orp.deleteRentOrder(id);
			String subject ="Rent Order Cancelled";
			String body = "Dear "+unm+",\nYour rent order has been cancelled due to some reason.\n\nRENT PRODUCT NAME : "+productname+"\nRENT ORDER ID : "+userorderid+"\n\nThank You";
			mailOrder.sendCancelOrderViaMail(email,subject,body);
			res.sendRedirect("admin/viewRentOrders.jsp");
		}
	}		
}
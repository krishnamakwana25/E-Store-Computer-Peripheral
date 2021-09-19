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
import DAO.OrderCanceldao;
import DAO.OrderProductdao;
import DAO.OrderStatusdao;
import DAO.Productdao;
import bean.Notificationbean;
import bean.OrderCancelbean;
import bean.OrderProductbean;
import bean.OrderStatusBean;
import bean.Productbean;
import mail.mailOrder;
@WebServlet("/ProductController")
@MultipartConfig(fileSizeThreshold=1024*1024*10,    //10mb
maxFileSize=1024*1024*50,       //50mb
maxRequestSize=1024*1024*100)
public class ProductController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Insert"))
		{
			Part part1 = req.getPart("productphoto1");
			String path1= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part1.getSubmittedFileName();
			part1.write(path1);
			
			Part part2 = req.getPart("productphoto2");
			String path2= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part2.getSubmittedFileName();
			part2.write(path2);
			
			Part part3 = req.getPart("productphoto3");
			String path3= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part3.getSubmittedFileName();
			part3.write(path3);
			
			Part part4 = req.getPart("productphoto4");
			String path4= req.getServletContext().getRealPath("/")+"\\uploadimg\\"+part4.getSubmittedFileName();
			part4.write(path4);
						
			String q=req.getParameter("productqty");
			Productbean product=new Productbean();
			product.setSubcatname(req.getParameter("selectsubcat"));
			product.setMaincatname(req.getParameter("selectmaincat"));			
			product.setProductName(req.getParameter("productname"));
			product.setProductPhoto1(part1.getSubmittedFileName());
			product.setProductPhoto2(part2.getSubmittedFileName());
			product.setProductPhoto3(part3.getSubmittedFileName());
			product.setProductPhoto4(part4.getSubmittedFileName());
			product.setProductPrice(req.getParameter("productprice"));
			product.setProductQty1(Integer.parseInt(q));
			product.setProductSpecification1(req.getParameter("productspecification"));
			product.setProductDescription(req.getParameter("productdescription"));
			product.setProcessorName(req.getParameter("selectprocessor"));
			product.setRAM(req.getParameter("selectram"));
			product.setStorageHDD(req.getParameter("selecthdd"));
			product.setStorageSDD(req.getParameter("selectssd"));
			product.setGC(req.getParameter("selectGC"));
			Productdao pd=new Productdao();
			pd.insertproduct(product);
			res.sendRedirect("admin/viewproduct.jsp");		
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			Productdao pd=new Productdao();
			pd.deleteProduct(id);
			res.sendRedirect("admin/viewproduct.jsp");
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updateproduct.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			Productbean pb=new Productbean();		
			pb.setProductid(Integer.parseInt(req.getParameter("updateproid")));
			pb.setProductName(req.getParameter("updateproname"));
			pb.setProductPrice(req.getParameter("updateproprice"));
			pb.setProductQty1(Integer.parseInt(req.getParameter("updateqty")));
			pb.setProductSpecification1(req.getParameter("updateprospecification"));
			/* pb.setProductDescription(req.getParameter("updateprodescription")); */
			pb.setSubcatname(req.getParameter("updatesubcat"));
			pb.setMaincatname(req.getParameter("updatemaincat"));			
			Productdao pd =new Productdao();
			pd.updateProduct(pb);
			res.sendRedirect("admin/viewproduct.jsp");
			/*req.getRequestDispatcher("viewproduct.jsp").forward(req,res);*/
		}
		else if(action.equalsIgnoreCase("quickview"))
		{	
			HttpSession session= req.getSession();			
			String subcatname = req.getParameter("subcatname");
			System.out.println("in controller : "+subcatname);
			int proid=Integer.parseInt(req.getParameter("productid").trim());		
			session.setAttribute("proid", proid);
			res.sendRedirect("user/single.jsp?subcatname="+subcatname);			
		}
		else if( (action.equalsIgnoreCase("quickviewDealer")) || (action.equalsIgnoreCase("Provide Stock")) )
		{	
			HttpSession session= req.getSession();						
			int proid=Integer.parseInt(req.getParameter("productid").trim());		
			session.setAttribute("proid", proid);
			res.sendRedirect("dealer/QuickOutOfStockItem.jsp");		
		}
		else if(action.equalsIgnoreCase("quickviewDealer1"))
		{	
			HttpSession session= req.getSession();			
			int mainid = Integer.parseInt(req.getParameter("maincatid").trim());
			int proid=Integer.parseInt(req.getParameter("productid").trim());		
			session.setAttribute("proid", proid);
			res.sendRedirect("dealer/singleByDealerID.jsp?mainid="+mainid);			
		}
		else if(action.equalsIgnoreCase("quickviewByUserId"))
		{	
			HttpSession session= req.getSession();			
			int mainid = Integer.parseInt(req.getParameter("maincatid").trim());
			int proid=Integer.parseInt(req.getParameter("productid").trim());		
			session.setAttribute("proid", proid);
			res.sendRedirect("user/singleByUserID.jsp?mainid="+mainid);			
		}
		else if (action.equalsIgnoreCase("subcat"))
		{
			int sid=Integer.parseInt(req.getParameter("subcatid"));
			res.sendRedirect("user/ViewAllPagesBySubCat.jsp?sid="+sid);
		}
		else if (action.equalsIgnoreCase("subcatForALL"))
		{
			int sid=Integer.parseInt(req.getParameter("subcatid"));
			res.sendRedirect("user/viewAllpageBySubCatForALL.jsp?sid="+sid);
		}
		else if (action.equalsIgnoreCase("Edit Inventory"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/inventoryUpdateProd.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update Invenotry"))
		{
			Productbean pb=new Productbean();		
			pb.setProductid(Integer.parseInt(req.getParameter("updateproid")));
			pb.setProductName(req.getParameter("updateproname"));			
			pb.setProductPrice(req.getParameter("updateproprice"));
			pb.setProductQty1(Integer.parseInt(req.getParameter("updateqty")));
			Productdao pd =new Productdao();
			pd.updateProductInventory(pb);
			res.sendRedirect("admin/inventoryProd.jsp");			
		}
		else if(action.equalsIgnoreCase("Delete Order"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			int checkid=Integer.parseInt(req.getParameter("userid"));
			int pid = Integer.parseInt(req.getParameter("proid"));
			String email = req.getParameter("email");	
			String unm = req.getParameter("username");
			String productname = req.getParameter("productname");
			String userorderid = req.getParameter("userorderid");
		/*	try 
			{				
				List<OrderStatusBean> opb2 = OrderStatusdao.getOrderStatus(pid, checkid);
				for(OrderStatusBean opb: opb2)
				{	
					opb.setProduct_id(pid);
					opb.setStatus_id(opb.getStatus_id());
					OrderStatusdao.deleteOrderStatus(opb);					
				}
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}	*/
			String reason = "Due to technical reason";
			OrderCancelbean ocb = new OrderCancelbean();			
			try 
			{								
				List<OrderProductbean> opb1 = OrderProductdao.getallOPByUserOrderId(userorderid);				
					for(OrderProductbean opb: opb1)
					{								
						ocb.setProductid(opb.getProductid());
						ocb.setOPid(opb.getOPid());
						ocb.setUserOrderid(userorderid);
						ocb.setReason(reason);
						ocb.setUserid(checkid);			
						OrderCanceldao.InsertIntoOrderCancel(ocb);
						OrderProductdao.CancelOrder(opb.getOPid(),userorderid);
						
						/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
						int id1 = opb.getProductid();
						int qty = opb.getOrderQty();
						int totalqty = opb.getProductQty1();
						int finalqty = qty + totalqty ; 
						Productbean pb1 = new Productbean();
						pb1.setProductid(id1);
						pb1.setProductQty1(finalqty);
						Productdao.SetQuantityAftrOrder(pb1);
						/* ***********ADD QTY AFTR CANCELLING THE ORDER *****************/
						
						String nid = "4" ;
						String not_des = "Cancel Order - \nOrder I'd "+userorderid+"is cancelled";
						Notificationbean nb = new Notificationbean();
						nb.setNot_id(nid);
						nb.setNot_description(not_des);
						Notificationdao.InsertIntoNotification(nb);
					}
					List<OrderStatusBean> opb2 = OrderStatusdao.getOrderStatus(id,pid, checkid);
					for(OrderStatusBean opb: opb2)
					{	
						opb.setProduct_id(pid);
						opb.setStatus_id(opb.getStatus_id());
						OrderStatusdao.deleteOrderStatus(opb);					
					}
				}
				catch (Exception e) 
				{			
					e.printStackTrace();
				}			
			
			OrderProductdao opd=new OrderProductdao();
			opd.deleteOrder(id);
			String subject ="Order Cancelled";
			String body = "Dear "+unm+",\nYour order has been cancelled due to some reason.\n\nPRODUCT NAME : "+productname+"\nORDER ID : "+userorderid+"\n\nThank You";
			mailOrder.sendCancelOrderViaMail(email,subject,body);
				
			res.sendRedirect("admin/viewOrders.jsp");
		}
		else if (action.equalsIgnoreCase("subcatByDealer"))
		{
			int sid=Integer.parseInt(req.getParameter("subcatid"));
			res.sendRedirect("dealer/ViewAllPagesBySubCat.jsp?sid="+sid);
		}
	}		
}
package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CustCatdao;
import bean.CustomCatbean;

@WebServlet("/CustCatController")

public class CustCatController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Insert"))
		{
			CustomCatbean custcategory=new CustomCatbean();
			custcategory.setCustcatname(req.getParameter("custcatname"));
			CustCatdao cd=new CustCatdao();
			cd.insertcustomecategory(custcategory);
			/*req.getRequestDispatcher("#").forward(req,res);*/
			res.sendRedirect("admin/viewcustomecategory.jsp");
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			CustCatdao sd=new CustCatdao();
			sd.deletecustomecategory(id);
			res.sendRedirect("admin/viewcustomecategory.jsp");
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updatecustcat.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			CustomCatbean cb=new CustomCatbean();
			cb.setCustmaincatid(Integer.parseInt(req.getParameter("id")));
			cb.setCustcatname(req.getParameter("updatecustcat"));
			CustCatdao ccd =new CustCatdao();
			ccd.updateCustomecategory(cb);
			res.sendRedirect("admin/viewcustomecategory.jsp");
		}
	}
	

}

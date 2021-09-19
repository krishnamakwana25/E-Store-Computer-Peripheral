package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Subcategorydao;
import bean.Subcategorybean;
@WebServlet("/Subcategorycontroller")
public class Subcategorycontroller extends HttpServlet
{
		private static final long serialVersionUID = 1L;
		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
		{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("Insert"))
			{
				Subcategorybean subcategory=new Subcategorybean();
				subcategory.setSubcatname(req.getParameter("subcategoryname"));
				subcategory.setMaincatid(Integer.parseInt(req.getParameter("selectmaincategory")));
				Subcategorydao sd=new Subcategorydao();
				sd.insertsubcategory(subcategory);
				res.sendRedirect("admin/viewsubcategory.jsp");
			}
			else if(action.equalsIgnoreCase("Delete"))
			{
				int id=Integer.parseInt(req.getParameter("id"));			
				Subcategorydao sd=new Subcategorydao();
				sd.deletesubcategory(id);
				res.sendRedirect("admin/viewsubcategory.jsp");
			}
			else if (action.equalsIgnoreCase("Edit"))
			{
				int id=Integer.parseInt(req.getParameter("id"));
				res.sendRedirect("admin/updatesubcategory.jsp?id="+id);
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				Subcategorybean sb=new Subcategorybean();
				sb.setSubcatid(Integer.parseInt(req.getParameter("id")));
				sb.setSubcatname(req.getParameter("updatesubcategory"));
				sb.setMaincatname(req.getParameter("updatemaincategory"));
				Subcategorydao sd =new Subcategorydao();
				sd.updateSubcategory(sb);
				res.sendRedirect("admin/viewsubcategory.jsp");
			}
		}
}

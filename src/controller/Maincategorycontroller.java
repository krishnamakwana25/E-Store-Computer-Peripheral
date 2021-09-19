package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Maincategorydao;
import bean.Maincategorybean;
@WebServlet("/Maincategorycontroller")
public class Maincategorycontroller extends HttpServlet
{
		private static final long serialVersionUID = 1L;
		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
		{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("Insert"))
			{
				Maincategorybean maincategory=new Maincategorybean();
				maincategory.setMaincatname(req.getParameter("maincategoryname"));
				Maincategorydao md=new Maincategorydao();
				md.insertmaincategory(maincategory);
				/*req.getRequestDispatcher("#").forward(req,res);*/
				res.sendRedirect("admin/viewmaincategory.jsp");
			}
			else if(action.equalsIgnoreCase("Delete"))
			{
				int id=Integer.parseInt(req.getParameter("id"));
				Maincategorydao sd=new Maincategorydao();
				sd.deletemaincategory(id);
				res.sendRedirect("admin/viewmaincategory.jsp");
			}
			else if (action.equalsIgnoreCase("Edit"))
			{
				int id=Integer.parseInt(req.getParameter("id"));
				res.sendRedirect("admin/updatemaincategory.jsp?id="+id);
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				Maincategorybean mb=new Maincategorybean();
				mb.setMaincatid(Integer.parseInt(req.getParameter("id")));
				mb.setMaincatname(req.getParameter("updatemaincategory"));
				Maincategorydao md =new Maincategorydao();
				md.updateMaincategory(mb);
				res.sendRedirect("admin/viewmaincategory.jsp");
			}
		}
}


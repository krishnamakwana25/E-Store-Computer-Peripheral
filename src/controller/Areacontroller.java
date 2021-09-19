package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Areadao;
import bean.Areabean;
@WebServlet("/Areacontroller")
public class Areacontroller extends HttpServlet
{
		private static final long serialVersionUID = 1L;
		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
		{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("Insert"))
			{
					Areabean area=new Areabean();
					area.setStatename(req.getParameter("selectstate"));
					area.setCityname(req.getParameter("selectcity"));
					area.setAreaname(req.getParameter("area"));
					Areadao ad=new Areadao();
					ad.insertarea(area);
					res.sendRedirect("admin/viewarea.jsp");
			}
			else if(action.equalsIgnoreCase("Delete"))
			{
					int id=Integer.parseInt(req.getParameter("id"));
					Areadao ad=new Areadao();
					ad.deletearea(id);
					res.sendRedirect("admin/viewarea.jsp");
			}
			else if (action.equalsIgnoreCase("Edit"))
			{
				int id=Integer.parseInt(req.getParameter("id"));
				res.sendRedirect("admin/updatearea.jsp?id="+id);	
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				Areabean ab=new Areabean();
				ab.setAid(Integer.parseInt(req.getParameter("id")));
				ab.setAreaname(req.getParameter("updatearea"));
				ab.setCityname(req.getParameter("updatecity"));
				ab.setStatename(req.getParameter("updatestate"));
				Areadao ad =new Areadao();
				ad.updateArea(ab);
				/*req.getRequestDispatcher("viewarea.jsp").forward(req,res);*/
				res.sendRedirect("admin/viewarea.jsp");
			}
	}
}


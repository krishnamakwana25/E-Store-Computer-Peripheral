package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Citydao;
import bean.Citybean;
@WebServlet("/Citycontroller")
public class Citycontroller extends HttpServlet{
		private static final long serialVersionUID = 1L;
		public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("Insert"))
			{
					Citybean city=new Citybean();
					city.setCityname(req.getParameter("addcity"));
					city.setSid(Integer.parseInt(req.getParameter("selectstate")));
					Citydao cd=new Citydao();
					cd.insertcity(city);
					/*req.getRequestDispatcher("#").forward(req,res);*/
					res.sendRedirect("admin/viewcity.jsp");
			}
			else if(action.equalsIgnoreCase("Delete"))
			{
				int id=Integer.parseInt(req.getParameter("id"));			
				Citydao sd=new Citydao();
				sd.deletecity(id);
				/*req.getRequestDispatcher("viewcity.jsp").forward(req,res);*/
				res.sendRedirect("admin/viewcity.jsp");
			}
			else if (action.equalsIgnoreCase("Edit"))
			{
				int id=Integer.parseInt(req.getParameter("id"));			
				res.sendRedirect("admin/updatecity.jsp?id="+id);
			}
			else if(action.equalsIgnoreCase("Update"))
			{
				Citybean sb=new Citybean();
				sb.setCid(Integer.parseInt(req.getParameter("id")));
				sb.setCityname(req.getParameter("updatecity"));
				sb.setStatename(req.getParameter("updatestate"));
				Citydao sd =new Citydao();
				sd.updateCity(sb);
				/*req.getRequestDispatcher("viewcity.jsp").forward(req,res);*/
				res.sendRedirect("admin/viewcity.jsp");
			}
		}
	}

package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.Statedao;
import bean.Statebean;

@WebServlet("/Statecontroller")

public class Statecontroller extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("Insert"))
		{
				Statebean state=new Statebean();
				state.setStatename(req.getParameter("addstate"));
				Statedao sd=new Statedao();
				sd.insertstate(state);
				res.sendRedirect("admin/viewstate.jsp");
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));		
			Statedao sd=new Statedao();
			sd.deletestate(id);
			res.sendRedirect("admin/viewstate.jsp");
		
		}
		else if (action.equalsIgnoreCase("Edit"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			res.sendRedirect("admin/updatestate.jsp?id="+id);
		}
		else if(action.equalsIgnoreCase("Update"))
		{
			Statebean sb=new Statebean();
			sb.setSid(Integer.parseInt(req.getParameter("id")));
			sb.setStatename(req.getParameter("updatestate"));
			Statedao sd =new Statedao();
			sd.updateState(sb);
			res.sendRedirect("admin/viewstate.jsp");
			/*req.getRequestDispatcher("viewstate.jsp").forward(req,res);*/
		}
	}
}

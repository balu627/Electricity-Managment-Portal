package controller.Complaint;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ComplaintRegistration;
import dao.ChangeStatusDao;
import dao.SearchDao;

/**
 * Servlet implementation class ChangeStatusServlet
 */
@WebServlet("/changestatus")
public class ChangeStatusServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("complaintId"));
        ChangeStatusDao dao = new ChangeStatusDao();
					try {
						dao.changestatus(id);
//						request.setAttribute("rdcid",id );
						
					    RequestDispatcher rd = request.getRequestDispatcher("Complaint/changed.jsp");
					    rd.forward(request, response);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			
	}

}
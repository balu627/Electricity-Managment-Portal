package controller.Complaint;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ComplaintRegistration;
import dao.SearchDao;


@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("complaintId"));
        SearchDao dao = new SearchDao();
        ComplaintRegistration complaint = null;

			try {
				complaint = dao.getComplaintById(id);
				 request.setAttribute("complaint", complaint);
				 request.setAttribute("complaintId", id);
			        RequestDispatcher rd = request.getRequestDispatcher("Complaint/Search.jsp");
			        rd.forward(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
       
		//doGet(request, response);
	}

}
package controller.Complaint;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ComplaintRegistration;
import dao.ComplaintDao;
import dao.HistoryDao;


@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HistoryDao dao = new HistoryDao();

	        List<ComplaintRegistration> pending = dao.getComplaintsByStatus("pending");
	        List<ComplaintRegistration> solved = dao.getComplaintsByStatus("solved");

	        request.setAttribute("PendingComplaints",pending);
	        request.setAttribute("solvedComplaints", solved);

	        RequestDispatcher rd = request.getRequestDispatcher("Complaint/history.jsp");
	        rd.forward(request, response);
		//doGet(request, response);
	}

	
	
	
}

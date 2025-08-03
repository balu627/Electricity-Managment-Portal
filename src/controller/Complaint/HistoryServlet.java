package controller.Complaint;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ComplaintData;
import dao.ComplaintDao;


@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache");
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("Home/login.jsp");
		        return;
		    }
		    
			long consumerNo = Long.parseLong((String) session.getAttribute("consumerNo"));
		
			ComplaintDao dao = new ComplaintDao();
	        List<ComplaintData> complaints = dao.getComplaints(consumerNo);

	        request.setAttribute("Complaints",complaints);

	        RequestDispatcher rd = request.getRequestDispatcher("Complaint/history.jsp");
	        rd.forward(request, response);
	}

	
	
	
}

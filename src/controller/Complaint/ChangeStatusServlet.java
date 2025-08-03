package controller.Complaint;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ComplaintDao;



@WebServlet("/changestatus")
public class ChangeStatusServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache");
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("Home/login.jsp");
		        return;
		    }
		
		int ComplaintId = Integer.parseInt(request.getParameter("complaintId"));
		String status = request.getParameter("status");
		ComplaintDao dao = new ComplaintDao();
		dao.updateStatus(ComplaintId, status);
		response.sendRedirect("active");
	}

}
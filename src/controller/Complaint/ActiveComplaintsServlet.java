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


@WebServlet("/active")
public class ActiveComplaintsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache");
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("Home/login.jsp");
		        return;
		    }
		    
		    
		 ComplaintDao dao = new ComplaintDao();
		 List<ComplaintData> unsolved = dao.getComplaintsForAdmin();
		 
		 request.setAttribute("unsolved", unsolved);
		 RequestDispatcher rd = request.getRequestDispatcher("/Complaint/active.jsp");
		 rd.forward(request, response);
	}

}
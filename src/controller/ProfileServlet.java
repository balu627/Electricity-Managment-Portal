package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProfileDao;
import bean.CustomerData;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {


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
		CustomerData data = ProfileDao.getCustomerByConsumerNo(consumerNo);
		request.setAttribute("data", data);
		request.getRequestDispatcher("Profile/Profile.jsp").forward(request, response);
	}


}
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


@WebServlet("/UpdateProfileServlet")
public class UpdateProfilefetchServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		 if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		 
		 long user = Long.parseLong((String) session.getAttribute("consumerNo"));
		long consumerNo = user;
		CustomerData data = ProfileDao.getCustomerByConsumerNo(consumerNo);
		request.setAttribute("data", data);
		request.getRequestDispatcher("ProfileUpdate.jsp").forward(request, response);
	}

}
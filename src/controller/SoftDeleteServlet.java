package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProfileDao;

@WebServlet("/SoftDeleteServlet")
public class SoftDeleteServlet extends HttpServlet {
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long consumerNo = 1234567890123L;
		boolean softdone = ProfileDao.softDeleteCustomer(consumerNo);
		if (softdone) {
	        request.setAttribute("message", "Deleted successfully!");
	        request.setAttribute("path","login.jsp");
	    } else {
	        request.setAttribute("message", "Failed Try Again.");
	    }

	    request.getRequestDispatcher("UpdateAck.jsp").forward(request, response);
		
	}

}
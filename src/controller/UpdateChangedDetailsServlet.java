package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CustomerData;
import dao.ProfileDao;

@WebServlet("/UpdateChangedDetails")
public class UpdateChangedDetailsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CustomerData customer = new CustomerData();

        customer.setConsumerId(Long.parseLong(request.getParameter("consumerNo")));
        customer.setTitle(request.getParameter("title"));
        customer.setCustName(request.getParameter("name"));
        customer.setEmail(request.getParameter("email"));
        customer.setCountryCode(request.getParameter("countryCode"));
        customer.setMobile(Long.parseLong(request.getParameter("mobileNumber")));
        customer.setUserId(request.getParameter("userId"));
        customer.setPassword(request.getParameter("password"));
        

        boolean updated = ProfileDao.updateCustomerDetails(customer);

        if (updated) {
	        request.setAttribute("message", "Data Updated successfully!");
	        request.setAttribute("path","ProfileServlet");
	    } else {
	        request.setAttribute("message", "Failed to Update.");
	        request.setAttribute("path","ProfileServlet");
	    }

	    request.getRequestDispatcher("Profile/UpdateAck.jsp").forward(request, response);
    }
}
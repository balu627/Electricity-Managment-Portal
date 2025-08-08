package controller.Profile;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CustomerData;
import dao.ProfileDao;
import dao.UserDao;

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
        
        String message = "";
        ProfileDao pd = new ProfileDao();
        int checkMail = pd.checkEmailId(customer);
        int checkUserId = pd.checkUserId(customer);
        if(checkMail==1)
        {
        	message = message+"Mail Id ";
        }
        
        if(checkUserId==1)
        {
        	if(!message.equals(""))
        	{
        		message += "And ";
        	}
        	message+="UserId ";
        }
        message+="Exists";
        if(checkMail==1 || checkUserId==1)
        {
        	request.setAttribute("message", message);
	        request.setAttribute("path","UpdateProfileServlet"); 
	        request.getRequestDispatcher("Profile/UpdateAck.jsp").forward(request, response);
        	return;
        }
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
package controller.Home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import bean.CustomerData;
import controller.MailUtil;

@WebServlet("/RegisterConsumerServlet")
public class RegisterConsumerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        long ConsumerID = Long.parseLong(request.getParameter("ConsumerID"));
        int billNo = Integer.parseInt(request.getParameter("billNo"));
        String title = request.getParameter("title");
        String custName = request.getParameter("custName");
        int age = Integer.parseInt(request.getParameter("custAge"));
        String email = request.getParameter("email");
        String countryCode = request.getParameter("countryCode");
        long mobile = Long.parseLong(request.getParameter("mobile"));
        String address = request.getParameter("address");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match!");
            request.getRequestDispatcher("Home/consumer_register.jsp").forward(request, response);
            return;
        }
        
        CustomerData customer = new CustomerData();
        customer.setConsumerId(ConsumerID);
        customer.setBillNo(billNo);
        customer.setTitle(title);
        customer.setCustName(custName);
        customer.setAge(age);
        customer.setEmail(email);
        customer.setCountryCode(countryCode);
        customer.setMobile(mobile);
        customer.setAddress(address);
        customer.setUserId(userId);
        customer.setPassword(password);

        try {
            String isOk = UserDao.checkConstraints(customer);
            if (isOk.equals("ok")) {
                int rows = UserDao.addUser(customer);
                
                if (rows > 0) {
                	
                	 // Send email
                    String subject = "Thank You for Registering with Us!";
                    String msg = "Dear " + customer.getTitle() + " " + customer.getCustName() + ",\n\n"
                               + "Thank you for choosing our service. Your account has been successfully created.\n\n"
                               + "Regards,Electricty Managment";
                    
                    MailUtil.sendEmail(customer.getEmail(), subject, msg);
                	
                	
                    request.setAttribute("CUSTOMER_ID", customer.getConsumerId());
                    request.setAttribute("custName", customer.getTitle() + " " + customer.getCustName());
                    request.setAttribute("email", customer.getEmail());
                    request.setAttribute("userId", customer.getUserId());
                    request.getRequestDispatcher("Home/regsuccess.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Please try again.");
                    request.getRequestDispatcher("Home/consumer_register.jsp").forward(request, response);
                }
            } else {
                   request.setAttribute("message", isOk);
                request.setAttribute("redirectPage", "Home/consumer_register.jsp");
                request.getRequestDispatcher("Home/message.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("Home/consumer_register.jsp").forward(request, response);
        }
    }
}

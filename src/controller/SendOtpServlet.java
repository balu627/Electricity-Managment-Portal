package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SendOtpServlet")
public class SendOtpServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        int otp = 100000 + new java.util.Random().nextInt(900000);
        
        
        long expiryTime = System.currentTimeMillis() + (5 * 60 * 1000); // 5 minutes
        request.getSession().setAttribute("otp", otp);
        request.getSession().setAttribute("otpExpiry", expiryTime);

        
        // TODO: Send OTP email via JavaMail API here
        String subject = "OTP to Verify Your Email";

        String msg = "Dear Customer,\n\n"
            + "Your One-Time Password (OTP) for email verification is: " + otp + "\n\n"
            + "Please enter this code on the verification page to complete the process.\n"
            + "This OTP is valid for a limited time.\n\n"
            + "Thank you for choosing our service.\n\n"
            + "Regards,\n"
            + "Electricity Management Team";
        
        MailUtil.sendEmail(email, subject, msg);
        
        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\"}");

    }

}

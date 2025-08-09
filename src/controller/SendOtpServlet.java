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
        
        request.getSession().setAttribute("otp", otp);
        
        // TODO: Send OTP email via JavaMail API here
        String subject = "OTP To verify Your Mail!";
        String msg = "Dear Customer, Otp for your mail is here"+otp+".\n"
                   + "Thank you for choosing our service.\n\n"
                   + "Regards,Electricty Managment";
        
        MailUtil.sendEmail(email, subject, msg);
        
        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\"}");

    }

}

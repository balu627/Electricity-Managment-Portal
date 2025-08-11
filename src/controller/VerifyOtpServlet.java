package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userOtp = request.getParameter("otp");
        Object otpObj = request.getSession().getAttribute("otp");
        Object expiryObj = request.getSession().getAttribute("otpExpiry");

        response.setContentType("application/json");

        if (otpObj == null || expiryObj == null) {
            // No OTP found in session
            response.getWriter().write("{\"status\":\"error\",\"message\":\"OTP not found. Please request a new one.\"}");
            return;
        }

        long expiryTime = (long) expiryObj;
        if (System.currentTimeMillis() > expiryTime) {
            // OTP expired
            request.getSession().removeAttribute("otp");
            request.getSession().removeAttribute("otpExpiry");
            response.getWriter().write("{\"status\":\"error\",\"message\":\"OTP has expired. Please request a new one.\"}");
            return;
        }

        if (userOtp.equals(String.valueOf(otpObj))) {
            // OTP correct
            request.getSession().removeAttribute("otp");
            request.getSession().removeAttribute("otpExpiry");
            response.getWriter().write("{\"status\":\"success\",\"message\":\"OTP verified successfully!\"}");
        } else {
            // OTP incorrect
            response.getWriter().write("{\"status\":\"fail\",\"message\":\"Invalid OTP. Please try again.\"}");
        }
    }
}

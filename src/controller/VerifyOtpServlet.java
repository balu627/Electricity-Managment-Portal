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
        
        response.setContentType("application/json");
        if (otpObj != null && userOtp.equals(String.valueOf(otpObj))) {
            response.getWriter().write("{\"status\":\"success\"}");
        } else {
            response.getWriter().write("{\"status\":\"fail\"}");
        }
	}

}

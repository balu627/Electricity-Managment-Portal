package controller.Home;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDao;
import dao.UserDao;

@WebServlet("/ValidateCredentialsGetOTP")
public class ValidateCredentialsGetOTP extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        long consumerId = Long.parseLong(request.getParameter("ConsumerID"));
        int billNo = Integer.parseInt(request.getParameter("billNo"));
        
        UserDao dao = new UserDao();
        BillDao bill = new BillDao();
        
        String email = dao.checkAndGetEmail(consumerId);
        String billmsg  = bill.verifybill(billNo, consumerId);
        
        StringBuilder json = new StringBuilder();
        json.append("{");

        if ("Created".equals(email) && "match".equals(billmsg)) {
            json.append("\"status\":\"error\",");
            json.append("\"message\":\"Account is Already Registered With this consumerId.\"");
        } 
        else if ("Not match".equals(billmsg)) {
            json.append("\"status\":\"error\",");
            json.append("\"message\":\"Bill No and Consumer Id do not match.\"");
        } 
        else if (!"Created".equals(email) && email != null && "match".equals(billmsg)) {
            json.append("\"status\":\"success\",");
            json.append("\"email\":\"").append(email).append("\"");
        } 
        else if (!"Created".equals(email) && email != null && !"match".equals(billmsg))
        {
        	json.append("\"status\":\"error\",");
            json.append("\"message\":\"Bill No does not match.\"");
        }
        else if (email == null) {
            json.append("\"status\":\"error\",");
            json.append("\"message\":\"Wrong Credientials\"");   
        }

        json.append("}");

        response.getWriter().write(json.toString());
    }
}

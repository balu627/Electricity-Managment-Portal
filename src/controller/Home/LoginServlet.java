package controller.Home;

import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.LoginDao;
import dao.adminDao;
//import util.DBUserTableCreator;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userType = request.getParameter("userType");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");

        try {
//            DBUserTableCreator.createAdminTable();

            String result = LoginDao.checklogin(userType, userId, password);

            if (!result.equals("Match") && !result.equals("inactive")) {
                request.setAttribute("message", result);
                request.setAttribute("redirectPage", "Home/login.jsp");
                request.getRequestDispatcher("Home/message.jsp").forward(request, response);
                return;
            }
             
            if(result.equals("inactive"))
            {
            	request.setAttribute("userId", userId);
            	request.getRequestDispatcher("Profile/Restore.jsp").forward(request, response);
            }

            ResultSet rs = LoginDao.getSuccessCredentials(userId, userType);

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", userId);
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("role", userType);

                if (!userType.equals("admin")) {
                    String consumerNo = Long.toString(rs.getLong("consumerId"));
                    session.setAttribute("consumerNo", consumerNo);
                }

                request.setAttribute("message", "Login Success");
                
                if (userType.equals("admin")) {
                	String totalcust = adminDao.getTotalcust();
                    String pendcomplaints = adminDao.getpendComplaints();
                    String billsGenerated = adminDao.getBillsGenerated();
                    session.setAttribute("totalcust", totalcust);
                    session.setAttribute("pendcomplaints",pendcomplaints);
                    session.setAttribute("billsGenerated", billsGenerated);
                    request.setAttribute("redirectPage", "Home/adminhome.jsp");
                } else {
                    request.setAttribute("redirectPage", "Home/home.jsp");
                }
                request.getRequestDispatcher("Home/Loginsuccess.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Invalid login credentials.");
                request.setAttribute("redirectPage", "Home/login.jsp");
                request.getRequestDispatcher("Home/message.jsp").forward(request, response);
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("Home/login.jsp").forward(request, response);
        }
    }
}

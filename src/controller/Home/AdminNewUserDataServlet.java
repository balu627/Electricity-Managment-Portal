package controller.Home;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CustomerData;
import dao.UserDao;

@WebServlet("/AdminNewUserDataServlet")
public class AdminNewUserDataServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao dao = new UserDao();
		List<CustomerData> users = dao.getNewUserData();
		
		request.setAttribute("users", users);
		request.getRequestDispatcher("Home/AdminNewUserData.jsp").forward(request, response);;
	}



}

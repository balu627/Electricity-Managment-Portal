package controller.Home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CustomerData;
import dao.UserDao;


@WebServlet("/ConnectionRequestServlet")
public class ConnectionRequestServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerData consumer = new CustomerData();
		
		consumer.setTitle((String)request.getParameter("title"));
		consumer.setCustName((String)request.getParameter("fullName"));
		consumer.setEmail((String) request.getParameter("email"));
		consumer.setCountryCode((String) request.getParameter("countryCode"));
		consumer.setMobile(Long.parseLong(request.getParameter("mobile")));
		consumer.setAddress((String)request.getParameter("address"));
		UserDao dao = new UserDao();
		int newtable =  dao.checkNewUserEmail(consumer);
		int existingtable = UserDao.checkEmailId(consumer);
		
		if((newtable)==1||(existingtable)==1)
		{
			request.setAttribute("message","exists");
		}
		else
		{
			int result = dao.addNewUser(consumer);
			if(result == 1)
			{
				request.setAttribute("message","submitted");
			}
		}
		
		request.getRequestDispatcher("shared/NewUserAck.jsp").forward(request,response);
	}

}

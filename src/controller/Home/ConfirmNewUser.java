package controller.Home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.CustomerData;
import controller.MailUtil;
import controller.BillServlets.addBillservlet;
import dao.UserDao;


@WebServlet("/ConfirmNewUser")
public class ConfirmNewUser extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("Id"));
		//create consumer id new 
		UserDao dao = new UserDao();
		CustomerData customer = dao.getNewUserDataByID(id);
		Long consumerId  = dao.getConsumerNewId(customer);
		//add consumer id in new table 
		int addedcno = dao.updateConsumerNoInNewUser(consumerId, id);
		//add a bill in bill table 
		addBillservlet ad = new addBillservlet();
		int BillNo = ad.addbill(consumerId);
		//mail to customer
		String subject = "Consumer & Bill Details Generated";

		String msg = "Dear " + customer.getTitle() + " " + customer.getCustName() + ",\n\n"
		    + "Thank you for choosing our service.\n"
		    + "Your Consumer Number and Bill Number have been successfully generated.\n"
		    + "You can now proceed to the next step by registering on our customer portal.\n"
		    + "During registration, create your username and password, and use the details below:\n\n"
		    + "Consumer No : " + consumerId + "\n"
		    + "Bill No     : " + BillNo + "\n\n"
		    + "Regards,\n"
		    + "Electricity Management Team";

         
         MailUtil.sendEmail(customer.getEmail(), subject, msg);
		
         response.sendRedirect("AdminNewUserDataServlet?userId=101");
	}

}

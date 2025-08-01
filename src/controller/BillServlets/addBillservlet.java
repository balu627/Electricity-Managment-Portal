package controller.BillServlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import bean.Bill;
import dao.BillDao;

@WebServlet("/addBillservlet")
public class addBillservlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache");
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		
		
		long consumerNo = Long.parseLong(request.getParameter("consumerNo"));
	    Bill bill = new Bill();
	    RandomUnitGenerator rg = new RandomUnitGenerator();
	    int units = rg.GenerateUnits();
	    bill.setConsumerNo(consumerNo);
	    bill.setAmount(rg.calculateAmount(units));
	    bill.setMonth(rg.GetPrevMonth());
	    bill.setUnits(units);
	    int status = BillDao.addBill(bill);
	    if (status > 0) {
	        request.setAttribute("message", "Bill added successfully!");
	    } else {
	        request.setAttribute("message", "Failed to add bill.");
	    }

	    
	    request.getRequestDispatcher("/Bills/billAdded.jsp").forward(request, response);
	}

}

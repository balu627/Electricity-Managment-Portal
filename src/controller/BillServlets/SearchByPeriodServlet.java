package controller.BillServlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Bill;
import bean.MonthName;
import dao.BillDao;

@WebServlet("/SearchByPeriodServlet")
public class SearchByPeriodServlet extends HttpServlet {
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		 response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		
		String fromMonth = (request.getParameter("from"));
		String toMonth = (request.getParameter("to"));
		long user = Long.parseLong((String) session.getAttribute("consumerNo"));
		
		List<Bill> specificperiodbills = new ArrayList<>();
		ResultSet rs = BillDao.getSpecifcPeriod(fromMonth,toMonth,user);
		try {
			while(rs.next())
			{
				Bill temp = new Bill();
            	temp.setBillNo(rs.getInt("billNo"));
            	temp.setMonth(rs.getDate("month").toString());
            	temp.setStatus(rs.getString("status"));
            	temp.setAmount(rs.getInt("amount"));
            	temp.setTransactionId(rs.getInt("transactionId"));
            	temp.setPaymentTimeDate(rs.getString("paymentTimeDate"));
            	temp.setModeOfPayment(rs.getString("modeOfPayment"));
            	temp.setUnits(rs.getInt("units"));
            	specificperiodbills.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		MonthName mn = new MonthName();
		String sendfm = fromMonth;
		String sendtm = toMonth;
		request.setAttribute("from", sendfm);
		request.setAttribute("to", sendtm);
//		request.setAttribute("specificperiodbills", specificperiodbills);
		request.setAttribute("paidBillsFiveMonths", specificperiodbills);
	    request.getRequestDispatcher("BillHistory.jsp").forward(request, response);
	    
	}

}

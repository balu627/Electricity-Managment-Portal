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
import dao.BillDao;
import util.DBBillTableCreator;

@WebServlet("/BillHistory")
public class BillHistoryServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache");
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		
//		HttpSession session = request.getSession();
		 DBBillTableCreator.createBillTable();
		long user = Long.parseLong((String) session.getAttribute("consumerNo"));
		List<Bill> paidBillsFiveMonths = new ArrayList<>();
		ResultSet rs = BillDao.getPastFiveMonths(user);
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
            	paidBillsFiveMonths.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sendfm = "";
		String sendtm = "";
		request.setAttribute("from", sendfm);
		request.setAttribute("to", sendtm);
		request.setAttribute("paidBillsFiveMonths", paidBillsFiveMonths);
	    request.getRequestDispatcher("BillHistory.jsp").forward(request, response);
	}

}

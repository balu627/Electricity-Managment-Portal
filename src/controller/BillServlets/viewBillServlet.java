package controller.BillServlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import bean.Bill;
import dao.BillDao;

@WebServlet("/viewBills")
public class viewBillServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache"); 
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("Home/login.jsp");
		        return;
		    }
    	
    	
    	List<Bill> data = new ArrayList<>();
        long user = Long.parseLong((String) session.getAttribute("consumerNo"));
        try {
            ResultSet rs = BillDao.getUnpaidBills(user);
            while (rs != null && rs.next()) {
                Bill bill = new Bill();
                bill.setBillNo(rs.getInt("billNo"));
                bill.setConsumerNo(rs.getLong("consumerNo"));
                bill.setAmount(rs.getInt("amount"));
                bill.setMonth(rs.getString("month").toString());
                bill.setStatus(rs.getString("status"));
                bill.setUnits(rs.getInt("units"));
                data.add(bill);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("unpaidBills", data);
        request.getRequestDispatcher("Bills/ViewBill.jsp").forward(request, response);
    }
}

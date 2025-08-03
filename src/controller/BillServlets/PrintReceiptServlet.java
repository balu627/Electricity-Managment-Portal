package controller.BillServlets;

import java.io.IOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDao;


@WebServlet("/PrintReceiptServlet")
public class PrintReceiptServlet extends HttpServlet {       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
		 response.setHeader("Pragma", "no-cache"); 
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		
		int transactionid = Integer.parseInt(request.getParameter("transactionId"));
		
		String[] billId = new String[0];
		String modeofTxn="";
		String paymenttimeanddate="";
		int totalAmount = 0;
		try{
				ResultSet rs = BillDao.getBillsByTid(transactionid);
				while(rs.next()){
					if(totalAmount==0)
					{
						totalAmount=rs.getInt("paidAmount");
						modeofTxn+=rs.getString("modeOfPayment");
						paymenttimeanddate+=rs.getString("paymentTimeDate");
					}
					String eachbill = String.valueOf(rs.getInt("billNo"));
					
					billId = Arrays.copyOf(billId,billId.length+1);
					billId[billId.length-1]=eachbill;
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("billNodis",billId);
		request.setAttribute("paymentdateandtime",paymenttimeanddate);
		request.setAttribute("Tid",transactionid);
		request.setAttribute("paymentmode",modeofTxn);
		request.setAttribute("totalamount", totalAmount);
	    request.getRequestDispatcher("/Bills/SuccessScreen.jsp").forward(request, response);
	}

}

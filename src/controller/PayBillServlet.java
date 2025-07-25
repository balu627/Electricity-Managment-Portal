package controller;
import java.util.*;
import bean.Bill;
import dao.BillDao;
import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/PayBillServlet")
public class PayBillServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		 response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		 response.setDateHeader("Expires", 0);
		 
		 HttpSession session = request.getSession();
		 
		    if (session  == null || session.getAttribute("user") == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		
		
		String[] selectedBills = request.getParameterValues("billSelect");
		
		
	    List<Bill> checkedbills = new ArrayList<>();
	    
	    if (selectedBills != null) {
	    	try{
			    	Connection con = DBConnection.getConnection();
			        for (String billNo : selectedBills) 
			        {
			        	int num = Integer.parseInt(billNo);
			        	
		        	
		        		ResultSet rs = BillDao.getBillsByNo(num,con);	        		
			            while(rs.next())
			            {
			            	Bill temp = new Bill();
			            	temp.setBillNo(rs.getInt("billNo"));
			            	temp.setAmount(rs.getInt("amount"));
			            	temp.setMonth(rs.getDate("month").toString());
			            	checkedbills.add(temp);
			            }
			        }
	        }
	    	catch(Exception e)
        	{
       		 e.printStackTrace();
        	}	
	    	
	    }
	    request.setAttribute("selectedBills",checkedbills);
	    request.getRequestDispatcher("PayBill.jsp").forward(request, response);
	    
	}

}



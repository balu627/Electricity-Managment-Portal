
package controller;

import java.io.IOException;
import java.util.Locale;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BillDao;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/paymentSuccessServlet")
public class PaymentSuccessServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] billNos = request.getParameterValues("billNo");
		String paymentMode = request.getParameter("paymentMode");
		String totalAmount = request.getParameter("totalamount");
		
		
		Random r= new Random();
		int temptransactionId = 0;
		String timedateformat = "";
		boolean exists = true;
		do
		{
			temptransactionId = r.nextInt(10000000);
			exists  =  BillDao.checkTransactionId(temptransactionId);
			
		}while(exists);
		
		if(!exists && temptransactionId!=0)
		{
			LocalDateTime currentDateTime = LocalDateTime.now();
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.getDefault());
	        String dateOnly = currentDateTime.format(dateFormatter);
	        
	        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss", Locale.getDefault());
	        String timeOnly = currentDateTime.format(timeFormatter);
	        
	        timedateformat = dateOnly+" "+timeOnly;
	        
	        
			for(int i=0;i<billNos.length;i++)
			{
				int billNo = Integer.parseInt(billNos[i]);
				BillDao.updateTransactionId(billNo, timedateformat, paymentMode, temptransactionId);				
			}
		}
		
		
		request.setAttribute("billNodis",billNos);
		request.setAttribute("paymentdateandtime",timedateformat);
		request.setAttribute("Tid",temptransactionId);
		request.setAttribute("paymentmode",paymentMode);
		request.setAttribute("totalamount", totalAmount);
	    request.getRequestDispatcher("SuccessScreen.jsp").forward(request, response);
	}

}

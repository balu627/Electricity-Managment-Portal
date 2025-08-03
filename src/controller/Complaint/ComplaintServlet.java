package controller.Complaint;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ComplaintData;
import dao.ComplaintDao;



@WebServlet("/register")
public class ComplaintServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ComplaintData data = new ComplaintData();
        ComplaintDao dao = new ComplaintDao();
		Random r = new Random();
		int complaintId;
		boolean check = false;
 		do
		{
			complaintId = r.nextInt(10000000);	
			try {
				check = dao.uniqueComplaintId(complaintId);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}while(check);
    	
    	data.setComplaintId(complaintId);
    	data.setConsumerNo(Long.parseLong(request.getParameter("consumernumber")));
    	data.setName(request.getParameter("name"));
    	data.setMobile((request.getParameter("mobile")));
    	data.setCategoryType(request.getParameter("category"));
    	data.setComplaintType(request.getParameter("complaintType"));
    	data.setLandmark(request.getParameter("landmark"));
    	data.setAddress(request.getParameter("address"));
    	data.setDescription(request.getParameter("description"));
    	data.setStatus("Pending");

        
        try {
			dao.registercomplaint(data);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        RequestDispatcher rd = request.getRequestDispatcher("/Home/home.jsp");
		 
		 rd.forward(request, response);
	}
}
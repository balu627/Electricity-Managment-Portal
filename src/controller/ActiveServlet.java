package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ComplaintRegistration;
import dao.HistoryDao;


@WebServlet("/active")
public class ActiveServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		 HistoryDao dao = new HistoryDao();
		 List<ComplaintRegistration> unsolved = dao.getComplaintsByStatus("pending");
		 
		 request.setAttribute("unsolved", unsolved);
		 
		 RequestDispatcher rd = request.getRequestDispatcher("active.jsp");
		 
		 rd.forward(request, response);
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
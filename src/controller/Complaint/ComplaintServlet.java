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

import bean.ComplaintRegistration;
import dao.ComplaintDao;


/**
 * Servlet implementation class ComplaintServlet
 */
@WebServlet("/register1")
public class ComplaintServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("complaint");
		String cat = request.getParameter("cat");
		String cp = request.getParameter("cpn");
		String lm = request.getParameter("lmk");
		long cn = Long.parseLong(request.getParameter("cnb"));
		String pd = request.getParameter("pd");
		long mb = Long.parseLong(request.getParameter("mb"));
		String add = request.getParameter("add");
		Random r = new Random();
   		int max=9999,min=1000;
    	int rdcid = r.nextInt(max - min + 1) + min;
		String st ="pending";
		ComplaintRegistration  user = new ComplaintRegistration(type, cat, cp, lm, cn, pd, mb, add, rdcid, st);
        ComplaintDao dao = new ComplaintDao();
        
        try {
			dao.registercomplaint(user, rdcid,st);
			request.setAttribute("rdcid",rdcid );
			
		    RequestDispatcher rd = request.getRequestDispatcher("Complaint/confirm.jsp");
		    rd.forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}
	}
}
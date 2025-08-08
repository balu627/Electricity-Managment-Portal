package controller.Home;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.adminDao;

@WebServlet("/AdminHomeServlet")
public class AdminHomeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String totalcust = adminDao.getTotalcust();
        String pendcomplaints = adminDao.getpendComplaints();
        String billsGenerated = adminDao.getBillsGenerated();
        request.setAttribute("totalcust", totalcust);
        request.setAttribute("pendcomplaints",pendcomplaints);
        request.setAttribute("billsGenerated", billsGenerated);
        request.getRequestDispatcher("Home/adminhome.jsp").forward(request, response);
	}

}

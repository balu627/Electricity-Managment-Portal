package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ChangeUserStatusDoa;

@WebServlet("/restoreAccount")
public class RestoreAccount extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = request.getParameter("userId");

        ChangeUserStatusDoa.updatestatus(userId);

        response.sendRedirect("Home/login.jsp");
    }
}

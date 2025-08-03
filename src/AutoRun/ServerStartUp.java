package AutoRun;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import dao.CreateTables;

public class ServerStartUp extends HttpServlet  {
	
	        @Override
	        public void init() throws ServletException {
	        	System.out.println("Server is starting — one-time logic here!");
	            System.out.println("Creating Tables");
	            CreateTables.Create();
	            System.out.println("Tables Created");

	}

}

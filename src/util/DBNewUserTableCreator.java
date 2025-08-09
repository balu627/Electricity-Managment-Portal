package util;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DBNewUserTableCreator {
	
	 public static void createUserTable() {
	        Connection con = null;
	        Statement stmt = null;
	        try {
	            con = DBConnection.getConnection();
	            stmt = con.createStatement();
	            String sql = "CREATE TABLE NewUser (Id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),title VARCHAR(10),name VARCHAR(50),email VARCHAR(100) UNIQUE,countryCode VARCHAR(20),mobile BIGINT,address VARCHAR(250),ConsumerNo BIGINT UNIQUE)";
	            stmt.executeUpdate(sql);
	            System.out.println("New User table created successfully!");
	        } catch (SQLException e) {
	                System.out.println("New User EXISTS");
	        } finally {
	            try {
	                if (con != null) con.close();
	            } catch (Exception e) {
	                System.out.println("Close issue");
	            }
	        }
	    }
	    
}

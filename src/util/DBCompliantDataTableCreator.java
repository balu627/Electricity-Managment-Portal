package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DBCompliantDataTableCreator {
    
    public static void createComplaintDataTable() throws ClassNotFoundException {
        Connection con = null;
        Statement stmt = null;
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "CREATE TABLE COMPLAINT ("
            		+ "COMPLAINTID INT PRIMARY KEY,"
            		+ "CONSUMERNO BIGINT,"
            		+ "NAME VARCHAR(100),"
            		+ "MOBILE VARCHAR(50),"
            		+ "CATEGORYTYPE VARCHAR(50),"
                    + "COMPLAINTTYPE VARCHAR(50), "
                    + "LANDMARK VARCHAR(100), "   
                    + "ADDRESS VARCHAR(200),"
                    + "DESCRIPTION VARCHAR(500),"
                    + "STATUS VARCHAR(50))";
            stmt.executeUpdate(sql);
            System.out.println("Complaint table created successfully!");
        } catch (SQLException e) {
            System.out.println("Complaint table already exists.");
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Connection close issue");
            }
        }
    }
}

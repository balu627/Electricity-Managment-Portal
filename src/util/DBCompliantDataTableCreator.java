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
                    + "TYPE VARCHAR(50), "
                    + "CATEGORY VARCHAR(50), "
                    + "CONTACTPERSON VARCHAR(100), "
                    + "LANDMARK VARCHAR(100), "
                    + "CONSUMERNUMBER BIGINT, "
                    + "Problem VARCHAR(500), "
                    + "ADDRESS VARCHAR(200), "
                    + "MOBILE BIGINT, "
                    + "rdcid INT, "
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

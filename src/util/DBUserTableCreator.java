package util;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DBUserTableCreator {

    public static void createUserTable() {
        Connection con = null;
        Statement stmt = null;
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "CREATE TABLE CustomerData (consumerId BIGINT PRIMARY KEY,billNo BIGINT UNIQUE,title VARCHAR(10),name VARCHAR(50),age INT,email VARCHAR(100),countryCode VARCHAR(20),mobile BIGINT,address VARCHAR(250),userId VARCHAR(50),password VARCHAR(50),status VARCHAR(20))";
            stmt.executeUpdate(sql);
            System.out.println("User table created successfully!");
        } catch (SQLException e) {
                System.out.println("USER TABLE EXISTS");
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Close issue");
            }
        }
    }
    
    public static void createAdminTable() {
        Connection con = null;
        Statement stmt = null;
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();

            String sql = "CREATE TABLE AdminCred ("
                       + "userId VARCHAR(50) PRIMARY KEY,"
                       + "password VARCHAR(50),"
                       + "name VARCHAR(50),"
                       + "email VARCHAR(100) UNIQUE)";
            stmt.executeUpdate(sql);
            System.out.println("AdminCred table created successfully!");

 
            String insertSql = "INSERT INTO AdminCred (userId, password, name, email) "
                             + "VALUES ('admin', 'admin123', 'Admin', 'admin@gmail.com')";
            stmt.executeUpdate(insertSql);
            System.out.println("Default admin user inserted!");

        } catch (SQLException e) {
            System.out.println("AdminCred table exists");
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Close issue");
            }
        }
    }

}

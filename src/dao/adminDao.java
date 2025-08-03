package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

//import util.DBBillTableCreator;
//import util.DBCompliantDataTableCreator;
import util.DBConnection;
//import util.DBUserTableCreator;

public class adminDao {
    public static String getTotalcust() {
//        DBUserTableCreator.createUserTable();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String total = "0";
        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT COUNT(*) AS total FROM CustomerData";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                total = String.valueOf(rs.getInt("total"));
            }
        } catch (Exception e) {
            total = "0";
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
            }
        }
        return total;
    }
    
    public static String getpendComplaints() {
//        try {
////            DBCompliantDataTableCreator.createComplaintDataTable();
//        } catch (ClassNotFoundException e1) {
//            e1.printStackTrace();
//        }
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String total = "0";
        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT COUNT(*) AS total FROM Complaint WHERE STATUS = 'pending'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                total = String.valueOf(rs.getInt("total"));
            }
        } catch (Exception e) {
            total = "0";
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
            }
        }
        return total;
    }
    
    public static String getBillsGenerated() {
//        DBBillTableCreator.createBillTable();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String total = "0";
        try {
            conn = DBConnection.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT COUNT(*) AS total FROM Bill WHERE status = 'unpaid'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                total = String.valueOf(rs.getInt("total"));
            }
        } catch (Exception e) {
            total = "0";
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
            }
        }
        return total;
    }

}

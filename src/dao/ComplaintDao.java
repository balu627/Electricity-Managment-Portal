package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.ComplaintRegistration;
import util.DBConnection;
import util.DBCompliantDataTableCreator;

public class ComplaintDao {

         

    public boolean registercomplaint(ComplaintRegistration user, int rdcid, String s) throws ClassNotFoundException, SQLException {
        boolean success = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();
            DBCompliantDataTableCreator.createComplaintDataTable();
            String sql = "INSERT INTO COMPLAINT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, user.getType());
            ps.setString(2, user.getCategory());
            ps.setString(3, user.getContactperson());
            ps.setString(4, user.getLandmark());
            ps.setLong(5, user.getConsumernumber());
            ps.setString(6, user.getProblemdescription());
            ps.setString(7, user.getAddress());
            ps.setLong(8, user.getMobile());
            ps.setInt(9, rdcid);
            ps.setString(10, s);

            int rows = ps.executeUpdate();
            success = rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }

        return success;
    }
}

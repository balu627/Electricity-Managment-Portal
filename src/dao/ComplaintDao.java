package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.ComplaintData;
import util.DBConnection;


public class ComplaintDao {
	
		public void updateStatus(int ComplaintId,String status)
		{
			try (Connection conn = DBConnection.getConnection()) {
		        String sql = "Update  COMPLAINT SET STATUS = ?  WHERE COMPLAINTID  = ? ";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ps.setInt(2, ComplaintId);
		        ps.executeUpdate();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		 
		 public List<ComplaintData> getComplaintsForAdmin(){
			 
			 List<ComplaintData> list = new ArrayList<>();
			    try (Connection conn = DBConnection.getConnection()) {
			        String sql = "SELECT * FROM complaint WHERE STATUS  != 'Resolved'";
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ResultSet rs = ps.executeQuery();
			        while (rs.next()) {
			        	ComplaintData complaint = new ComplaintData();
			        	complaint.setComplaintId(rs.getInt("COMPLAINTID"));
			        	complaint.setConsumerNo(rs.getLong("CONSUMERNO"));
			        	complaint.setName(rs.getString("NAME"));
			        	complaint.setMobile(rs.getString("MOBILE"));
			        	complaint.setCategoryType(rs.getString("CATEGORYTYPE"));
			        	complaint.setComplaintType(rs.getString("COMPLAINTTYPE"));
			        	complaint.setLandmark(rs.getString("LANDMARK"));
			        	complaint.setAddress(rs.getString("ADDRESS"));
			        	complaint.setDescription(rs.getString("DESCRIPTION"));
			        	complaint.setStatus(rs.getString("STATUS"));
			            list.add(complaint);
			        }
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			    return list;
		 }
		 
		 public List<ComplaintData> getComplaints(long consumerNo) {

			    List<ComplaintData> list = new ArrayList<>();
			    try (Connection conn = DBConnection.getConnection()) {
			        String sql = "SELECT * FROM complaint WHERE CONSUMERNO = ? ";
			        PreparedStatement ps = conn.prepareStatement(sql);
			        ps.setLong(1, consumerNo);
			        ResultSet rs = ps.executeQuery();
			        while (rs.next()) {
			        	ComplaintData complaint = new ComplaintData();
			        	complaint.setComplaintId(rs.getInt("COMPLAINTID"));
			        	complaint.setConsumerNo(rs.getLong("CONSUMERNO"));
			        	complaint.setName(rs.getString("NAME"));
			        	complaint.setMobile(rs.getString("MOBILE"));
			        	complaint.setCategoryType(rs.getString("CATEGORYTYPE"));
			        	complaint.setComplaintType(rs.getString("COMPLAINTTYPE"));
			        	complaint.setLandmark(rs.getString("LANDMARK"));
			        	complaint.setAddress(rs.getString("ADDRESS"));
			        	complaint.setDescription(rs.getString("DESCRIPTION"));
			        	complaint.setStatus(rs.getString("STATUS"));
			            list.add(complaint);
			        }
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			    return list;
		 }

	public boolean uniqueComplaintId(int complaintId) throws SQLException, ClassNotFoundException {
        boolean exists = false;
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String query = "SELECT * FROM COMPLAINT WHERE COMPLAINTID = " + complaintId;
            rs = stmt.executeQuery(query);

            if (rs.next()) {
                exists = true; 
            }
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        }

        return exists;
    }

    public boolean registercomplaint(ComplaintData data) throws ClassNotFoundException, SQLException {
        boolean success = false;
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();
            String sql = "INSERT INTO COMPLAINT VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setInt(1, data.getComplaintId());
            ps.setLong(2, data.getConsumerNo());
            ps.setString(3, data.getName());
            ps.setString(4, data.getMobile());
            ps.setString(5, data.getCategoryType());
            ps.setString(6, data.getComplaintType());
            ps.setString(7, data.getLandmark());
            ps.setString(8, data.getAddress());
            ps.setString(9, data.getDescription());
            ps.setString(10, data.getStatus());

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

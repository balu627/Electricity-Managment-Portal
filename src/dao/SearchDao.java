package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ComplaintData;
import util.DBConnection;

public class SearchDao
{
	 public ComplaintData getComplaintById(int id) throws ClassNotFoundException {
	        
	        try 
	        {
	        	Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement("SELECT * FROM complaint WHERE rdcid = ?");
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                ComplaintData complaint = new ComplaintData();
	                return complaint;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}

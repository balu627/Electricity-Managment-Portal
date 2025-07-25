package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.ComplaintRegistration;
import util.DBConnection;

public class SearchDao
{
	 public ComplaintRegistration getComplaintById(int id) throws ClassNotFoundException {
	        
	        try 
	        {
	        	Connection conn = DBConnection.getConnection();
	             PreparedStatement ps = conn.prepareStatement("SELECT * FROM complaint WHERE rdcid = ?");
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                ComplaintRegistration complaint = new ComplaintRegistration(rs.getString("Type"), rs.getString("Category"), rs.getString("Contactperson"),
	                		rs.getString("Landmark"), rs.getLong("consumernumber"), rs.getString("Problem"),
	                		rs.getLong("Mobile"), rs.getString("Address"), rs.getInt("rdcid"), rs.getString("status"));
	                return complaint;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
}

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBConnection;

public class ChangeUserStatusDoa {
	
	public static void updatestatus(String userId)
	{
		
	    try {
	        Connection con = DBConnection.getConnection();
	        
	        
	        String sql = "UPDATE CustomerData SET status = 'Active' WHERE userId = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, userId);

	        int rowsUpdated = ps.executeUpdate();
	        
	        if(rowsUpdated>0)
	        {
	        	System.out.println("restore Done");
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}

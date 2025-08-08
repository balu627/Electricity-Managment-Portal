package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;
//import util.DBUserTableCreator;

public class LoginDao {
	
	public static ResultSet getSuccessCredentials(String userId, String userType) {
	    ResultSet rs = null;
	    String tableName = userType.equals("admin") ? "AdminCred" : "CustomerData";
	    try {
	        Connection con = DBConnection.getConnection();
	        String sql = "SELECT * FROM " + tableName + " WHERE userId = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, userId);
	        rs = ps.executeQuery();
	        return rs;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null;
	}

	
	
	
	
	public static String checklogin(String userType,String userId,String password)
	{
		String tableName = userType.equals("admin") ? "AdminCred" : "CustomerData";
		
        try {
            Connection con = DBConnection.getConnection();
            
            String sql = "SELECT * FROM "+  tableName +" WHERE userId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	if(!tableName.equals("AdminCred"))
            	{
            		String status = rs.getString("status");
                	if(status.equals("Inactive"))
                	{
                		return status;
                	}
            	}
                String OrginalPass = rs.getString("password");
                if(!OrginalPass.equals(password))
                {
                	return "Incorrect Password";
                }
            }
            else
            {
            	return "User Not Found";
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Match";
	}
}

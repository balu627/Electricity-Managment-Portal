package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import bean.CustomerData;
import util.DBConnection;

public class ProfileDao {
	
	public static boolean softDeleteCustomer(long consumerNo) {
	    boolean status = false;
	    try {
	        Connection con = DBConnection.getConnection();
	        
	        
	        String sql = "UPDATE CustomerData SET status = 'inactive' WHERE consumerId = ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setLong(1, consumerNo);

	        int rowsUpdated = ps.executeUpdate();

	        if (rowsUpdated > 0) {
	            status = true;
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}
	

	
	public static boolean updateCustomerDetails(CustomerData customer) {
	    boolean isUpdated = false;
	    try {

	        Connection con = DBConnection.getConnection();


	        String sql = "UPDATE CustomerData SET "
	                   + "title = ?, "
	                   + "name = ?, "
	                   + "email = ?, "
	                   + "countryCode = ?, "
	                   + "mobile = ?, "
	                   + "userId = ?, "
	                   + "password = ? "
	                   + "WHERE consumerId = ?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, customer.getTitle());
	        ps.setString(2, customer.getCustName());
	        ps.setString(3, customer.getEmail());
	        ps.setString(4, customer.getCountryCode());
	        ps.setLong(5, customer.getMobile());
	        ps.setString(6, customer.getUserId());
	        ps.setString(7, customer.getPassword());
	        ps.setLong(8, customer.getConsumerId());

	        int rowsAffected = ps.executeUpdate();

	        if (rowsAffected > 0) {
	            isUpdated = true;
	        }

	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isUpdated;
	}

	
	
	public static CustomerData getCustomerByConsumerNo(long consumerNo) {
        CustomerData customer = null;
        try {
        	
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM CustomerData WHERE consumerId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, consumerNo);

            ResultSet rs = ps.executeQuery();
            
            
            if (rs.next()) {
                customer = new CustomerData();
                customer.setConsumerId(rs.getLong("consumerId"));
                customer.setTitle(rs.getString("title"));
                customer.setCustName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setCountryCode(rs.getString("countryCode"));
                customer.setMobile(rs.getLong("mobile"));
                customer.setUserId(rs.getString("userId"));
                customer.setPassword(rs.getString("password"));
            }
            
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }


}
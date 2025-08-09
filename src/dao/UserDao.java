package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.CustomerData;
//import util.DBBillTableCreator;
import util.DBConnection;

public class UserDao {

	

    public static String checkConstraints(CustomerData customer) {
        String check = "ok";
        String tempres = checkConsumerIdandBillInBills(customer);
        
        if (checkBillNo(customer) > 0) {
            check = "BillNo Already";
        } else if (checkUserId(customer) > 0) {
            check = "UserId Already";
        }
        else if(tempres!="ok")
        {
        	check = tempres;
        }
        
        return check;
    }
    
    public static String checkConsumerIdandBillInBills(CustomerData customer) {
        String message = "";
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT billNo FROM Bill WHERE consumerNo = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, customer.getConsumerId());
            ResultSet rs = ps.executeQuery();

            boolean consumerExists = false;
            boolean billExists = false;

            while (rs.next()) {
                consumerExists = true;
                int billNo = rs.getInt("billNo");
                if (billNo == customer.getBillNo()) {
                    billExists = true;
                    break;
                }
            }

            if (!consumerExists) {
                message = "Consumer Not";  
            } else if (!billExists) {
                message = "Bill Not";     
            } else {
                message = "ok";     
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            message = "error";
        }
        return message;
    }

    

    public static int checkUserId(CustomerData customer) {
        int status = 0;
        try {
//        	DBUserTableCreator.createUserTable();
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM CustomerData WHERE userId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customer.getUserId());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int checkEmailId(CustomerData customer) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM CustomerData WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customer.getEmail());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int checkBillNo(CustomerData customer) {
        int status = 0;
        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM CustomerData WHERE billNo = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, customer.getBillNo());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int checkConsumerId(CustomerData customer) {
        int status = 0;
        try {
//            DBUserTableCreator.createUserTable();;
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM CustomerData WHERE consumerId = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, customer.getConsumerId());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int RegaddUser(CustomerData customer) {
        int status = 0;
        try (Connection con = DBConnection.getConnection()) {

            String sql = "UPDATE CustomerData "
                       + "SET billNo = ?, userId = ?, password = ?, status = 'Active' "
                       + "WHERE consumerId = ?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, customer.getBillNo());
                ps.setString(2, customer.getUserId());
                ps.setString(3, customer.getPassword());
                ps.setLong(4, customer.getConsumerId());

                status = ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    
    public int addNewUser(CustomerData customer)
    {
    	int status = 0;
    	try {
          Connection con = DBConnection.getConnection();

          String sql = "INSERT INTO NewUser (title, name,email, countryCode, mobile, address)"
                  + "VALUES (?, ?, ?, ?, ?, ?)";
	         PreparedStatement ps = con.prepareStatement(sql);
	         ps.setString(1, customer.getTitle());
	         ps.setString(2, customer.getCustName());
	         ps.setString(3, customer.getEmail());
	         ps.setString(4, customer.getCountryCode());
	         ps.setLong(5,customer.getMobile());
	         ps.setString(6,customer.getAddress());
	         
          status = ps.executeUpdate();
          con.close();

      } catch (Exception e) {
          e.printStackTrace();
      }
    	return status;
    }
    public int checkNewUserEmail(CustomerData customer) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM NewUser WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customer.getEmail());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public List<CustomerData> getNewUserData()
    {
    	List<CustomerData> users = new ArrayList<CustomerData>();
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM NewUser WHERE ConsumerNo IS NULL";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CustomerData customer = new CustomerData();
                customer.setNewcustId(rs.getInt("Id"));
                customer.setTitle(rs.getString("title"));
                customer.setCustName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setCountryCode(rs.getString("countryCode"));
                customer.setMobile(rs.getLong("mobile"));
                customer.setAddress(rs.getString("address"));
                users.add(customer);
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public long getConsumerNewId(CustomerData data)
    {
    	long newId = -1; 

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO CustomerData (title, name, email, countryCode, mobile, address, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, 'Inactive')";

            // Ask Derby to return the generated keys (consumerId)
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, data.getTitle());
            ps.setString(2, data.getCustName());
            ps.setString(3, data.getEmail());
            ps.setString(4, data.getCountryCode());
            ps.setLong(5, data.getMobile());
            ps.setString(6, data.getAddress());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) {
                        newId = keys.getLong(1); // First column in keys is consumerId
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return newId;
    }
    
    public CustomerData getNewUserDataByID(int Id)
    {
    	CustomerData customer = new CustomerData();
        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM NewUser WHERE Id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                customer.setNewcustId(rs.getInt("Id"));
                customer.setTitle(rs.getString("title"));
                customer.setCustName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setCountryCode(rs.getString("countryCode"));
                customer.setMobile(rs.getLong("mobile"));
                customer.setAddress(rs.getString("address"));
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return customer;
    }
    
    public int updateConsumerNoInNewUser(Long consumerNo, int id) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE NewUser SET ConsumerNo = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, consumerNo);
            ps.setInt(2, id);

            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    
    public String checkAndGetEmail(Long consumerId) {
        String email = null;
        String sql = "SELECT * FROM CustomerData WHERE consumerId = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, consumerId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String userId = rs.getString("userId");
                    String password = rs.getString("password");

                    if (userId != null && password != null) {
                        email = "Created";  // account already created
                    } else {
                        email = rs.getString("email");  // return email if account not created yet
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }
    
    public CustomerData getUserdetailsUsingConsumerId(long consumerId) {
        CustomerData user = null;
        String sql = "SELECT * FROM CustomerData WHERE consumerId = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, consumerId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                user = new CustomerData(); 
                user.setConsumerId(rs.getLong("consumerId"));
                user.setBillNo(rs.getInt("billNo"));
                user.setTitle(rs.getString("title"));
                user.setCustName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setCountryCode(rs.getString("countryCode"));
                user.setMobile(rs.getLong("mobile"));
                user.setAddress(rs.getString("address"));
                user.setUserId(rs.getString("userId"));
                user.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }




}

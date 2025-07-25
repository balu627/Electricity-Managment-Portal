package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import bean.CustomerData;
import util.DBBillTableCreator;
import util.DBConnection;
import util.DBUserTableCreator;

public class UserDao {

	

    public static String checkConstraints(CustomerData customer) {
        String check = "ok";
        String tempres = checkConsumerIdandBillInBills(customer);
        if (checkConsumerId(customer) > 0) {
            check = "CustomerId Already";
        } else if (checkBillNo(customer) > 0) {
            check = "BillNo Already";
        } else if (checkEmailId(customer) > 0) {
            check = "EmailId Already";
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
        	DBBillTableCreator.createBillTable();
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
                System.out.println(billNo);
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
        	DBUserTableCreator.createUserTable();
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
        	DBUserTableCreator.createUserTable();
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
            DBUserTableCreator.createUserTable();
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
            DBUserTableCreator.createUserTable();;
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

    public static int addUser(CustomerData customer) {
        int status = 0;
        try {
            DBUserTableCreator.createUserTable();
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO CustomerData (consumerId, billNo, title, name, age, email, countryCode, mobile, address, userId, password, status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, 'Active')";
	         PreparedStatement ps = con.prepareStatement(sql);
	         ps.setLong(1, customer.getConsumerId());
	         ps.setInt(2, customer.getBillNo());
	         ps.setString(3, customer.getTitle());
	         ps.setString(4, customer.getCustName());
	         ps.setInt(5, customer.getAge());
	         ps.setString(6, customer.getEmail());
	         ps.setString(7, customer.getCountryCode());
	         ps.setLong(8, customer.getMobile());
	         ps.setString(9,customer.getAddress());
	         ps.setString(10, customer.getUserId());
	         ps.setString(11, customer.getPassword());


            status = ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}

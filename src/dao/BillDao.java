package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import bean.Bill;
import util.DBConnection;
import util.DBBillTableCreator;

public class BillDao {
    public static int addBill(Bill bill) {
        int status = 0;
        try {
            DBBillTableCreator.createBillTable();
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO Bill (consumerNo, amount, month, modeOfPayment, paymentTimeDate, transactionId, status) VALUES (?, ?, ?, NULL, NULL, NULL, 'unpaid')";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1, bill.getConsumerNo());
            ps.setInt(2, bill.getAmount());
            String monthInput = bill.getMonth() + "-01";
            java.sql.Date sqlDate = java.sql.Date.valueOf(monthInput);
            ps.setDate(3,sqlDate);
            status = ps.executeUpdate();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static void dropBillTable() {
        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DROP TABLE Bill";
            stmt.executeUpdate(sql);
            System.out.println("Bill table dropped successfully!");
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Table might not exist yet!");
            e.printStackTrace();
        }
    }

 
    
    public static ResultSet getUnpaidBills(long user) {
        ResultSet rs = null;
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM Bill WHERE status='unpaid' AND consumerNo = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setLong(1,user);
            rs = ps.executeQuery();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static ResultSet getBillsByNo(int billNo,Connection con) {
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM Bill WHERE billNo = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1,billNo);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static boolean checkTransactionId(int tempId)
    {
    	try{
    		Connection con = DBConnection.getConnection();
        	String sql = "select transactionId from Bill where transactionId = ?";
        	PreparedStatement ps = con.prepareStatement(sql);
        	String temp = Integer.toString(tempId);
            ps.setString(1,temp);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
            	return true;
            }
            return false;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	
    	return false;
    }
    
    public static void updateTransactionId(int billNo, String timestamp,String modeOfTransaction,int temptransactionId)
    {
    	try{
    		Connection con = DBConnection.getConnection();
        	String sql = "update Bill SET modeOfPayment = ? , paymentTimeDate = ? , transactionId = ? , status = 'paid' WHERE billNo = ? AND status='unpaid'";
        	
        	PreparedStatement ps = con.prepareStatement(sql);
        	
            ps.setString(1,modeOfTransaction);
            ps.setString(2, timestamp);
            ps.setInt(3,temptransactionId);
            ps.setInt(4, billNo);
            ps.executeUpdate();
            
            con.close();
            return ;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
    
    public static ResultSet getPastFiveMonths(long user)
    {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.getDefault());
        String dateOnly = currentDateTime.format(dateFormatter);
        
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss", Locale.getDefault());
        String timeOnly = currentDateTime.format(timeFormatter);
        
        String timedateformat = dateOnly;
        String smonth = timedateformat.substring(0, 7);
        
        long cid = user;
        ResultSet rs = null;
        try
        {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM Bill WHERE consumerNo = ? AND month <= ? AND  status = 'paid'  ORDER BY month  DESC";
            PreparedStatement ps = con.prepareStatement(sql);      
            ps.setLong(1, cid);
            String monthInput = smonth + "-01";
            java.sql.Date sqlDate = java.sql.Date.valueOf(monthInput);
            ps.setDate(2,sqlDate);
            rs = ps.executeQuery();
            
       

            return rs;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static ResultSet getSpecifcPeriod(String fromMonth,String toMonth,long user)
    {
        ResultSet rs = null;
    	try
    	{
    		Connection con = DBConnection.getConnection();
    		String sql = "SELECT * FROM Bill WHERE consumerNo = ? AND month between ? AND ? AND status = 'paid'  ORDER BY month";
        	
        	PreparedStatement ps = con.prepareStatement(sql);   
        	ps.setLong(1, user);
        	String frommonthInput = fromMonth + "-01";
            java.sql.Date fromsqlDate = java.sql.Date.valueOf(frommonthInput);
            ps.setDate(2,fromsqlDate);
            String tomonthInput = toMonth + "-01";
            java.sql.Date tosqlDate = java.sql.Date.valueOf(tomonthInput);
            ps.setDate(3,tosqlDate);
            rs = ps.executeQuery();
            return rs;
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return rs;
    }

}

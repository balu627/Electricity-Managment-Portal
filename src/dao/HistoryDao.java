package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.ComplaintRegistration;
//import util.DBCompliantDataTableCreator;
import util.DBConnection;

public class HistoryDao {
	 public List<ComplaintRegistration> getComplaintsByStatus(String status) {
//		 	try {
////				DBCompliantDataTableCreator.createComplaintDataTable();
//			} catch (ClassNotFoundException e1) {
//				// TODO Auto-generated catch block
//				System.out.println("table exits");
//			}
		    List<ComplaintRegistration> list = new ArrayList<>();
		    try (Connection conn = DBConnection.getConnection()) {
		        String sql = "SELECT * FROM complaint WHERE status=?";
		        PreparedStatement ps = conn.prepareStatement(sql);
		        ps.setString(1, status);
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		        	ComplaintRegistration complaint = new ComplaintRegistration(rs.getString("Type"), rs.getString("Category"), rs.getString("Contactperson"),
	                		rs.getString("Landmark"), rs.getLong("consumernumber"), rs.getString("Problem"),
	                		rs.getLong("Mobile"), rs.getString("Address"), rs.getInt("rdcid"), rs.getString("status"));
		            list.add(complaint);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return list;
	 }

}

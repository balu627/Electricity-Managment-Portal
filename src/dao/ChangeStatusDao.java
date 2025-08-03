package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import bean.ComplaintData;
import util.DBConnection;

public class ChangeStatusDao {
	
	public boolean changestatus(int rdcid) throws ClassNotFoundException, SQLException {
	Connection con = DBConnection.getConnection();
	boolean success = false;
	String sql = "update complaint set status ='solved' where rdcid = ? ";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, rdcid);
	int rows = ps.executeUpdate();
    success = rows > 0;
    return success;
	}
	
}

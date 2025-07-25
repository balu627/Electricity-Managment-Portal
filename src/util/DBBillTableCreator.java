package util;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DBBillTableCreator {

    public static void createBillTable() {
        Connection con = null;
        Statement stmt = null;
        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "CREATE TABLE Bill ("
                    + "billNo INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 10001, INCREMENT BY 1),"
                    + "consumerNo BIGINT,"
                    + "amount INT,"
                    + "month date,"
                    + "modeOfPayment VARCHAR(20),"
                    + "paymentTimeDate VARCHAR(255),"
                    + "transactionId VARCHAR(20),"
                    + "status VARCHAR(10)"
                    + ")";
            stmt.executeUpdate(sql);
            System.out.println("Bill table created successfully!");
        } catch (SQLException e) {
                System.out.println("TABLE EXISTS");
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Close issue");
            }
        }
    }
}

package dao;

import util.DBBillTableCreator;
import util.DBCompliantDataTableCreator;
import util.DBNewUserTableCreator;
import util.DBUserTableCreator;

public class CreateTables {
	public static void Create()
	{
		try{
			DBBillTableCreator.createBillTable();
			DBCompliantDataTableCreator.createComplaintDataTable();
			DBUserTableCreator.createAdminTable();
			DBUserTableCreator.createUserTable();;
			DBNewUserTableCreator.createUserTable();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}

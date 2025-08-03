package dao;

import util.DBBillTableCreator;
import util.DBCompliantDataTableCreator;
import util.DBUserTableCreator;

public class CreateTables {
	public static void Create()
	{
		try{
			DBBillTableCreator.createBillTable();
			DBCompliantDataTableCreator.createComplaintDataTable();
			DBUserTableCreator.createAdminTable();
			DBUserTableCreator.createUserTable();;
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}

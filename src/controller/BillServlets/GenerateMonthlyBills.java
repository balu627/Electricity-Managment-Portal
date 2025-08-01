package controller.BillServlets;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Bill;
import dao.BillDao;

public class GenerateMonthlyBills {
	
	public void GenerateBills()
	{
		List<Long> consumerNos;
		try {
			consumerNos = getConsumersData();
			for(int i=0;i<consumerNos.size();i++)
			{
				Bill bill = new Bill();
			    RandomUnitGenerator rg = new RandomUnitGenerator();
			    int units = rg.GenerateUnits();
			    bill.setConsumerNo(consumerNos.get(i));
			    bill.setAmount(rg.calculateAmount(units));
			    bill.setMonth(rg.GetPrevMonth());
			    bill.setUnits(units);
			    int status = BillDao.addBill(bill);
			}
			System.out.println("All Bills Added");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	
	public List<Long> getConsumersData() throws SQLException
	{
		List<Long> consumerNos = new ArrayList<Long>();
		ResultSet rs = BillDao.getConsumers();
		while(rs.next())
		{
			consumerNos.add(rs.getLong("consumerId"));
		}
		return consumerNos;
	}
}

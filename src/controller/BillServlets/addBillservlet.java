package controller.BillServlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import bean.Bill;
import dao.BillDao;

public class addBillservlet  {

	public int addbill(long consumerNo){
		
		    Bill bill = new Bill();
		    RandomUnitGenerator rg = new RandomUnitGenerator();
		    int units = rg.GenerateUnits();
		    bill.setConsumerNo(consumerNo);
		    bill.setAmount(rg.calculateAmount(units));
		    bill.setMonth(rg.GetPrevMonth());
		    bill.setUnits(units);
		    int status = BillDao.addBill(bill);
		    
		    return status;
	}

}

package controller.BillServlets;

import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Random;

public class RandomUnitGenerator {
	public int GenerateUnits()
	{
		int units = new Random().nextInt(1991) + 10;
		return units;
	}
	
	public int calculateAmount(int units) {
	    int amount = 0;
	    int[] slabLimits = {50, 50, 100, 100, 100, 400};
	    double[] rates = {1.95, 3.10, 4.80, 7.70, 9.00, 9.50};
	    
	    for (int i = 0; i < slabLimits.length && units > 0; i++) {
	        int slabUnits = Math.min(units, slabLimits[i]);
	        amount += slabUnits * rates[i];
	        units -= slabUnits;
	    }

	    // For units above 800
	    if (units > 0) {
	        amount += units * 10.00;
	    }

	    return (int) Math.round(amount);
	}


	
	public String GetPrevMonth()
	{
		LocalDate today = LocalDate.now();
		YearMonth prevMonth = YearMonth.now().minusMonths(1);
		String yearMonth = prevMonth.toString();
		return yearMonth;
	}
	
}

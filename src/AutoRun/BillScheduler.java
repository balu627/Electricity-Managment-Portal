package AutoRun;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import controller.BillServlets.GenerateMonthlyBills;
import controller.BillServlets.RandomUnitGenerator;

import java.util.Timer;
import java.util.TimerTask;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Random;

@WebListener
public class BillScheduler implements ServletContextListener {
    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        timer = new Timer();
        timer.scheduleAtFixedRate(new GenerateBillTask(), 0, 86400000); 
        System.out.println("Bill generation task scheduled.");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        timer.cancel(); 
    }

    static class GenerateBillTask extends TimerTask {
        @Override
        public void run() {
            LocalDate today = LocalDate.now();
            if (today.getDayOfMonth() == 1) {
                YearMonth prevMonth = YearMonth.now().minusMonths(1);
                GenerateMonthlyBills gmb = new GenerateMonthlyBills();
                gmb.GenerateBills();
            }
        }
    }
}


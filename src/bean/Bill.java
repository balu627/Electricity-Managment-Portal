package bean;

public class Bill {
    private int billNo;
    private long consumerNo;
    private int amount;
    private String month;
    private String modeOfPayment;
    private String paymentTimeDate;
    private int transactionId;
    private String status;
    private int units;

    public int getBillNo() {
        return billNo;
    }
    public void setBillNo(int billNo) {
        this.billNo = billNo;
    }

    public long getConsumerNo() {
        return consumerNo;
    }
    public void setConsumerNo(long consumerNo) {
        this.consumerNo = consumerNo;
    }

    public int getAmount() {
        return amount;
    }
    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getMonth() {
        return month;
    }
    public void setMonth(String month) {
        this.month = month;
    }

    public String getModeOfPayment() {
        return modeOfPayment;
    }
    public void setModeOfPayment(String modeOfPayment) {
        this.modeOfPayment = modeOfPayment;
    }

    public String getPaymentTimeDate() {
        return paymentTimeDate;
    }
    public void setPaymentTimeDate(String paymentTimeDate) {
        this.paymentTimeDate = paymentTimeDate;
    }

    public int getTransactionId() {
        return transactionId;
    }
    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getUnits()
    {
    	return units;
    }
    
    public void setUnits(int units)
    {
    	this.units = units;
    }
}

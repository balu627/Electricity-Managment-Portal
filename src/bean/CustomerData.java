package bean;

public class CustomerData {

    private long consumerId;
    private int billNo;
    private String title;
    private String custName;
    private int age;
    private String email;
    private String countryCode;
    private long mobile;
    private String address;
    private String userId;
    private String password;
    private String status;
    private int NewcustId;
    
    public int getNewcustId()
    {
    	return NewcustId;
    }
    
    public void setNewcustId(int NewcustId)
    {
    	this.NewcustId = NewcustId;
    }

    public long getConsumerId() {
        return consumerId;
    }
    

    public void setConsumerId(long consumerId) {
        this.consumerId = consumerId;
    }

    public int getBillNo() {
        return billNo;
    }

    public void setBillNo(int billNo) {
        this.billNo = billNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getCountryCode()
    {
    	return countryCode;
    }
    
    public void setCountryCode(String countryCode)
    {
    	this.countryCode = countryCode;
    }

    public long getMobile() {
        return mobile;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }
    
    public String getAddress()
    {
    	return address;
    }
    
    public void setAddress(String address){
    	this.address = address;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

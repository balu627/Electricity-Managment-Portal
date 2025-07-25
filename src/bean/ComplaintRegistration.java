package bean;

public class ComplaintRegistration {
	
	private String type;
	private String category;
	private String contactperson;
	private String Landmark;
	private long consumernumber;
	private String problemdescription;
	private long mobile;
	private String Address;
	private int complaintid;
	private String status;
	
	public ComplaintRegistration(String type, String category, String contactperson, String landmark, long consumernumber,
			String problemdescription, long mobile, String address, int complaintid, String status) {
		
		this.type = type;
		this.category = category;
		this.contactperson = contactperson;
		this.Landmark = landmark;
		this.consumernumber = consumernumber;
		this.problemdescription = problemdescription;
		this.mobile = mobile;
		this.Address = address;
		this.complaintid = complaintid;
		this.status = status;
	}
	

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContactperson() {
		return contactperson;
	}
	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}
	public String getLandmark() {
		return Landmark;
	}
	public void setLandmark(String landmark) {
		Landmark = landmark;
	}
	public long getConsumernumber() {
		return consumernumber;
	}
	public void setConsumernumber(int consumernumber) {
		this.consumernumber = consumernumber;
	}
	public String getProblemdescription() {
		return problemdescription;
	}
	public void setProblemdescription(String problemdescription) {
		this.problemdescription = problemdescription;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public int getComplaintid() {
		return complaintid;
	}
	public void setComplaintid(int complaintid) {
		this.complaintid = complaintid;
	}
	

}
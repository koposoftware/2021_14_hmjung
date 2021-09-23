package gc.co.kr.advertise.vo;

public class AdvertiseMemberRequestVO {
	private int no;
	private String id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String advertiseSymbol;
	private String companyRegNumber;
	private String filePath;
	private String budget;
	private String note;
	private String status;
	private String clientAlarm;
	private String time;
	
	
	public AdvertiseMemberRequestVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAdvertiseSymbol() {
		return advertiseSymbol;
	}
	public void setAdvertiseSymbol(String advertiseSymbol) {
		this.advertiseSymbol = advertiseSymbol;
	}
	public String getCompanyRegNumber() {
		return companyRegNumber;
	}
	public void setCompanyRegNumber(String companyRegNumber) {
		this.companyRegNumber = companyRegNumber;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getBudget() {
		return budget;
	}
	public void setBudget(String budget) {
		this.budget = budget;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getClientAlarm() {
		return clientAlarm;
	}
	public void setClientAlarm(String clientAlarm) {
		this.clientAlarm = clientAlarm;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "AdvertiseMemberRequestVO [no=" + no + ", id=" + id + ", firstName=" + firstName + ", lastName="
				+ lastName + ", email=" + email + ", phone=" + phone + ", advertiseSymbol=" + advertiseSymbol
				+ ", companyRegNumber=" + companyRegNumber + ", filePath=" + filePath + ", budget=" + budget + ", note="
				+ note + ", status=" + status + ", clientAlarm=" + clientAlarm + ", time=" + time + "]";
	}
	
	
		
}

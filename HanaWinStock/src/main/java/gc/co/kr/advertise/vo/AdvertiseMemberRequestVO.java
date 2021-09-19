package gc.co.kr.advertise.vo;

public class AdvertiseMemberRequestVO {
	private int no;
	private String id;
	private String firstName;
	private String lastName;
	private String email;
	private String advertiseSymbol;
	private String companyRegNumber;
	private String filePath;
	private String varchar2;
	private String status;
	private String clientAlarm;
	
	
	
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
	public String getVarchar2() {
		return varchar2;
	}
	public void setVarchar2(String varchar2) {
		this.varchar2 = varchar2;
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
	@Override
	public String toString() {
		return "AdvertiseMemberRequest [no=" + no + ", id=" + id + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", email=" + email + ", advertiseSymbol=" + advertiseSymbol + ", companyRegNumber=" + companyRegNumber
				+ ", filePath=" + filePath + ", varchar2=" + varchar2 + ", status=" + status + ", clientAlarm="
				+ clientAlarm + "]";
	}
		
}

package gc.co.kr.advertise.vo;



public class AdRequestVO {
	
	private int no;
	private String filePath;
	private String startDate;
	private String endDate;
	private float frequency;
	private String advertiseSymbol;
	private String note;
	private String time;
	private String id;
	private String status;
		
	public AdRequestVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public float getFrequency() {
		return frequency;
	}

	public void setFrequency(float frequency) {
		this.frequency = frequency;
	}

	public String getAdvertiseSymbol() {
		return advertiseSymbol;
	}

	public void setAdvertiseSymbol(String advertiseSymbol) {
		this.advertiseSymbol = advertiseSymbol;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "AdRequestVO [no=" + no + ", filePath=" + filePath + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", frequency=" + frequency + ", advertiseSymbol=" + advertiseSymbol + ", note=" + note + ", time="
				+ time + ", id=" + id + ", status=" + status + "]";
	}

	


}

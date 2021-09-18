package gc.co.kr.account.vo;

public class AccountStockLog {
	
	private int no;
	private String gcaNumber;
	private String symbol;
	private String action;
	private double preBalance;
	private double postBalance;
	private int counts;
	private float momentPrice;
	private String time;
	public AccountStockLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getGcaNumber() {
		return gcaNumber;
	}
	public void setGcaNumber(String gcaNumber) {
		this.gcaNumber = gcaNumber;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public double getPreBalance() {
		return preBalance;
	}
	public void setPreBalance(double preBalance) {
		this.preBalance = preBalance;
	}
	public double getPostBalance() {
		return postBalance;
	}
	public void setPostBalance(double postBalance) {
		this.postBalance = postBalance;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public float getMomentPrice() {
		return momentPrice;
	}
	public void setMomentPrice(float momentPrice) {
		this.momentPrice = momentPrice;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}

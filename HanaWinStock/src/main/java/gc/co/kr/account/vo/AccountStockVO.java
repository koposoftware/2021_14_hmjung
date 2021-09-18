package gc.co.kr.account.vo;

public class AccountStockVO {
	private int no;
	private String gcaNumber;
	private String symbol;
	private int totalCounts;
	private double spentTotal;
	private double earnedTotal;
	
	
	public AccountStockVO() {
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
	public int getTotalCounts() {
		return totalCounts;
	}
	public void setTotalCounts(int totalCounts) {
		this.totalCounts = totalCounts;
	}

	public double getSpentTotal() {
		return spentTotal;
	}
	public void setSpentTotal(double spentTotal) {
		this.spentTotal = spentTotal;
	}
	public double getEarnedTotal() {
		return earnedTotal;
	}
	public void setEarnedTotal(double earnedTotal) {
		this.earnedTotal = earnedTotal;
	}
	@Override
	public String toString() {
		return "AccountStockVO [no=" + no + ", gcaNumber=" + gcaNumber + ", symbol=" + symbol + ", totalCounts="
				+ totalCounts + ", spentTotal=" + spentTotal + ", earnedTotal=" + earnedTotal + "]";
	}

	
	
}

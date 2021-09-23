package gc.co.kr.realtimestock.vo;

public class DailyStockVO {
	
	private int no;
	private long unixTime;
	private String symbol;
	private long volume;
	private double low;
	private double close;
	private double high;
	private double open;
	public DailyStockVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public long getUnixTime() {
		return unixTime;
	}
	public void setUnixTime(long unixTime) {
		this.unixTime = unixTime;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public long getVolume() {
		return volume;
	}
	public void setVolume(long volume) {
		this.volume = volume;
	}
	public double getLow() {
		return low;
	}
	public void setLow(double low) {
		this.low = low;
	}
	public double getClose() {
		return close;
	}
	public void setClose(double close) {
		this.close = close;
	}
	public double getHigh() {
		return high;
	}
	public void setHigh(double high) {
		this.high = high;
	}
	public double getOpen() {
		return open;
	}
	public void setOpen(double open) {
		this.open = open;
	}
	@Override
	public String toString() {
		return "DailyStockVO [no=" + no + ", unixTime=" + unixTime + ", symbol=" + symbol + ", volume=" + volume
				+ ", low=" + low + ", close=" + close + ", high=" + high + ", open=" + open + "]";
	}
	
	
	

}

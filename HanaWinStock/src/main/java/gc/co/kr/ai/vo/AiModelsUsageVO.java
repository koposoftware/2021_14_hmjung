package gc.co.kr.ai.vo;

public class AiModelsUsageVO {
	
	private int no;
	private String time;
	private String symbol;
	private int predictingDays;
		
	public AiModelsUsageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public String toString() {
		return "AiModelsUsageVO [no=" + no + ", time=" + time + ", symbol=" + symbol + ", predictingDays="
				+ predictingDays + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public int getPredictingDays() {
		return predictingDays;
	}
	public void setPredictingDays(int predictingDays) {
		this.predictingDays = predictingDays;
	}
	
	

}

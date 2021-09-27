package gc.co.kr.ai.vo;

public class AiModelsVO {
	private int no;
	private String time;
	private long startUnixTime;
	private long endUnixTime;
	private String symbol;
	private String flag;
	private String modelName;
	private double lastLoss;
	private double lastValLoss;
	private String trainRatio;
	private int lb;
	private int trainEpoch;
	private int layerNode;
	private String trainingOptimizer;
	private String trainingLossFunc;
		
	public AiModelsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AiModelsVO [no=" + no + ", time=" + time + ", startUnixTime=" + startUnixTime + ", endUnixTime="
				+ endUnixTime + ", symbol=" + symbol + ", flag=" + flag + ", modelName=" + modelName + ", lastLoss="
				+ lastLoss + ", lastValLoss=" + lastValLoss + ", trainRatio=" + trainRatio + ", lb=" + lb
				+ ", trainEpoch=" + trainEpoch + ", layerNode=" + layerNode + ", trainingOptimizer=" + trainingOptimizer
				+ ", trainingLossFunc=" + trainingLossFunc + "]";
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
	public long getStartUnixTime() {
		return startUnixTime;
	}
	public void setStartUnixTime(long startUnixTime) {
		this.startUnixTime = startUnixTime;
	}
	public long getEndUnixTime() {
		return endUnixTime;
	}
	public void setEndUnixTime(long endUnixTime) {
		this.endUnixTime = endUnixTime;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public double getLastLoss() {
		return lastLoss;
	}
	public void setLastLoss(double lastLoss) {
		this.lastLoss = lastLoss;
	}
	public double getLastValLoss() {
		return lastValLoss;
	}
	public void setLastValLoss(double lastValLoss) {
		this.lastValLoss = lastValLoss;
	}
	public String getTrainRatio() {
		return trainRatio;
	}
	public void setTrainRatio(String trainRatio) {
		this.trainRatio = trainRatio;
	}
	public int getLb() {
		return lb;
	}
	public void setLb(int lb) {
		this.lb = lb;
	}
	public int getTrainEpoch() {
		return trainEpoch;
	}
	public void setTrainEpoch(int trainEpoch) {
		this.trainEpoch = trainEpoch;
	}
	public int getLayerNode() {
		return layerNode;
	}
	public void setLayerNode(int layerNode) {
		this.layerNode = layerNode;
	}
	public String getTrainingOptimizer() {
		return trainingOptimizer;
	}
	public void setTrainingOptimizer(String trainingOptimizer) {
		this.trainingOptimizer = trainingOptimizer;
	}
	public String getTrainingLossFunc() {
		return trainingLossFunc;
	}
	public void setTrainingLossFunc(String trainingLossFunc) {
		this.trainingLossFunc = trainingLossFunc;
	}
	
	
	
}

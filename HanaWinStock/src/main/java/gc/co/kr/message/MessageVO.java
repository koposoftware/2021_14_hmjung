package gc.co.kr.message;

public class MessageVO {
	
	private int no;
	private String fromId;
	private String content;
	private String toId;
	private String time;
	private String checked;
	
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFromId() {
		return fromId;
	}

	public void setFromId(String fromId) {
		this.fromId = fromId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getToId() {
		return toId;
	}

	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", fromId=" + fromId + ", content=" + content + ", toId=" + toId + ", time="
				+ time + ", checked=" + checked + "]";
	}

}

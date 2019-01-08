package dtodao;

public class DealDTO {
	
	private int num;
	//거래번호
	private String pid;
	
	private String mid;
	
	private int quantity;
	
	private String dealDate;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDealDate() {
		return dealDate;
	}

	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}

	public DealDTO(int num, String pid, String mid, int quantity, String dealDate) {
		super();
		this.num = num;
		this.pid = pid;
		this.mid = mid;
		this.quantity = quantity;
		this.dealDate = dealDate;
	}
	
	public DealDTO() {
		// TODO Auto-generated constructor stub
	}
}

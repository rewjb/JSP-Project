package dtodao;

public class CartDTO {

	private String pid;
	// 제품 아이디
	private String mid;
	// 회원 아이디
	private int quantity;
	// 수량 기본값 1
	private String ddate;
	// 찜 및 장바구니 등록 날짜

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

	public String getDdate() {
		return ddate;
	}

	public void setDdate(String ddate) {
		this.ddate = ddate;
	}

	public CartDTO(String pid, String mid, int quantity, String ddate) {
		super();
		this.pid = pid;
		this.mid = mid;
		this.quantity = quantity;
		this.ddate = ddate;
	}
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}//기본 생성자 
	
	
	

}

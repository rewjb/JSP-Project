package dtodao;

public class SalesManagerDTO {
	
	
	private String imgAddr; 	// 이미지 경로를담을 변수
	private String brand;		// 브랜드 담을 변수
	private String modelName;	// 모델 넘버 담을 변수
	private int dealNum;		// 거래 번호 담을 변수
	private String mid;			// 회원 정보를 담을 변수
	private String pid;			// 회원 정보를 담을 변수
	private int quantity;	// 수량 정보를 담을 변수
	private int price;		// 가격 정보를 담을 변수
	private int deliverPrice;// 배달비 를 담을 변수
	private int saveMoney;	// 적립금을 담을 변수
	private String dealDate;	// 거래날짜를 담을 변수
	
	
	
	public String getImgAddr() {
		return imgAddr;
	}
	public void setImgAddr(String imgAddr) {
		this.imgAddr = imgAddr;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public int getDealNum() {
		return dealNum;
	}
	public void setDealNum(int dealNum) {
		this.dealNum = dealNum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDeliverPrice() {
		return deliverPrice;
	}
	public void setDeliverPrice(int deliverPrice) {
		this.deliverPrice = deliverPrice;
	}
	public int getSaveMoney() {
		return saveMoney;
	}
	public void setSaveMoney(int saveMoney) {
		this.saveMoney = saveMoney;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	
	
	
		
	
	
	

}

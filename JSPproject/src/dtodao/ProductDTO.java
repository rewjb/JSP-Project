package dtodao;

public class ProductDTO {
	
	private String id;
	// 1. 제품 고유아이디 (25) 
	private String brand;
	// 2. 제품 브랜드 (25) 
	private String modelName;
	// 3. 제품 모델이름 (100) 
	private String name;
	// 4. 제품 게시글 제목 (100)
	private int price;
	// 5. 제품 가격 (number)
	private int deliverPrice;
	// 6. 제품 배달비   (number)
	private int saveMoney;
	// 7. 제품 적립금  (number)
	private String components;
	// 8. 제품 구성품  (30)
	private String imgaddr;
	// 9. 이미지 주소 (100)
	
	
	public String getId() {
		return id;
	}
	public String getImgaddr() {
		return imgaddr;
	}
	public void setImgaddr(String imgaddr) {
		this.imgaddr = imgaddr;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getComponents() {
		return components;
	}
	public void setComponents(String components) {
		this.components = components;
	}
	
	
	public ProductDTO(String id, String brand, String modelName, String name, int price, int deliverPrice,
			int saveMoney, String components, String imgaddr) {
		super();
		this.id = id;
		this.brand = brand;
		this.modelName = modelName;
		this.name = name;
		this.price = price;
		this.deliverPrice = deliverPrice;
		this.saveMoney = saveMoney;
		this.components = components;
		this.imgaddr = imgaddr;
	}
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}//기본 생성자
	
	
}// 클래스 종료

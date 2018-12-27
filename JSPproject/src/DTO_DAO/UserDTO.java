package DTO_DAO;

public class UserDTO {

	private String id;
	// 회원 아이디
	private String pw;
	// 회원 비밀번호
	private String name;
	// 회원 이름
	private String tel;
	// 회원 전화번호
	private String addr;
	// 회원 주소
	private String email;
	// 회원 이메일

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public UserDTO() {
	}//기본 생성자

	public UserDTO(String id, String pw, String name, String tel, String addr, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.email = email;
	}
	
}// 클래스 종료

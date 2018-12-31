package dtodao;

public class MemberDTO {
	
	private String id;
	// 1. 회원 아이디 (길이 : 15)
	private String pw;
	// 2. 회원 비밀번호(길이 : 15)
	private String name;
	// 3. 회원 이름(길이 : 10)
	private String birthDay;
	// 4. 회원 생년월일(ex : 1994-07-31 / 길이 : 10)
	private String tel;
	// 5. 회원 전화번호 (ex : 010-xxxx-xxxx / 길이 : 15)
	private String addr;
	// 6. 회원 주소 (길이 : 40)
	private String email;
	// 7. 회원 이메일 (길이 : 60)

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

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

	public MemberDTO() {
	}// 기본 생성자

	public MemberDTO(String id, String pw, String name, String tel, String addr, String email, String birthDay) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
		this.email = email;
		this.birthDay = birthDay;
	}

}// 클래스 종료

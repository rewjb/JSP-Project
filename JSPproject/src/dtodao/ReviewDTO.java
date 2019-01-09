package dtodao;
 
public class ReviewDTO {
	
    private int num;
    private String pid;
    private String mid;
    private String content;
    private String grade;
    private String reg_date;	
    private String img;
    
//    CREATE TABLE SYSTEM.REVIEW
//    (
//      NUM       NUMBER not null,
//      PID       VARCHAR2(30 BYTE) not null,
//      MID       VARCHAR2(20 BYTE) not null,
//      CONTENT   VARCHAR2(350 BYTE) not null,
//      GRADE     VARCHAR2(10 BYTE) not null,
//      REG_DATE  DATE not null,
//      IMG       VARCHAR2(50 BYTE)
//    );
    
    
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
		
     

    
}
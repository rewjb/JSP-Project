package dtodao;

public class QnADTO {
	
		private int num;
	//  1.글 고유 번호 NUMBER
		private String mid;
	//  2. 회원아이디 호VARCHAR2 (10 Byte)
		private String pid;
	//  3. 제품 고유 아이디 VARCHAR2 (30 Byte)
		
		private String grade;
	//  4. 문의글 작성시 별점 등급이 넘어오는 것에 대한 컬럼을 맞춰주기 위한 변수  (10 Byte);
		private String content;
	//  5. 리뷰 내용 VARCHAR2 (350 Byte)
		
		private int ref;
	//  6. 문의글 작성시 오리지날글에 대한 그룹들을 위한 변수 number
		
		private int re_step;
	//	7. 오리지날 글에 대한 여러개의 답변들의 그룹을 위한 변수 number
		private int re_level;
	//	8. 답변 작성시 답변이 오리지날 글의 아래에 달리도록 해주는 변수 number	
		private String reg_date;
	//  9. 날짜 변수 date

		
		
//		CREATE TABLE SYSTEM.QNABOARD
//		(
//		  NUM        NUMBER,
//		  PID        VARCHAR2(30 BYTE),
//		  MID        VARCHAR2(20 BYTE),
//		  GRADE      VARCHAR2(10 BYTE),
//		  CONTENT    VARCHAR2(350 BYTE),
//		  REF        NUMBER,
//		  RE_STEP    NUMBER,
//		  RE_LEVEL   NUMBER,
//		  REG_DATE   DATE,
//		  CHECKTRUE  NUMBER
//		);
		
		
		
		
		private int checkTrue;
		

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
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

		public String getGrade() {
			return grade;
		}

		public void setGrade(String grade) {
			this.grade = grade;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public int getRef() {
			return ref;
		}

		public void setRef(int ref) {
			this.ref = ref;
		}

		public int getRe_step() {
			return re_step;
		}

		public void setRe_step(int re_step) {
			this.re_step = re_step;
		}

		public int getRe_level() {
			return re_level;
		}

		public void setRe_level(int re_level) {
			this.re_level = re_level;
		}

		public String getReg_date() {
			return reg_date;
		}

		public void setReg_date(String reg_date) {
			this.reg_date = reg_date;
		}

		public int getCheckTrue() {
			return checkTrue;
		}

		public void setCheckTrue(int checkTrue) {
			this.checkTrue = checkTrue;
		}
		
		

}

package dtodao;

public class QnADTO {
		
		private int num;
	//  1.글 고유 번호 NUMBER
		private String mid;
	//  2. 회원아이디 호VARCHAR2 (10 Byte)
		private String pid;
	//  3. 제품 고유 아이디 VARCHAR2 (30 Byte)	
		private String content;
	//  4. 리뷰 내용 VARCHAR2 (350 Byte)
		
		private int ref;
	//  5. 문의글 작성시 오리지날글에 대한 그룹들을 위한 변수 number
		
		private int re_step;
	//	6. 오리지날 글에 대한 여러개의 답변들의 그룹을 위한 변수 number
		private int re_level;
	//	7. 답변 작성시 답변이 오리지날 글의 아래에 달리도록 해주는 변수 number	
		private String reg_date;
	//  8. 날짜 변수 date

		private int checkTrue;
	// 	답변 여부 체크
		
		
//		CREATE TABLE SYSTEM.QNABOARD
//		(
//		  NUM        NUMBER not null,
//		  PID        VARCHAR2(30 BYTE) not null,
//		  MID        VARCHAR2(20 BYTE) not null,
//		  CONTENT    VARCHAR2(350 BYTE) not null,
//		  REF        NUMBER not null,
//		  RE_STEP    NUMBER not null,
//		  RE_LEVEL   NUMBER not null,
//		  REG_DATE   DATE not null,
//		  CHECKTRUE  NUMBER
//		);

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

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
		
		private int re_step;
		
		private int re_level;
		
		private String reg_date;

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

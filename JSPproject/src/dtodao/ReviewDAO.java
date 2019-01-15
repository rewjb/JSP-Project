package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




public class ReviewDAO {

//	private static ReviewDAO dao = new ReviewDAO();
//
//	static ReviewDAO getInstance() {
//		return dao;
//	}// 싱글톤 반환

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	// 데이터 베이스의 커넥션을 사용하도록 설정하는 메소드
	// lib 에  ojdbc7.jar 라이브러리 등록 할것  maver.repository 사이트 검색후 다운로드

	public void getCon() {

		try {
			// 외부에서 데이터를 읽어들어야 하기에
			Context initContext = new InitialContext();
			// 톰켓 서버에 정보를 담아놓은 고으로 이동
			Context envContext = (Context) initContext.lookup("java:comp/env/");
			// 데이터 소스 객체를 선언
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			// 데이터 소스를 기준으로 커넥션을 연결해주시오
			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * try{
		 * 
		 * // 1.해당 데이터 베이스를 사용한다고 선언 (클래스를 등록 = 오라클용 사용 )
		 * Class.forName("oracle.jdbc.driver.OracleDriver"); // 2.해당 데이터 베이스에 접속 con =
		 * DriverManager.getConnection(url, id, pass); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */

	}

	// 하나의 새로운 게시글이 넘어와서 저장되는 메소드
	public void insertReview(ReviewDTO bean) {
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.

		getCon();
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		try {

			String sql = " insert into review values(review_seq.NEXTVAL, ? ,? , ?, ?, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			// ?에 값을 맵핑
			pstmt.setString(1, bean.getPid());
			pstmt.setString(2, bean.getMid());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getGrade());
			pstmt.setString(5, bean.getImg());

			// 쿼리를 실행하시오
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 자원 반납
				if (pstmt != null)
					con.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 해당제품에 대해 전체를 가져오는 메소드
		public Vector<ReviewDTO> getAllReview(String pid, int start, int end) {
			
			Vector<ReviewDTO> v = new Vector<ReviewDTO>();
			
			getCon();
			
			try {
				// 쿼리 준비
				String sql ="select *  from (select A.* , Rownum Rnum from (select * from review where pid=? order by reg_date desc ) A ) "
	                    + " where Rnum >= ? and Rnum <= ?";
				/* String sql = "select * from review"; */
				System.out.println("쿼리성공");
				// 쿼리를 실행할객체 선언
				pstmt = con.prepareStatement(sql);
				// 쿼리실행 후 결과 저장
	            pstmt.setString(1, pid);
	            pstmt.setInt(2, start);
	            pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				System.out.println("쿼리성공");
				// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
				while (rs.next()) {
					// 데이터를 패키징( 가방 = Board2bean 클래스를 이용)해줌

					ReviewDTO bean = new ReviewDTO();

					bean.setNum(rs.getInt("num"));

					bean.setMid(rs.getString("mid"));

					bean.setPid(rs.getString("pid"));

					bean.setContent(rs.getString("content"));

					bean.setGrade(rs.getString("grade"));

					bean.setReg_date(rs.getDate("reg_date").toString());// 날짜를 스트링으로 받기 위해 toString을 사용

					bean.setImg(rs.getString("img"));
					// 패키징한 데이터를 벡터에 저장
					v.add(bean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					// 자원 반납
					if (rs != null)
						con.close();
					if (pstmt != null)
						con.close();
					if (con != null)
						con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return v;
			
		}
		
		//해당 제품에 대한 등급별로 가져오는 메소드
		public Vector<ReviewDTO> getGradeReview(String pid, int start, int end) {
			
			Vector<ReviewDTO> v = new Vector<ReviewDTO>();
			
			getCon();
			
			try {
				// 쿼리 준비
				String sql ="select *  from (select A.* , Rownum Rnum from (select * from review where pid= ? order by grade desc) A ) "
	                    + " where Rnum >= ? and Rnum <= ? ";
				
				System.out.println("쿼리성공");
				// 쿼리를 실행할객체 선언
				pstmt = con.prepareStatement(sql);
				// 쿼리실행 후 결과 저장
	            pstmt.setString(1, pid);
	            pstmt.setInt(2, start);
	            pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				System.out.println("쿼리성공");
				// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
				while (rs.next()) {
					// 데이터를 패키징( 가방 = Board2bean 클래스를 이용)해줌

					ReviewDTO bean = new ReviewDTO();

					bean.setNum(rs.getInt("num"));

					bean.setMid(rs.getString("mid"));

					bean.setPid(rs.getString("pid"));

					bean.setContent(rs.getString("content"));

					bean.setGrade(rs.getString("grade"));

					bean.setReg_date(rs.getDate("reg_date").toString());// 날짜를 스트링으로 받기 위해 toString을 사용

					bean.setImg(rs.getString("img"));
					// 패키징한 데이터를 벡터에 저장
					v.add(bean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					// 자원 반납
					if (rs != null)
						con.close();
					if (pstmt != null)
						con.close();
					if (con != null)
						con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return v;
			
		}
		
		//내 리뷰만 을 가져오는 메소드
		public Vector<ReviewDTO> getMyReview(String mid, String pid, int start, int end) {
			
			Vector<ReviewDTO> v = new Vector<ReviewDTO>();
			
			getCon();
			
			try {
				// 쿼리 준비
				String sql ="select *  from (select A.* , Rownum Rnum from (select * from review where mid = ? and pid=? order by reg_date desc ) A ) "
	                    + " where Rnum >= ? and Rnum <= ?";
				
				System.out.println("쿼리성공");
				// 쿼리를 실행할객체 선언
				pstmt = con.prepareStatement(sql);
				// 쿼리실행 후 결과 저장
	            pstmt.setString(1, mid);
	            pstmt.setString(2, pid);
	            pstmt.setInt(3, start);
	            pstmt.setInt(4, end);
				rs = pstmt.executeQuery();
				System.out.println("쿼리성공");
				// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
				while (rs.next()) {
					// 데이터를 패키징( 가방 = Board2bean 클래스를 이용)해줌

					ReviewDTO bean = new ReviewDTO();

					bean.setNum(rs.getInt("num"));

					bean.setMid(rs.getString("mid"));

					bean.setPid(rs.getString("pid"));

					bean.setContent(rs.getString("content"));

					bean.setGrade(rs.getString("grade"));

					bean.setReg_date(rs.getDate("reg_date").toString());// 날짜를 스트링으로 받기 위해 toString을 사용

					bean.setImg(rs.getString("img"));
					// 패키징한 데이터를 벡터에 저장
					v.add(bean);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					// 자원 반납
					if (rs != null)
						con.close();
					if (pstmt != null)
						con.close();
					if (con != null)
						con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return v;
			
		}
		
		 //해당 제품의 전체 글의 갯수를 리턴하는 메소드
	    public int getAllPidCount(String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	        int count =0;
	        try{
	            //쿼리준비
	            String sql ="select count(*) from review where pid = ?";
	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);
	            //쿼리 실행 후 결과를 리턴
	            pstmt.setString(1, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);
	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
	    
		//해당 제품에대해 특정 회원 아이디로 작성한 글만  카운트 하는 메소드
	    public int getAllMidCount(String mid, String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	        int count =0;
	        try{
	            //쿼리준비
	            String sql ="select count(*) from review where mid = ? and pid = ?";
	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);
	            //쿼리 실행 후 결과를 리턴
	            
	            pstmt.setString(1, mid);
	            pstmt.setString(2, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);
	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
	    
		 //해달 제품의 별점순 제품을 카운트 하는 메소드
	    public int getAllGradeCount(String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	       int count = 0;
	        
	        try{
	            //쿼리준비
	            String sql ="select count(*) grade from review where pid = ?";

	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);

	            //쿼리 실행 후 결과를 리턴
	            
	            pstmt.setString(1, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);

	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
		 //해달 제품의 별점순 제품을 카운트 하는 메소드
	    public int getAllGradeCoun2(String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	       int count = 0;
	        
	        try{
	            //쿼리준비
	            String sql ="select count(*) grade from review where pid = ? and grade = 2";

	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);

	            //쿼리 실행 후 결과를 리턴
	            
	            pstmt.setString(1, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);

	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
		 //해달 제품의 별점순 제품을 카운트 하는 메소드
	    public int getAllGradeCount3(String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	       int count = 0;
	        
	        try{
	            //쿼리준비
	            String sql ="select count(*) grade from review where pid = ? and grade = 3";

	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);

	            //쿼리 실행 후 결과를 리턴
	            
	            pstmt.setString(1, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);

	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
		 //해달 제품의 별점순 제품을 카운트 하는 메소드
	    public int getAllGradeCount4(String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	       int count = 0;
	        
	        try{
	            //쿼리준비
	            String sql ="select count(*) grade from review where pid = ? and grade = 4";

	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);

	            //쿼리 실행 후 결과를 리턴
	            
	            pstmt.setString(1, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);

	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
	    
		 //해달 제품의 별점순 제품을 카운트 하는 메소드
	    public int getAllGradeCount5(String pid){
	        getCon();
	        //게시글 전체수를 저장하는 변수
	       int count = 0;
	        
	        try{
	            //쿼리준비
	            String sql ="select count(*) grade from review where pid = ? and grade = 5";

	            //쿼리를 실행할 객체 선언
	            pstmt = con.prepareStatement(sql);

	            //쿼리 실행 후 결과를 리턴
	            
	            pstmt.setString(1, pid);
	            
	            rs=pstmt.executeQuery();
	            if(rs.next()){
	            	
	            	//젠체 게시글의 수
	                count =rs.getInt(1);

	            }
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return count;
	    }
	    
		public void updateReview(ReviewDTO reviewdto) {


		    getCon();
		
			// DB 연결
			String sql = "UPDATE review SET content=? WHERE num=?";
			// sql 문 작성
			try {
				// 오류 처리
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, reviewdto.getContent());
				ps.setInt(2, reviewdto.getNum());
	
				
				ps.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}// updateMember() : 메서드 종료
		
		//하나의 글을 삭제하는 메소드 입니다.
	    public void deleteReivew(String id, int num){
	         
	    	getCon();
	    	
	        try{
	            //쿼리 준비
	            String sql ="delete from review where mid=? and num = ?";
	            
				PreparedStatement pstmt = con.prepareStatement(sql);

		
	            //?
	            pstmt.setString(1, id);
	            pstmt.setInt(2, num);
	            //쿼리 실행
	            pstmt.executeUpdate();
	            //자원 반납
	            con.close();
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	    }
	    
	    
	    
	

}

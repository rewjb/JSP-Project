package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	public void insertReview(ReviewBean bean) {
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.

		getCon();
		// 빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
		try {

			String sql = " insert into review values(review_seq.NEXTVAL, ? ,? , ?, ?, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			// ?에 값을 맵핑
			pstmt.setString(1, bean.getMid());
			pstmt.setString(2, bean.getPid());
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

	// 모든 게시글을 리턴해주는
	public Vector<ReviewBean> getAllReview() {
		// 리넡할 객체 선언
		Vector<ReviewBean> v = new Vector<>();
		System.out.println("num");

		getCon();
		System.out.println("num");

		try {
			// 쿼리 준비
			String sql = "select * from review";
			System.out.println("쿼리성공");
			// 쿼리를 실행할객체 선언
			pstmt = con.prepareStatement(sql);
			// 쿼리실행 후 결과 저장
			rs = pstmt.executeQuery();
			System.out.println("쿼리성공");
			// 데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출
			while (rs.next()) {
				// 데이터를 패키징( 가방 = Board2bean 클래스를 이용)해줌

				ReviewBean bean = new ReviewBean();

				bean.setNum(rs.getInt("num"));
				System.out.println("num");
				bean.setMid(rs.getString("mid"));
				System.out.println("mid");
				bean.setPid(rs.getString("pid"));
				System.out.println("pid");
				bean.setContent(rs.getString("content"));
				System.out.println("content");
				bean.setGrade(rs.getString("grade"));
				System.out.println("grade");
				bean.setReg_date(rs.getDate("reg_date").toString());// 날짜를 스트링으로 받기 위해 toString을 사용
				System.out.println("reg_date");
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
	
	// 하나의 제품에 대한 리뷰 전부를 리턴
    public Vector<ReviewBean> getPidReview(String pid){
        //리턴타입 선언
    	
    	Vector<ReviewBean> v = new Vector<>();
    	
    	
        getCon();
         
        try{
                                     
            //쿼리준비
            String sql ="select * from review where pid= ?";
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, pid);
            //쿼리 실행후 결과를 리턴
            System.out.println(pid);
            
            rs=pstmt.executeQuery();
            
            while(rs.next()){
            	
            	ReviewBean bean = new ReviewBean();
            	
            	System.out.println("성공");
                bean.setNum(rs.getInt("num"));
                bean.setMid(rs.getString("mid"));
                bean.setContent(rs.getString("content"));   
                bean.setGrade(rs.getString("grade"));
                bean.setReg_date(rs.getDate("REG_DATE").toString());
                System.out.println("성공2");
				// 패키징한 데이터를 벡터에 저장
				v.add(bean);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally {
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
    
    //BoardInfo에서 하나의 게시글을 리넡하는 메소드
    public ReviewBean getOneReview(int num, String mid){
        //리턴타입 선언
    	ReviewBean bean =new ReviewBean();
        getCon();
         
        try{
             
            //쿼리준비
            String sql ="select * from review where num=? and mid=?";
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.setString(2, mid);
            //쿼리 실행후 결과를 리턴
            rs=pstmt.executeQuery();
            if(rs.next()){
                bean.setNum(rs.getInt("num"));
                bean.setMid(rs.getString("mid"));
                bean.setPid(rs.getString("pid"));
                bean.setContent(rs.getString("content"));   
                bean.setGrade(rs.getString("grade"));
                bean.setReg_date(rs.getDate("REG_DATE").toString());           
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return bean;
    }

}

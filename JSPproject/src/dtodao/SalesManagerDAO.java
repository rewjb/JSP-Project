package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SalesManagerDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	

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

	}
	
	//거래 테이블에서 각 해당 월에 대한 회원들의 구매목록 출력
    public Vector<SalesManagerDTO> getMonthDeal(){
    	System.out.println("성공2");
        //리턴타입 선언
    	Vector<SalesManagerDTO> v =new Vector<SalesManagerDTO>();
        getCon();
         
        try{

            //쿼리준비
            String sql = "select * from deal where (dealdate between '19/01/01' and '19/01/31')";
            System.out.println("성공3");
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);
            
/*            pstmt.setString(1, month);
            pstmt.setString(2, month);*/
            //쿼리 실행후 결과를 리턴
            rs=pstmt.executeQuery();
            
            while(rs.next()){
            	System.out.println("성공4");
            	
            	SalesManagerDTO dto = new SalesManagerDTO();
            	

            	dto.setDealNum(rs.getInt(1));
            	System.out.println("성공5");
            	dto.setMid(rs.getString(2));
            	System.out.println("성공6");
            	dto.setPid(rs.getString(3));
            	System.out.println("성공7");
            	dto.setQuantity(rs.getInt(4));
            	System.out.println("성공8");
            	dto.setDealDate(rs.getDate(5).toString());// 날짜를 스트링으로 받기 위해 toString을 사용
            	System.out.println("성공9");
            	
            	v.add(dto);
            	System.out.println("성공10");
            	
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            //자원 반납
            closed();
        }
        System.out.println("성공16");
        return v;
    	
    }
     
     
    //자원 반납 메소드
    private void closed(){
        try{
            //자원 반납
            if(rs!=null)con.close();
            if(pstmt!=null)con.close();
            if(con!=null)con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    // 거래테이블의 pid를 참조해서 사진을 가져오는 메소드
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
}

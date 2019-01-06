package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class QnADAO {
	
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
    public void insertQnA(QnADTO dto) {
    	
    	//dto에서 넘어오자 않았던 데이터를 초고회 해주어야 한다.
    			
		getCon();
		
		 //빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
        int ref=0; //글그룹을 의미 = 쿼리를 실행시켜서 가장큰 ref 값을 자져온 후  +1을 더해주면됨
        int re_step=1; //새글이기에 = 부모글
        int re_level=1; 
       
		
		try {
			//가장 큰 ref값을 읽어오는 쿼리 준비
            String refsql ="select max(ref) from qnaboard ";
            
           //쿼리실행 객체 
            pstmt =con.prepareStatement(refsql);


            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	ref = rs.getInt(1)+1;
            }
            
    
            System.out.println("여기서 실패3");
			String sql = " insert into qnaboard values(qna_seq.NEXTVAL,?,?,?,?,?,?,?,sysdate,0)";
			
			pstmt = con.prepareStatement(sql);
			// ?에 값을 맵핑
			pstmt.setString(1, dto.getPid());
			System.out.println(dto.getPid());
			pstmt.setString(2, dto.getMid());
			System.out.println(dto.getMid());
			pstmt.setString(3, dto.getSubject());
			System.out.println(dto.getSubject());
			pstmt.setString(4, dto.getContent());
			System.out.println(dto.getContent());
			pstmt.setInt(5, ref);
			System.out.println(ref);
			pstmt.setInt(6, re_step);
			System.out.println(re_step);
			pstmt.setInt(7, re_level);
			System.out.println(re_level);
			
			pstmt.executeUpdate();

			// 쿼리를 실행하시오
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
    
	public Vector<QnADTO> getAllReview(String pid, int start, int end) {
			
			Vector<QnADTO> v = new Vector<QnADTO>();
			
			getCon();
			
			try {
				// 쿼리 준비
				String sql ="select *  from (select A.* , Rownum Rnum from (select * from qnaboard where pid=? order by ref desc,re_step asc ) A ) "
	                    + " where Rnum >= ? and Rnum <= ?";
				
			
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
	
					QnADTO dto = new QnADTO();
	
					dto.setNum(rs.getInt("num"));
	
					dto.setPid(rs.getString("pid"));
	
					dto.setMid(rs.getString("mid"));
	
					dto.setSubject(rs.getString("subject"));
	
					dto.setContent(rs.getString("content"));
					
					dto.setRef(rs.getInt(6));
					
					dto.setRe_step(rs.getInt(7));
					
					dto.setRe_level(rs.getInt(8));

					dto.setReg_date(rs.getDate("reg_date").toString());// 날짜를 스트링으로 받기 위해 toString을 사용
					
					dto.setCheeckTrue(rs.getInt(10));
	
					// 패키징한 데이터를 벡터에 저장
					v.add(dto);
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
	        String sql ="select count(*) from qnaboard where pid = ?";
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
	
	  //답변글이 저장되는 메소드
	
    public void reWriteQnA(QnADTO dto){
        //부모글 그룹과 글레벨 글스텝을 읽어드림
    	
        int ref= dto.getRef();
        int re_step= dto.getRe_step();
        int re_level= dto.getRe_level();
         
   
        getCon();
         
        try{
            ////////////// 핵심 코드   ////////////////
            //1.부모 글보다 큰 re_level 의 값을 전부 1씩 증가시켜줌
            String levelsql= "update qnaboard set re_level = re_level+1 where ref=? and re_level > ?";
            //쿼리실행객체 선언
            pstmt=con.prepareStatement(levelsql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, re_level);
            //쿼리실행
            pstmt.executeUpdate();
            //답변글 데이터를 저장
            String sql ="insert into qnaboard values(qna_seq.NEXTVAL, ? ,? , ?, ?, ?, ?,?,sysdate,0)";
            pstmt =con.prepareStatement(sql);
            //?에 값을 대입
            pstmt.setString(1, dto.getPid());
            pstmt.setString(2, dto.getMid());
            pstmt.setString(3, dto.getSubject());
            pstmt.setString(4, dto.getContent());
            pstmt.setInt(5, ref); // 원래 글의 답글이기 때문에 원래글의 ref값을 넣어줌
            pstmt.setInt(6, re_step+1); //답글이기에 원래 글의 re_step에 1을 더해줌
            pstmt.setInt(7, re_level+1);

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }


}

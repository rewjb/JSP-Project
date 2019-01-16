package dtodao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.connector.Request;

public class MemberDAO {

//	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private String user = "system";
//	private String password = "1234";
	
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}//싱글톤 객체 얻기

	private Connection DBconnectMethod() {
		try {
			Context initCtx = new InitialContext();
			DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/orcl");
			Connection con = ds.getConnection();

//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			Connection con = DriverManager.getConnection(url, user, password);

			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}// DBconnectMethod() : 메서드 종료

	public String joinMember(MemberDTO memberDTO) {
		// 회원가입을 하는 메서드

		// 1.회원 아이디 (길이 : 15)
		// 2.회원 비밀번호(길이 : 15)
		// 3.회원 이름(길이 : 10)
		// 4.회원 생년월일(ex : 1994-07-31 / 길이 : 11)
		// 5.회원 전화번호 (ex : 010-xxxx-xxxx / 길이 : 15)
		// 6.회원 주소 (길이 : 60)
		// 7.회원 이메일 (길이 : 60)

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)";

		// sql 문 작성

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getPw());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getBirthDay());
			ps.setString(5, memberDTO.getTel());
			ps.setString(6, memberDTO.getAddr());
			ps.setString(7, memberDTO.getEmail());

			ps.executeUpdate();

			return "회원가입이 완료되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();
			return "회원가입에 오류가 생겼습니다.";
		}

	}// joinMember() : 메서드 종료

	public String loginMember(String id) {
		// 로그인을 하는 메서드

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "SELECT PW FROM MEMBER  WHERE ID = '" + id + "'";
		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet result = ps.executeQuery();

			String selectedPW = null;

			while (result.next()) {
				selectedPW = result.getString("PW");
			} // 비밀번호 존재시 비밀번호 반환

			return selectedPW;
			// 비밀번호 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}// loginMember() : 메서드 종료

	public String searchID(String id) {
		// 아이디각 존재하는지 검색

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "SELECT ID FROM MEMBER  WHERE ID = '" + id + "'";
		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet result = ps.executeQuery();

			String selectedID = null;

			while (result.next()) {
				selectedID = result.getString("ID");
			} // 비밀번호 존재시 비밀번호 반환

			return selectedID;
			// 비밀번호 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}// searchID() : 메서드 종료
	
	public MemberDTO searchMemberInfo(String id) {
		// 아이디각 존재하는지 검색

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "SELECT * FROM MEMBER  WHERE ID = '" + id + "'";
		// sql 문 작성
		MemberDTO memberDTO = null;
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet result = ps.executeQuery();


			while (result.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setId(result.getString("ID"));
				memberDTO.setPw(result.getString("PW"));
				memberDTO.setName(result.getString("NAME"));
				memberDTO.setBirthDay(result.getString("BIRTHDAY"));
				memberDTO.setAddr(result.getString("ADDR"));
				memberDTO.setEmail(result.getString("EMAIL"));
				memberDTO.setTel(result.getString("TEL"));
			} // 비밀번호 존재시 비밀번호 반환

			// 비밀번호 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// loginMember() : 메서드 종료
	
	public void updateMember(MemberDTO memberDTO) {
//		public void updateMember(String id , String pw , String name , String tel , String addr) {
		// 아이디각 존재하는지 검색

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "UPDATE MEMBER SET PW=?,NAME=?,TEL=?,ADDR=?  WHERE ID=?";
		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDTO.getPw());
			ps.setString(2, memberDTO.getName());
			ps.setString(3, memberDTO.getTel());
			ps.setString(4, memberDTO.getAddr());
			ps.setString(5, memberDTO.getId());
			
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// updateMember() : 메서드 종료
	
	public void unjoinMember(String mid) {
//		public void updateMember(String id , String pw , String name , String tel , String addr) {
		// 아이디각 존재하는지 검색

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "DELETE FROM MEMBER WHERE ID=?";
		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// updateMember() : 메서드 종료

	
	//------------관리자가 관리하는 멤버 DAO 작성부분 bymin----------------
	
	// 멤버  전체를 가져오는 메소드
	public Vector<MemberDTO> getAllMember() {
		
		Vector<MemberDTO> v = new Vector<MemberDTO>();
		
		Connection con = DBconnectMethod();
		
		
		try {
			
			// 쿼리 준비
			String sql ="select * from member";
			PreparedStatement pstmt = con.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();
			
			System.out.println("쿼리성공");

			while (rs.next()) {

				MemberDTO dto = new MemberDTO();
								
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				dto.setBirthDay(rs.getString("birthday"));
				dto.setTel(rs.getString("tel"));
				dto.setAddr(rs.getString("addr"));
				dto.setEmail(rs.getString("email"));

				v.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
		
	}
	
	//한명의 멤버를 삭제하는 메소드 입니다.
    public void deleteMember(String id){
         
    	Connection con = DBconnectMethod();
    	
        try{
            //쿼리 준비
            String sql ="delete from member where id=?";
            
			PreparedStatement pstmt = con.prepareStatement(sql);

	
            //?
            pstmt.setString(1, id);
            //쿼리 실행
            pstmt.executeUpdate();
            //자원 반납
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public MemberDTO getOneMember(String id) {
		// 아이디각 존재하는지 검색

		Connection con = DBconnectMethod();
		// DB 연결
		// sql 문 작성
		MemberDTO memberDTO = null;
		try {
			// 오류 처리
			String sql = "SELECT * FROM MEMBER  WHERE ID = ?";
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			ResultSet result = ps.executeQuery();


			while (result.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setId(result.getString("ID"));
				memberDTO.setPw(result.getString("PW"));
				memberDTO.setName(result.getString("NAME"));
				memberDTO.setBirthDay(result.getString("BIRTHDAY"));
				memberDTO.setAddr(result.getString("ADDR"));
				memberDTO.setEmail(result.getString("EMAIL"));
				memberDTO.setTel(result.getString("TEL"));
			} // 비밀번호 존재시 비밀번호 반환

			// 비밀번호 반환
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// loginMember() : 메서드 종료

}// 클래스 종료

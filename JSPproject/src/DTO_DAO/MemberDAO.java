package DTO_DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.catalina.connector.Request;

public class MemberDAO {

	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "system";
	private String password = "1234";

	private Connection DBconnectMethod() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}// DBconnectMethod() : 메서드 종료
	
	public String joinMember(MemberDTO memberDTO) {
		//회원가입을 하는 메서드
		
		// 1.회원 아이디 (길이 : 15)
		// 2.회원 비밀번호(길이 : 15)
		// 3.회원 이름(길이 : 10)
		// 4.회원 생년월일(ex : 1994-07-31 / 길이 : 11)
		// 5.회원 전화번호 (ex : 010-xxxx-xxxx / 길이 : 15)
		// 6.회원 주소 (길이 : 40)
		// 7.회원 이메일 (길이 : 40)
		
		Connection con= DBconnectMethod();
		//DB 연결
		String sql = "INSERT INTO SYSTEM.\"member\"  VALUES(?,?,?,?,?,?,?);";
		
		//sql 문 작성

		try {
			//오류 처리
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
		//로그인을 하는 메서드
		
		Connection con= DBconnectMethod();
		//DB 연결
		System.out.println("ddddddddddddddddddd");
		String sql = "SELECT pw FROM SYSTEM.\"member\"  WHERE id = ?;";
		//sql 문 작성
		try {
			//오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet result =  ps.executeQuery();
			
			String selectedPW = null;
			
			while (result.next()) {
				selectedPW=result.getString("PW");
			}//비밀번호 존재시 비밀번호 반환
			
			return selectedPW;
			//비밀번호 반환
		} catch (Exception e) {
			System.err.println("MemberDAO-loginMember(String id) : 메서드 오류");
			e.printStackTrace();
		}
		return null;
	}// joinMember() : 메서드 종료
	
	
	
	
	

}// 클래스 종료

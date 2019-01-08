package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DealDAO {

//	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private String user = "system";
//	private String password = "1234";

	private static CartDAO cartDAO = new CartDAO();

	public static CartDAO getInstance() {
		return cartDAO;
	}

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

	public void registerCart(String pid, String mid) {

//		CREATE TABLE SYSTEM.DEAL (
//				NUM NUMBER,
//				MID VARCHAR2(100),
//				PID VARCHAR2(100),
//				DEALDATE VARCHAR2(100)
//			);

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "INSERT INTO DEAL VALUES(?,?,DEFAULT,sysdate)";
//		"INSERT INTO CART VALUES(?,?,DEFAULT,sysdate)";
		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, pid);
			ps.setString(2, mid);
			// 모든 값 세팅
			ps.executeUpdate();
			// 삽입

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// joinProduct() : 메서드 종료



}

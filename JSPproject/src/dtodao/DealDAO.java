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

	private static DealDAO dealDAO = new DealDAO();

	public static DealDAO getInstance() {
		return dealDAO;
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

	public void insertDealInfo(String mid, String pid , int quantity) {
        //구매하는 메서드
		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "INSERT INTO DEAL VALUES(DEALNUM.NEXTVAL,?,?,?,sysdate)";
//		"INSERT INTO CART VALUES(?,?,DEFAULT,sysdate)";
		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, mid);
			ps.setString(2, pid);
			ps.setInt(3, quantity);
			// 모든 값 세팅
			ps.executeUpdate();
			// 삽입

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// insertDealInfo() : 메서드 종료
	
	public ArrayList<ProductDTO> dealList(String mid) {
		// 아이디각 존재하는지 검색

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "SELECT  PRODUCT.IMGADDR,PRODUCT.NAME,PRODUCT.PRICE,DEAL.QUANTITY,DEAL.DEALDATE  FROM PRODUCT,DEAL WHERE  DEAL.MID=? AND PRODUCT.ID =  DEAL.PID ORDER BY DEAL.DEALDATE ";
		// sql 문 작성
		ProductDTO productDTO;
		ArrayList<ProductDTO> List  = new ArrayList<>();
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mid);
			ResultSet result = ps.executeQuery();

			while (result.next()) {
				productDTO = new ProductDTO();
				productDTO.setImgaddr(result.getString("IMGADDR"));
				productDTO.setName(result.getString("NAME"));
				productDTO.setPrice(result.getInt("PRICE"));
				productDTO.setQuantity(result.getInt("QUANTITY"));
				productDTO.setDate(result.getString("DEALDATE"));
				
				List.add(productDTO);
			} 

		} catch (Exception e) {
			e.printStackTrace();
		}
		return List;
	}// searchID() : 메서드 종료


//;
}

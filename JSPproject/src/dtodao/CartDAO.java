package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {

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

		// 제품 아이디
		// 회원 아이디
		// 수량 기본값 1
		// 찜 및 장바구니 등록 날짜

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "INSERT INTO CART VALUES(?,?,DEFAULT,sysdate)";

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

	public ArrayList<String> selectPinfo(String mid) {
		
		// 제품 아이디
		// 회원 아이디
		// 수량 기본값 1
		// 찜 및 장바구니 등록 날짜
		
		if (mid == null) {
			mid = "";
		}
		
		ArrayList<String> pidList = new ArrayList<>();
		
		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "SELECT PID FROM CART WHERE MID=?";

		// sql 문 작성
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, mid);
				// 모든 값 세팅
			ResultSet rs = 	ps.executeQuery();
			
			while (rs.next()) {
				pidList.add(rs.getString("PID"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pidList;
	}// selectPinfo() : 메서드 종료
	
	
	public ArrayList<ProductDTO> selectPrivateCart(String mid) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

//		CREATE TABLE SYSTEM.DEAL (
//				NUM NUMBER,
//				MID VARCHAR2(100),
//				PID VARCHAR2(100),
//				DEALDATE VARCHAR2(100)
//			);
		
		Connection con = DBconnectMethod();
		// DB 연결
		String sql ="SELECT CART.QUANTITY , PRODUCT.* FROM CART, PRODUCT WHERE PRODUCT.ID=CART.PID AND CART.MID=?";
		
		ProductDTO productDTO;
		
		ArrayList<ProductDTO> productList = new ArrayList<>();

		// sql 문 작성

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

				ps.setString(1, mid);
				// 모든 값 세팅
				ResultSet rs = ps.executeQuery();
				// 삽입
				
				while (rs.next()) {
					productDTO = new ProductDTO();
					
					productDTO.setId(rs.getString("ID"));
					productDTO.setBrand(rs.getString("BRAND"));
					productDTO.setModelName(rs.getString("MODELNAME"));
					productDTO.setName(rs.getString("NAME"));
					productDTO.setPrice(rs.getInt("PRICE"));
					productDTO.setDeliverPrice(rs.getInt("DELIVERPRICE"));
					productDTO.setSaveMoney(rs.getInt("SAVEMONEY"));
					productDTO.setComponents(rs.getString("COMPONENTS"));
					productDTO.setImgaddr(rs.getString("IMGADDR"));
					productDTO.setQuantity(rs.getInt("QUANTITY"));
					
					productList.add(productDTO);
				}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;

	}// selectPrivateCart() : 메서드 종료
	
	public void updateQuantity(String mid, String pid , int quantity) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		Connection con = DBconnectMethod();
		// DB 연결
		
		String sql = "UPDATE CART SET QUANTITY=? WHERE MID=? AND PID=?";
		
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

				ps.setInt(1, quantity);
				ps.setString(2, mid);
				ps.setString(3, pid);
				// 모든 값 세팅
				ps.executeUpdate();
				// 삽입

		} catch (Exception e) {
			e.printStackTrace();
		}

	}// updateQuantity() : 메서드 종료

}

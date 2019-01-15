package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {

//	private String url = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private String user = "system";
//	private String password = "1234";

	private static ProductDAO productDAO = new ProductDAO();

	public static ProductDAO getInstance() {
		return productDAO;
	}// 싱글톤 객체 얻기

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

	public void joinProduct(ArrayList<ProductDTO> productList) {
		// 크롤링으로 제품을 DB에 등록하는 메서드

		// 1. 제품 고유아이디 (25)
		// 2. 제품 브랜드 (25)
		// 3. 제품 모델이름 (100)
		// 4. 제품 게시글 제목 (100)
		// 5. 제품 가격 (number)
		// 6. 제품 배달비 (number)
		// 7. 제품 적립금 (number)
		// 8. 제품 구성품 (30)
		// 9. 이미지 주소 (100)

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "INSERT INTO PRODUCT VALUES(?,?,?,?,?,?,?,?,?)";

		ProductDTO productDTO;
		// sql 문 작성

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

			for (int i = 0; i < productList.size(); i++) {

				productDTO = productList.get(i);
				// list에서 DTO 하나 갖고오기
				ps.setString(1, productDTO.getId());
				ps.setString(2, productDTO.getBrand());
				ps.setString(3, productDTO.getModelName());
				ps.setString(4, productDTO.getName());
				ps.setInt(5, productDTO.getPrice());
				ps.setInt(6, productDTO.getDeliverPrice());
				ps.setInt(7, productDTO.getSaveMoney());
				ps.setString(8, productDTO.getComponents());
				ps.setString(9, productDTO.getImgaddr());
				// 모든 값 세팅
				ps.executeUpdate();
				// 삽입
			}
			
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}// joinProduct() : 메서드 종료

	public ArrayList<ProductDTO> openProductPage(String brand) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		// 1. 제품 고유아이디 (25)
		// 2. 제품 브랜드 (25)
		// 3. 제품 모델이름 (100)
		// 4. 제품 게시글 제목 (100)
		// 5. 제품 가격 (number)
		// 6. 제품 배달비 (number)
		// 7. 제품 적립금 (number)
		// 8. 제품 구성품 (30)
		// 9. 이미지 주소 (100)

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "select * from product where brand=? ";

		ProductDTO productDTO;

		ArrayList<ProductDTO> productList = new ArrayList<>();

		// sql 문 작성

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, brand);
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

				productList.add(productDTO);
			}
			
			ps.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;

	}// openProductPage() : 메서드 종료

	public ArrayList<ProductDTO> searchProduct(String type, String word) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		// 1. 제품 고유아이디 (25)
		// 2. 제품 브랜드 (25)
		// 3. 제품 모델이름 (100)
		// 4. 제품 게시글 제목 (100)
		// 5. 제품 가격 (number)
		// 6. 제품 배달비 (number)
		// 7. 제품 적립금 (number)
		// 8. 제품 구성품 (30)
		// 9. 이미지 주소 (100)

		Connection con = DBconnectMethod();
		// DB 연결
		String sql;

		if (word != null) {

			if (word.equals("brand")) {
				sql = "SELECT * FROM PRODUCT WHERE BRAND LIKE '%" + word + "%'";
			} else {
				sql = "SELECT * FROM PRODUCT WHERE NAME LIKE '%" + word + "%'";
			}
		} else {
			sql = "SELECT * FROM PRODUCT WHERE NAME LIKE '%" + word + "%'";
		}

		ProductDTO productDTO;

		ArrayList<ProductDTO> productList = new ArrayList<>();

		// sql 문 작성

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

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

				productList.add(productDTO);
			}

			
			ps.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;

	}// openProductPage() : 메서드 종료

	public String searchPID(String pid) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		Connection con = DBconnectMethod();
		// DB 연결
		String sql = "SELECT ID FROM PRODUCT WHERE ID=?";

		String result = null;
		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pid);
			// 모든 값 세팅

			ResultSet rs = ps.executeQuery();
			// 삽입

			if (rs.next()) {
				result = rs.getString("ID");
			} else {
				result = null;
			}

			ps.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}// searchPID() : 메서드 종료

	public ArrayList<ProductDTO> selectAll(){
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		// 1. 제품 고유아이디 (25)
		// 2. 제품 브랜드 (25)
		// 3. 제품 모델이름 (100)
		// 4. 제품 게시글 제목 (100)
		// 5. 제품 가격 (number)
		// 6. 제품 배달비 (number)
		// 7. 제품 적립금 (number)
		// 8. 제품 구성품 (30)
		// 9. 이미지 주소 (100)

		Connection con = DBconnectMethod();
		// DB 연결
		String sql;

		sql = "SELECT * FROM PRODUCT ";

		ProductDTO productDTO;

		ArrayList<ProductDTO> productList = new ArrayList<>();

		// sql 문 작성

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);

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

				productList.add(productDTO);
			}
			
			ps.close();
			rs.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productList;

	}// selectAll() : 메서드 종료
	
	public void updateProduct(String pid , ProductDTO productDTO) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		Connection con = DBconnectMethod();
		// DB 연결
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append("UPDATE PRODUCT SET ");
		sqlBuffer.append(" ID=? ,"); //1
		sqlBuffer.append(" BRAND=? ,");//2
		sqlBuffer.append(" MODELNAME=? ,");//3
		sqlBuffer.append(" NAME=? ,");//4
		sqlBuffer.append(" PRICE=? ,");//5
		sqlBuffer.append(" DELIVERPRICE=? ,");//6
		sqlBuffer.append(" SAVEMONEY=? ,");//7
		sqlBuffer.append(" COMPONENTS=? ,");//8
		sqlBuffer.append(" IMGADDR=? ");//9
		sqlBuffer.append(" WHERE ID = ? ");//10

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sqlBuffer.toString());
			ps.setString(1, productDTO.getId());
			ps.setString(2, productDTO.getBrand());
			ps.setString(3, productDTO.getModelName());
			ps.setString(4, productDTO.getName());
			ps.setInt(5, productDTO.getPrice());
			ps.setInt(6, productDTO.getDeliverPrice());
			ps.setInt(7, productDTO.getSaveMoney());
			ps.setString(8, productDTO.getComponents());
			ps.setString(9, productDTO.getImgaddr());
			ps.setString(10, pid);
			// 모든 값 세팅
			ps.executeUpdate();
			// 삽입

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		}

	}// updateProduct() : 메서드 종료
	
	public void dropProduct(String pid) {
		// 제품 페이지 이동시 제품 검색을 하는 기본적 메서드

		Connection con = DBconnectMethod();
		// DB 연결
		
		String sql = "DELETE FROM PRODUCT WHERE ID= ?";

		try {
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, pid);
			// 모든 값 세팅
			ps.executeUpdate();
			// 삽입

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}// dropProduct() : 메서드 종료

}// 클래스 종료

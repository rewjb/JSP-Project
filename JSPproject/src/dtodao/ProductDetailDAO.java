package dtodao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ProductDetailDAO {
	
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
	
	//BoardInfo에서 하나의 게시글을 리넡하는 메소드
    public ProductDTO getOneProduct(String pid){
        //리턴타입 선언
    	ProductDTO dto =new ProductDTO();
        getCon();
         
        try{

            //쿼리준비
            String sql ="select * from product where id=?";
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, pid);
            //쿼리 실행후 결과를 리턴
            rs=pstmt.executeQuery();
            if(rs.next()){
            	
            	dto.setBrand(rs.getString("brand"));
            	dto.setComponents(rs.getString("components"));
            	dto.setDeliverPrice(rs.getInt("deliverprice"));
            	dto.setId(rs.getString("id"));
            	dto.setImgaddr(rs.getString("imgaddr"));
            	dto.setModelName(rs.getString("modelname"));
            	dto.setName(rs.getString("name"));
            	dto.setPrice(rs.getInt("price"));            
            	dto.setSaveMoney(rs.getInt("savemoney"));            
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            //자원 반납
            closed();
        }
        return dto;
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
    
 

}

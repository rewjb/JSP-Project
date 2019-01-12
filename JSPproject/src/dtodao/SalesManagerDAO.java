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
    public Vector<SalesManagerDTO> getMonthDeal(String mStart, String mEnd ){
    	
        //리턴타입 선언
    	Vector<SalesManagerDTO> v =new Vector<SalesManagerDTO>();

        getCon();

        try{
        	String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
       			"from deal, product\r\n" + 
       			"where deal.pid = product.id and dealdate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";
        	

			pstmt = con.prepareStatement(sql);
			// 쿼리실행 후 결과 저장
            pstmt.setString(1, mStart);
            pstmt.setString(2, mEnd);

			            
            rs = pstmt.executeQuery();

            //쿼리 실행후 결과를 리턴

            
            while(rs.next()){

            	
	            	SalesManagerDTO dto = new SalesManagerDTO();
	            	
	            	dto.setImgAddr(rs.getString(1));
	            	
	            	dto.setBrand(rs.getString(2));
	            	
	            	dto.setModelName(rs.getString(3));
	            	
	            	dto.setDealNum(rs.getInt(4));
	
	            	dto.setMid(rs.getString(5));
	
	            	dto.setQuantity(rs.getInt(6));
	            	
	            	dto.setPrice(rs.getInt(7));
	            	
	            	dto.setDeliverPrice(rs.getInt(8));
	            	
	            	dto.setSaveMoney(rs.getInt(9));
	
	            	dto.setDealDate(rs.getDate(10).toString());// 날짜를 스트링으로 받기 위해 toString을 사용
	
	            	
	            	v.add(dto);

            	
            	}
        
        }catch(Exception e){
            e.printStackTrace();
        }
        return v;
		
    }
    
  // 가이거 브랜드에 대한 통계
  public Vector<SalesManagerDTO> getBrandGiger(String mStart, String mEnd){
    	
        //리턴타입 선언
    	Vector<SalesManagerDTO> v =new Vector<SalesManagerDTO>();

        getCon();

        try{
        	   
            //쿼리준비
           	String sql = " select quantity, price from deal, product "+
           			"where deal.pid = product.id and brand = '가이거' and dealdate BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD')";
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);


           pstmt.setString(1, mStart);
           pstmt.setString(2, mEnd);


           //쿼리 실행후 결과를 리턴
           rs = pstmt.executeQuery();

            while(rs.next()){

            	
	            	SalesManagerDTO dto = new SalesManagerDTO();
	                      		
	            	dto.setQuantity(rs.getInt(1));
	            	
	            	dto.setPrice(rs.getInt(2));
	            	
            	v.add(dto);

            	
            	}
        
        }catch(Exception e){
            e.printStackTrace();
        }
        return v;
		
    }


  
}

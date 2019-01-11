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
    public Vector<SalesManagerDTO> getMonthDeal(String month){
    	
        //리턴타입 선언
    	Vector<SalesManagerDTO> v =new Vector<SalesManagerDTO>();

        getCon();

        try{
        	
        	if(month.equals("01")){
            //쿼리준비
           	String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
           			"from deal, product\r\n" + 
           			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-01-01', 'YYYY-MM-DD') AND TO_DATE('2019-01-31', 'YYYY-MM-DD')";
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);
        	}else if(month.equals("02")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-02-01', 'YYYY-MM-DD') AND TO_DATE('2019-02-28', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("03")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-03-01', 'YYYY-MM-DD') AND TO_DATE('2019-03-31', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("04")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-04-01', 'YYYY-MM-DD') AND TO_DATE('2019-04-30', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("05")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-05-01', 'YYYY-MM-DD') AND TO_DATE('2019-05-31', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("06")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-06-01', 'YYYY-MM-DD') AND TO_DATE('2019-06-30', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("07")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-07-01', 'YYYY-MM-DD') AND TO_DATE('2019-07-31', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("08")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-08-01', 'YYYY-MM-DD') AND TO_DATE('2019-08-30', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("09")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-09-01', 'YYYY-MM-DD') AND TO_DATE('2019-09-30', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("10")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-10-01', 'YYYY-MM-DD') AND TO_DATE('2019-10-31', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("11")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-11-01', 'YYYY-MM-DD') AND TO_DATE('2019-11-30', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}else if(month.equals("12")) {
        		String sql = " select imgaddr, brand, modelname, num, mid, quantity, price, deliverprice, savemoney, dealdate \r\n" + 
               			"from deal, product\r\n" + 
               			"where deal.pid = product.id and dealdate BETWEEN TO_DATE('2019-12-01', 'YYYY-MM-DD') AND TO_DATE('2019-12-31', 'YYYY-MM-DD') ";
                //쿼리실행객체
                pstmt=con.prepareStatement(sql);
        	}
        	
            
            rs = pstmt.executeQuery();

//            pstmt.setString(1, month);
//            pstmt.setString(2, month);


            //쿼리 실행후 결과를 리턴
            
            System.out.println(month);
            
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

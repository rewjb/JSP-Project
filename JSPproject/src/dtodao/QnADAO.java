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
			// �쇅遺��뿉�꽌 �뜲�씠�꽣瑜� �씫�뼱�뱾�뼱�빞 �븯湲곗뿉
			Context initContext = new InitialContext();
			// �넱耳� �꽌踰꾩뿉 �젙蹂대�� �떞�븘�넃�� 怨좎쑝濡� �씠�룞
			Context envContext = (Context) initContext.lookup("java:comp/env/");
			// �뜲�씠�꽣 �냼�뒪 媛앹껜瑜� �꽑�뼵
			DataSource ds = (DataSource) envContext.lookup("jdbc/orcl");
			// �뜲�씠�꽣 �냼�뒪瑜� 湲곗��쑝濡� 而ㅻ꽖�뀡�쓣 �뿰寃고빐二쇱떆�삤
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
    public void insertQnA(QnADTO dto) {
    	
    	//dto�뿉�꽌 �꽆�뼱�삤�옄 �븡�븯�뜕 �뜲�씠�꽣瑜� 珥덇퀬�쉶 �빐二쇱뼱�빞 �븳�떎.
    			
		getCon();
		
		 //鍮덊겢�옒�뒪�뿉 �꽆�뼱�삤吏� �븡�븯�뜕 �뜲�씠�꽣�뱾�쓣 珥덇린�솕 �빐二쇱뼱�빞 �빀�땲�떎.
        int ref=0; //湲�洹몃９�쓣 �쓽誘� = 荑쇰━瑜� �떎�뻾�떆耳쒖꽌 媛��옣�겙 ref 媛믪쓣 �옄�졇�삩 �썑  +1�쓣 �뜑�빐二쇰㈃�맖
        int re_step=1; //�깉湲��씠湲곗뿉 = 遺�紐④�
        int re_level=1;
        int checkTrue = 0;
       
		
		try {
			//媛��옣 �겙 ref媛믪쓣 �씫�뼱�삤�뒗 荑쇰━ 以�鍮�
            String refsql ="select max(ref) from qnaboard ";
            
           //荑쇰━�떎�뻾 媛앹껜 
            pstmt =con.prepareStatement(refsql);


            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	ref = rs.getInt(1)+1;
            }
            
    
            
			String sql = " insert into qnaboard values(qna_seq.NEXTVAL,?,?,?,?,?,?,sysdate,?)";
			
			pstmt = con.prepareStatement(sql);
			// ?�뿉 媛믪쓣 留듯븨
			pstmt.setString(1, dto.getPid());
			
			pstmt.setString(2, dto.getMid());

			pstmt.setString(3, dto.getContent());
			
			pstmt.setInt(4, ref);

			pstmt.setInt(5, re_step);

			pstmt.setInt(6, re_level);

			pstmt.setInt(7, checkTrue);
			

			pstmt.executeUpdate();

			// 荑쇰━瑜� �떎�뻾�븯�떆�삤
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// �옄�썝 諛섎궔
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
				// 荑쇰━ 以�鍮�
				String sql ="select *  from (select A.* , Rownum Rnum from (select * from qnaboard where pid=? order by ref desc,re_step asc ) A ) "
	                    + " where Rnum >= ? and Rnum <= ?";
				
			
				// 荑쇰━瑜� �떎�뻾�븷媛앹껜 �꽑�뼵
				pstmt = con.prepareStatement(sql);
				// 荑쇰━�떎�뻾 �썑 寃곌낵 ���옣
	            pstmt.setString(1, pid);
	            pstmt.setInt(2, start);
	            pstmt.setInt(3, end);
				rs = pstmt.executeQuery();
				
				// �뜲�씠�꽣 媛쒖닔媛� 紐뉕컻�씤吏� 紐⑤Ⅴ湲곗뿉 諛섎났臾몄쓣 �씠�슜�븯�뿬 �뜲�씠�꽣瑜� 異붿텧
				while (rs.next()) {
					// �뜲�씠�꽣瑜� �뙣�궎吏�( 媛�諛� = Board2bean �겢�옒�뒪瑜� �씠�슜)�빐以�
	
					QnADTO dto = new QnADTO();
	
					dto.setNum(rs.getInt("num"));
	
					dto.setPid(rs.getString("pid"));
	
					dto.setMid(rs.getString("mid"));
						
					dto.setContent(rs.getString("content"));
										
					dto.setRef(rs.getInt(5));
					
					dto.setRe_step(rs.getInt(6));
					
					dto.setRe_level(rs.getInt(7));

					dto.setReg_date(rs.getDate("reg_date").toString());// �궇吏쒕�� �뒪�듃留곸쑝濡� 諛쏄린 �쐞�빐 toString�쓣 �궗�슜
					
					dto.setCheckTrue(rs.getInt(9));
	
					// �뙣�궎吏뺥븳 �뜲�씠�꽣瑜� 踰≫꽣�뿉 ���옣
					v.add(dto);
				}
	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					// �옄�썝 諛섎궔
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

	//�빐�떦 �젣�뭹�쓽 �쟾泥� 湲��쓽 媛��닔瑜� 由ы꽩�븯�뒗 硫붿냼�뱶
	public int getAllPidCount(String pid){
	    getCon();
	    //寃뚯떆湲� �쟾泥댁닔瑜� ���옣�븯�뒗 蹂��닔
	    int count =0;
	    try{
	        //荑쇰━以�鍮�
	        String sql ="select count(*) from qnaboard where pid = ?";
	        //荑쇰━瑜� �떎�뻾�븷 媛앹껜 �꽑�뼵
	        pstmt = con.prepareStatement(sql);
	        //荑쇰━ �떎�뻾 �썑 寃곌낵瑜� 由ы꽩
	        pstmt.setString(1, pid);
	        
	        rs=pstmt.executeQuery();
	        
	        if(rs.next()){
	        	
	        	//�젨泥� 寃뚯떆湲��쓽 �닔
	            count =rs.getInt(1);
	        }
	        con.close();
	    }catch(Exception e){
	        e.printStackTrace();
	    }
	    return count;
	}
	
	  //�떟蹂�湲��씠 ���옣�릺�뒗 硫붿냼�뱶
	
    public void reInsertQnA(QnADTO dto){
        //遺�紐④� 洹몃９怨� 湲��젅踰� 湲��뒪�뀦�쓣 �씫�뼱�뱶由�
    	
        int ref= dto.getRef();
        int re_step= dto.getRe_step();
        int re_level= dto.getRe_level();
         
   
        getCon();
         
        try{
            ////////////// �빑�떖 肄붾뱶   ////////////////
            //1.遺�紐� 湲�蹂대떎 �겙 re_level �쓽 媛믪쓣 �쟾遺� 1�뵫 利앷��떆耳쒖쨲
            String levelsql= "update qnaboard set re_level = re_level+1 where ref=? and re_level > ?";
            //荑쇰━�떎�뻾媛앹껜 �꽑�뼵
            pstmt=con.prepareStatement(levelsql);
            pstmt.setInt(1, ref);
            pstmt.setInt(2, re_level);
            //荑쇰━�떎�뻾
            pstmt.executeUpdate();
            //�떟蹂�湲� �뜲�씠�꽣瑜� ���옣
            String sql ="insert into qnaboard values(qna_seq.NEXTVAL, ? ,? , ?, ?, ?, ?,sysdate,0)";
            pstmt =con.prepareStatement(sql);
            //?�뿉 媛믪쓣 ���엯
            pstmt.setString(1, dto.getPid());
            pstmt.setString(2, dto.getMid());
            pstmt.setString(3, dto.getContent());
            pstmt.setInt(4, ref); // �썝�옒 湲��쓽 �떟湲��씠湲� �븣臾몄뿉 �썝�옒湲��쓽 ref媛믪쓣 �꽔�뼱以�
            pstmt.setInt(5, re_step+1); //�떟湲��씠湲곗뿉 �썝�옒 湲��쓽 re_step�뿉 1�쓣 �뜑�빐以�
            pstmt.setInt(6, re_level+1);

            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
  //qnaboardl에서 관리자 답변글을 리넡하는 메소드
    public QnADTO getOnARoot(int ref){
        //리턴타입 선언
    	QnADTO dto =new QnADTO();
        getCon();
         
        try{
                    
            //쿼리준비
            String sql ="select * from qnaboard where mid='root' and ref=? ";
            //쿼리실행객체
            pstmt=con.prepareStatement(sql);
            pstmt.setInt(1, ref);
            //쿼리 실행후 결과를 리턴
            rs=pstmt.executeQuery();
            if(rs.next()){
            	dto.setNum(rs.getInt("num"));
            	dto.setPid(rs.getString("pid"));
            	dto.setMid(rs.getString("mid"));
            	dto.setContent(rs.getString("content"));
            	dto.setRef(rs.getInt("ref"));
            	dto.setRe_step(rs.getInt("RE_STEP"));
            	dto.setRe_level(rs.getInt("RE_LEVEL"));
            	dto.setReg_date(rs.getDate("REG_DATE").toString());
            	dto.setCheckTrue(rs.getInt("checktrue"));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return dto;
    }


}

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dtodao.QnADTO"%>
<%@page import="java.util.Vector"%>
<%@page import="dtodao.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    /* p 태그 안의 긴 내용을 감추주는 css*/
    p {
	  overflow: hidden; 
	  text-overflow: ellipsis;
	  white-space: nowrap; 
	  width: 200px;
	  height: 20px;
	}   
    </style>
    
	
        <div class="col-xs-12 col-sm-10" >
  			<div class="jumbotron">         
				    <%
         				    										int prev; //이전
         				             				    			int next; //다음
         				             				    			//화면에 보여질 게시글의 개수를 지정
         				             				    			int pageSize=5;
         				             				    			//현재 카운터를 클릭한 번호값을 읽어옴
         				             				    			String pageNum = request.getParameter("pageNum");
         				             				    			String pid = request.getParameter("pid");
         				             				    			String mid = request.getParameter("mid");
         				             				    			System.out.print("qna pid : "+pid);

         				             				    			
         				             				    			
         				             				    			//만약 처음 productDetail.jsp를 클릭하거나 수정 삭제 등 다른 게시글에서 이 페이지로 넘어오면 pageNum값이 없기에 null 처리를 해줌
         				             				    			 if(pageNum==null){
         				             				    			     pageNum="1";
         				             				    			 }
         				             				    			 int count =0; //전체 글의 갯수를 저장하는 변수
         				             				    			 int number =0; //페이지 넘버링 변수
         				             				    			  
         				             				    			 //전체 보고자 하는 페이지숫자를 저장
         				             				    			 int currentPage =Integer.parseInt(pageNum);
         				             				    		
         				             				    			QnADAO qdao = new QnADAO();
         				             				    			
         				             				    			//전체 게시글의 갯수를 읽어드린 메소드 호출
         				             				    		    count = qdao.getAllPidCount(pid);
         				             				    		    
         				             				    		    //현재 페이지에 보여줄 시작 번호를 설정 = 데이터 베이스에서 불러올 시작번호
         				             				    		    int startRow =(currentPage-1) *pageSize+1;
         				             				    		    int endRow =currentPage * pageSize;
         				             				    		    
         				             				    			Vector<QnADTO> vec = qdao.getAllReview(pid, startRow, endRow);
         				             				    			
         				             				    			 //테이블에 표시할 번호를 지정
         				             				    		    number =count - (currentPage -1 ) * pageSize;
         				             				    			System.out.print("문의 : "+count);
         				             				    			
         				             				    		
         				             				    			/*  Date now = new Date();
         				             				    			 SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
         				             				    			 
         				             				    			 String today = sf.format(now); */
         				             				    		
         				    %>
         				    
    <!-- 리뷰 상세보기시 회원 비회원 체크-->																         
	<script>
	function checkLog(){
		<%if(session.getAttribute("mid") == null){%>
			alert("로그인 사용자만  상세리뷰를 볼 수 있습니다.");
			document.location.href="productdetail2.jsp?center=QnATotal.jsp&pid=<%=pid%>";
		<%}%>			
	}
	</script>
				
													<!--리뷰 리스트의 시작-->
				
													<table class="table table-list-search">
														<thead>
															<tr>
																<th width="15%">글번호</th>
																<th width="15%">아이디</th>
																<th width="50%">내용</th>
																<th width="20%">날짜</th>
															</tr>
														</thead>
														<tbody>
															<%
																for (int i = 0; i < vec.size(); i++) {
																//벡터에 저장되어 있는 빈클래스를 하나씩 추출
																QnADTO dto = vec.get(i);
															%>
															<tr>
																<td><span style="FONT-SIZE: 12pt"><%=number--%></span></td>
																<td><span style="FONT-SIZE: 12pt"><%=dto.getMid()%></span></td>
																<td>
																<span style="FONT-SIZE: 11pt;" >
																<!-- 모달기능을 이용하여 리뷰 내용이 버튼으로 안으로 들어가게  만듬 -->
																
																<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target="#<%=dto.getNum()%>">

																  <p align="left">
																  	    <%
															                if(dto.getRe_step() >1){
															                    for(int j =0; j<(dto.getRe_step()*5); j++){
															            %>
															                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															            <%                       
															                    }
															                }       
															            %>
																  <%=dto.getContent()%>
																  
																  </p>
																</button>
																</span>	
																	<div class="modal fade" id="<%=dto.getNum()%>" tabindex="-1"
																		role="dialog" aria-labelledby="exampleModalLongTitle"
																		aria-hidden="true">	
																		<div class="modal-dialog" role="document">
																		
																		 <form action="QnAReInsert.jsp">
																			<div class="modal-content" style="width: 600px;">
																				<div class="modal-header">
																					<h5 class="modal-title" id="exampleModalLongTitle">문의 상세보기</h5><br>
																					<button type="button" class="close" data-dismiss="modal"
																						aria-label="Close">
																						<span aria-hidden="true"></span>
																					</button>
																				</div>
																				<!--모달 바디에 세뷰 리뷰 내용 출력-->
																				
																				<div class="modal-body">
																					
																					 <table>
																				        <tr>
																				            <th width="300px">작성일</th>
																				            <td width="500px" style="font-size: 12pt;"><%=dto.getReg_date()%></td>
																				        </tr>
																				        <tr>
																				            <th width="300px">글번호</th>
																				            <td width="500px" style="font-size: 12pt;"><%=dto.getNum()%></td>
																				        </tr>
																				        <tr>

																				            <th width="300px">작성자</th>
																				            <td width="500px" style="font-size: 12pt;"><%=dto.getMid()%></td>
																				        </tr>
																				           
																				        <tr>
																				            <th width="300px">제품번호</th>
																				            <td width="500px" style="font-size: 12pt;"><%= dto.getPid() %></td>
																				        </tr>
																				         
																				         
																				        <tr>
																				            <th width="300px" >글 내용</th>
																				            <td width="1000px" style="font-size: 12pt;"><%= dto.getContent()%></td>
																				        </tr>
																				        <tr>
																				            <th width="1000px"><button type="button" class="btn btn-warning" id="radmin">관리자답변</button></th>
																				            <td><textarea rows="3" cols="40" style="font-size: 10pt;" name="content" id="adminContent" readonly="" ></textarea></td>
																				  
																				        </tr>
																				            
																				        </table>
																				       

																				</div>
																				<div class="modal-footer">																		 
																					
																					<input type="hidden" name="num" value="<%=dto.getNum()%>">
																					<input type="hidden" name="pid" value="<%=dto.getPid()%>">
																					<input type="hidden" name="mid" value="<%=dto.getMid()%>">
																					<input type="hidden" name="ref"  value="<%= dto.getRef() %>">
																                    <input type="hidden" name="ref_step"  value="<%= dto.getRe_step() %>">
																                    <input type="hidden" name="ref_level"  value="<%= dto.getRe_level() %>">
																					<input type="hidden" name="content">
																					<button type="submit" class="btn btn-secondary" id="radmin3" style="position: relative; right: 168px;bottom: 70px;">답변완료</button>
																					<button type="button" class="btn btn-primary" style="position: relative; right: 280px;">내 문의 수정</button>																					
																					<button type="submit" class="btn btn-primary" style="position: relative; right: 275px;"> 수정 완료</button>																					
																					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
																					<script type="text/javascript"> 
																					$(document).ready(function() { 
																						$("#radmin2").click(function(){ 
																							$("#adminContent").attr("readonly",true).attr("disabled",false);  }); 
																						$("#radmin").click(function(){ 
																							$("#adminContent").attr("readonly",false).attr("disabled",false);  });
																						});
														
																					
																					</script>
																				</div>
																			</div>
																			</form>
																		</div>
																	</div>															
																</td>
																<td>
																<span style="FONT-SIZE: 12pt"><%=dto.getReg_date()%></span></td>
																<%
																 }
																%>
															</tr>
														</tbody>
													</table>
													
																		<!-- 페이지 카우터링 소스를 작성 -->
													<%
														if(count  >0){
															         
														int pageCount =count /pageSize + (count%pageSize == 0 ?  0 :1) ; //카우터링 숫자를 얼마까지 보여줄건지 결정
															         
														//시작 페이지 숫자를 설정
														int startPage =1;
															         
														if(currentPage %10 !=0){
														startPage =(int)(currentPage/10)*10+1;
														 }else{
															startPage =((int)(currentPage/10)-1)*10+1;
														}
															         
														int pageBlock=10;//카운터링 처리 숫자
														 int endPage =startPage+pageBlock-1;//화면에 보여질 페이지의 마지막 숫자
														if(endPage > pageCount) endPage =pageCount;
														%>
													<nav style=" position: relative; left: 300px;">
													  <ul class="pagination pagination-xs">
													    <li>
													    	<%       
																//이전이라는 링크를 만들건지 파악
																if(startPage >10){
																prev =startPage-10;       
															%>
													      <a href="productDetail2.jsp?center=QnATotal.jsp?pageNum=<%=prev%>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
													    </li>
													    <%
													    	}
															 //페이징 처리
															 for(int i=startPage; i<=endPage; i++){
															System.out.println("성공"); 
														%>
													    <li<% if(i == startRow );%>><a class="page-link" href="productDetail2.jsp?center=QnATotal.jsp?pageNum=<%=i%>&pid=<%=pid%>"><%=i%></a></li>
													    <%        
														     }    
														     //다음 이라는 링크를 만들건지 파악
														     if(endPage < pageCount){
														    	 next=startPage+10;
														  %>  
													    <li>
													      <a href="productDetail2.jsp?center=QnATotal.jsp?pageNum=<%=next%>" aria-label="Next">
													        <span aria-hidden="true">&raquo;</span>
													        <%
																     }
														}
													        %>
													      </a>
													    </li>
													  </ul>
													</nav>
	          			</div>
        </div><!--/.col-xs-12.col-sm-9-->
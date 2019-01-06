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
    
    <!-- 리뷰 상세보기시 회원 비회원 체크-->
   <script>
	function checkLog(){
		<%if(session.getAttribute("mid") == null){%>
			alert("로그인 사용자만  상세리뷰를 볼 수 있습니다.");
			document.location.href="productdetail2.jsp?center2=QnATotal.jsp";
		<%}%>			
	}
	</script>
	
        <div class="col-xs-12 col-sm-10" >
  			<div class="jumbotron">         
				    <%
         				    	int prev; //이전
         				             				    			int next; //다음
         				             				    			//화면에 보여질 게시글의 개수를 지정
         				             				    			int pageSize=5;
         				             				    			//현재 카운터를 클릭한 번호값을 읽어옴
         				             				    			String pageNum = request.getParameter("pageNum");
         				             				    			String pid = request.getParameter("id");
         				             				    			String mid = request.getParameter("session.getAttribute('id')");
         				             				    			
         				             				    			// 평점과 비교해서 별모양을 그려주기 위한 변수
         				             				    			String gradeNum1 = "1";
         				             				    			String gradeNum2 = "2";
         				             				    			String gradeNum3 = "3";
         				             				    			String gradeNum4 = "4";
         				             				    			String gradeNum5 = "5";
         				             				    			
         				             				    			if(pid == null){
         				             				    				pid = "ffff2124";
         				             				    			}
         				             				     				if(mid == null){
         				             				    				mid= "min";
         				             				    			} 
         				             				    			
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
         				             				    		    count =qdao.getAllPidCount(pid);
         				             				    			
         				             				    		    //현재 페이지에 보여줄 시작 번호를 설정 = 데이터 베이스에서 불러올 시작번호
         				             				    		    int startRow =(currentPage-1) *pageSize+1;
         				             				    		    int endRow =currentPage * pageSize;
         				             				    		    
         				             				    			Vector<QnADTO> vec = qdao.getAllReview(pid, startRow, endRow);
         				             				    			
         				             				    			 //테이블에 표시할 번호를 지정
         				             				    		    number =count - (currentPage -1 ) * pageSize;
         				             				    			System.out.print(count);
         				    %>
				
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
																  <p align="left"><%=dto.getContent()%></p>
																</button>
																</span>	
																	<div class="modal fade" id="<%=dto.getNum()%>" tabindex="-1"
																		role="dialog" aria-labelledby="exampleModalLongTitle"
																		aria-hidden="true">	
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="exampleModalLongTitle">문의 상세보기</h5>
																					<button type="button" class="close" data-dismiss="modal"
																						aria-label="Close">
																						<span aria-hidden="true"></span>
																					</button>
																				</div>
																				<!--모달 바디에 세뷰 리뷰 내용 출력-->
																				
																				<div class="modal-body">
																					 <table>
																				        <tr>
																				            <th width="150">작성일</th>
																				            <td width="500"><%=dto.getReg_date()%></td>
																				        </tr>
																				        <tr>
																				            <th width="150">글번호</th>
																				            <td width="500"><%=dto.getNum()%></td>
																				        </tr>
																				        <tr>

																				            <th width="150">작성자</th>
																				            <td width="500"><%=dto.getMid()%></td>
																				        </tr>
																				           
																				        <tr>
																				            <th width="300">제품번호</th>
																				            <td width="500"><%= dto.getPid() %></td>
																				        </tr>
																				         
																				         
																				        <tr>
																				            <th width="150" >글 내용</th>
																				            <td width="1000"><%= dto.getContent()%></td>
																				        </tr>
																				        </table>

																				</div>
																				<div class="modal-footer">
																					<input type="button" class="btn btn-success"  value="답글 쓰기" 
																					onclick="location.href='BoardReWriteForm.jsp?num=<%=dto.getNum()%>&pid=<%="ffff2124"%>&ref=<%=dto.getRef()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'"> 
																					<h6>문의 수정과 삭제는 마이페이지 에서 하실 수 있습니다.</h6><br><br>
																					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
																				</div>
																			</div>
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
													      <a href="productdetail2.jsp?center2=QnATotal.jsp?pageNum=<%=prev%>" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
													    </li>
													    <%
													    	}
															 //페이징 처리
															 for(int i=startPage; i<=endPage; i++){
															System.out.println("성공"); 
														%>
													    <li<% if(i == startRow );%>><a class="page-link" href="productdetail2.jsp?center2=QnATotal.jsp?pageNum=<%=i%>"><%=i%></a></li>
													    <%        
														     }    
														     //다음 이라는 링크를 만들건지 파악
														     if(endPage < pageCount){
														    	 next=startPage+10;
														  %>  
													    <li>
													      <a href="productdetail2.jsp?center2=QnATotal.jsp?pageNum=<%=next%>" aria-label="Next">
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
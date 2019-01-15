
<%@page import="dtodao.QnADAO"%>
<%@page import="dtodao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");//한글지원
%>
<!-- 게시글 작성에 데이터를 한번에 읽어드림 -->

<jsp:useBean id="reviewbean" class="dtodao.ReviewDTO">
	<jsp:setProperty name="reviewbean" property="*"/>
</jsp:useBean>

<jsp:useBean id="qnadto" class="dtodao.QnADTO">
	<jsp:setProperty name="qnadto" property="*"/>
</jsp:useBean>

	<%
		String pid = request.getParameter("pid");
		String mid = request.getParameter("id");
		String grade = request.getParameter("grade");
		String content = request.getParameter("content");
		String radio = request.getParameter("customRadio");
		System.out.print(content);
		System.out.print(mid);
		
	%>
	
	<%if(radio == null || content == null){%>
	<script>
	    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
	    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
	</script>		<%}else{%>
		
		<%if(session.getAttribute("id") == null){%>
			<script>
		    alert("로그인된 사용자만 리뷰 및 문의 를 등록 할 수 있습니다.");
		    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
			</script>
		<%}else{%>
				
				<%if(radio.equals("리뷰") && content == null || radio.equals("리뷰") && grade == null){%>

					<script>
					    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
					    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
					</script>
		
				<%}else if(radio.equals("리뷰") && content != null && radio.equals("리뷰") && grade != null){ 
						
						//데이터 베이스 쪽으로 변경클래스를 넘겨줌
						     ReviewDAO rdao = new ReviewDAO();
						   
						      //데이커 저장 메소드를 호출
						   	 rdao.insertReview(reviewbean);
						   
						      //게시글저장후 전체게시글 보기
						      response.sendRedirect("productDetail2.jsp?reviewTotal.jsp&pid="+pid);	
				}else{
				%>
								
				<script>
					    alert("알 수 없는 오류가 발생했습니다.");
					    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
				</script>
				<%
				}
				%>
					
				<%if(radio.equals("문의") && content == null){%>
						
					<script>
					    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
					    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
					</script>
			
				<%}else if(radio.equals("문의") && content != null) {
							
						
							//데이터 베이스 쪽으로 변경클래스를 넘겨줌
							  QnADAO qdao = new QnADAO();
							   
							 //데이커 저장 메소드를 호출
							   qdao.insertQnA(qnadto);
							      
							 response.sendRedirect("productDetail2.jsp?QnATotal.jsp&pid="+pid);
							 
				}else{
				%>
				<script>
					    alert("알 수 없는 오류가 발생했습니다. 다시 등록해주세요");
					    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
				</script>	
				
					
			 <%}%>
				
				
		<%}%>
				
			
	<%}%>
			

	
			
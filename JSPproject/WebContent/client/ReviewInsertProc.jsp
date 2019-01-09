
<%@page import="dtodao.QnADAO"%>
<%@page import="dtodao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("UTF-8");//한글지원
%>
<!-- 게시글 작성에 데이터를 한번에 읽어드림 -->

<jsp:useBean id="reviewbean" class="dtodao.ReviewBean">
	<jsp:setProperty name="reviewbean" property="*"/>
</jsp:useBean>

<jsp:useBean id="qnadto" class="dtodao.QnADTO">
	<jsp:setProperty name="qnadto" property="*"/>
</jsp:useBean>

	<%
		String pid = request.getParameter("pid");
		String mid = request.getParameter("mid");
		String grade = request.getParameter("grade");
		String content = request.getParameter("content");
		String radio = request.getParameter("customRadio");
		System.out.println(radio);		
	%>
	<%	
	if(radio == null || content == null || grade == null){
	%>
	<script>
	    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
	    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
	</script>
		
	<% 
	}else if(session.getAttribute("mid") == null){			
	%>
 	<script>
	    alert("로그인된 사용자만 리뷰를 등록 할 수 있습니다.");
	    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
	</script>
	<%
		
	} else if(radio.equals("리뷰") && content == null || grade == null){
	%>
		<script>
		    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
		    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
		</script>
		
	<%		
	 }else if (radio.equals("리뷰") && content != null && grade != null){
	%>
	<%
	
	 	//데이터 베이스 쪽으로 변경클래스를 넘겨줌
	     ReviewDAO rdao = new ReviewDAO();
	   
	      //데이커 저장 메소드를 호출
	   	 rdao.insertReview(reviewbean);
	   
	      //게시글저장후 전체게시글 보기
	      response.sendRedirect("productDetail2.jsp?reviewTotal.jsp&pid="+pid);
	
	%>
	<%
	}else{	
	%>
		<script>
		    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
		    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
		</script>
		
	<%
	}
	%>
	<%
	 if(radio.equals("문의") && content == null) {
	%>
		<script>
		    alert("글을 등록하기 위해선 문의등록과 리뷰 등록 선택을 반드시 선택해주시고, 리뷰는 별점과 내용이 문의는 내용이 꼭 들어가야 합니다.");
		    document.location.href='productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>';
		</script>
	<%
	}else if(radio.equals("문의") && content != null){
	%>
	<%
		//데이터 베이스 쪽으로 변경클래스를 넘겨줌
		  QnADAO qdao = new QnADAO();
		   
		 //데이커 저장 메소드를 호출
		    qdao.insertQnA2(qnadto);
		      
		   	response.sendRedirect("productDetail2.jsp?QnATotal.jsp&pid="+pid);
	
	%>
	<%
	
		}
	%>
		   	


	

	 
	
   
	
	

		
	
	 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
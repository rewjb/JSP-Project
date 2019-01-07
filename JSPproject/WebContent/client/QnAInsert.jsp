<%@page import="dtodao.QnADAO"%>
<%@page import="dtodao.QnADTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");//한글지원
%>
	<!-- 게시글 작성에 데이터를 한번에 읽어드림 -->
	
	<jsp:useBean id="qnadto" class="dtodao.QnADTO">
		<jsp:setProperty name="qnadto" property="*"/>
	</jsp:useBean>


	<%	
	 	//데이터 베이스 쪽으로 변경클래스를 넘겨줌
	     QnADAO qdao = new QnADAO();
	   
	      //데이커 저장 메소드를 호출
	   	 qdao.insertQnA(qnadto);
	   
	      //게시글저장후 전체게시글 보기
	      response.sendRedirect("productDetail2.jsp?center2=QnATotal.jsp");
	 %>
	 
 <% System.out.print("문의글등록 성공"); %>

</body>
</html>
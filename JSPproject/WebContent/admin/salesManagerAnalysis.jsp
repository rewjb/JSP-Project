<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출관리</title>
</head>
<body>

<%
	String month = request.getParameter("month");
	System.out.println(month+"월");
	
/* 	//데이터 베이스 쪽으로 변경클래스를 넘겨줌
	  QnADAO qdao = new QnADAO();
	   
	 //데이커 저장 메소드를 호출
	   qdao.insertQnA(qnadto); */
	      
	 response.sendRedirect("salesManager.jsp");
%>



</body>
</html>
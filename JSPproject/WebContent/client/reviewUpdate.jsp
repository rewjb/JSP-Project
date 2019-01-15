<%@page import="dtodao.ReviewDAO"%>
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
	String date = request.getParameter("date");
	int num = Integer.parseInt(request.getParameter("num"));
	String id= request.getParameter("mid");
	String pid= request.getParameter("pid");
	String grade = request.getParameter("grade");	
	String content = request.getParameter("content");
%>

<jsp:useBean id="reviewdto" class="dtodao.ReviewDTO">
  <jsp:setProperty name="reviewdto" property="*" />
</jsp:useBean>

<%
ReviewDAO rdao = new ReviewDAO();

reviewdto.setNum(num);
reviewdto.setContent(content);

rdao.updateReview(reviewdto);
%>
<script>
    alert("회원정보  수정이 완료 되었습니다.");
    location.href="/JSPproject/client/productDetail2.jsp?reviewTotal.jsp&pid=<%=pid%>";
</script>
</body>
</html>
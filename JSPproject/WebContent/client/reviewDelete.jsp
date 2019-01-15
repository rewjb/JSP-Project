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

<jsp:include page="Top.jsp"></jsp:include>

<%
 String id = request.getParameter("mid");
 String pid = request.getParameter("pid");
 int num = Integer.parseInt(request.getParameter("num"));
%>

<%

 if( id.equals(session.getAttribute("id"))){
	 
	 ReviewDAO rdao = new ReviewDAO();
	 rdao.deleteReivew(id, num);
 }else{
%>
	 <script>
	    alert("본인의 글만  삭제할 수 있습니다.");
	    location.href="/JSPproject/client/productDetail2.jsp?reviewTotal.jsp&pid=<%=pid%>";
	</script>
<%
 }
%> 
 
<script>
    alert("리뷰 삭제가 완료 되었습니다.");
    location.href="/JSPproject/client/productDetail2.jsp?reviewTotal.jsp&pid=<%=pid%>";
</script>

</body>
</html>
<%@ page import="DTO_DAO.*"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><!--현재 페이지는 로그인을 담당하는 페이지입니다.(네이버 로그인 x)--></title>
</head>
<body>
   <%
          String id = request.getParameter("id");
          String pw = request.getParameter("pw");
          //form태를 통해 넘어온 아이디 비밀번호
          
          // MemberDAO memberDAO = new MemberDAO();
          //아이디 비밀번호 유효성 검사를 할 객체
          
   %>
   
   <%=id %>
   <%=pw %>








</body>
</html>
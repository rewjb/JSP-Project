<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dtodao.MemberDTO"%>
<%@ page import="dtodao.MemberDAO"%>
<jsp:useBean id="memberDTO" class="dtodao.MemberDTO"></jsp:useBean>
<jsp:setProperty name="memberDTO" property="*"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
  request.setCharacterEncoding("utf-8");
  MemberDAO.getInstance().updateMember(memberDTO);
%>

<%= memberDTO.getId()%>
<%= memberDTO.getAddr()%>



</body>
</html>
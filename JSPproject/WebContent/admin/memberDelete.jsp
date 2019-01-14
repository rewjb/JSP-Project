<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="dtodao.MemberDAO"%>
<%@page import="org.apache.catalina.tribes.Member"%>
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
 String id = request.getParameter("id");

 MemberDAO mdao = new MemberDAO();
 
 mdao.deleteMember(id);

%>
<script>
    alert("탈퇴처리가가 완료 되었습니다.");
    location.href="/JSPproject/admin/memberManager.jsp";
</script>

</body>
</html>
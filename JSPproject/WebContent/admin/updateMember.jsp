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
String mid = request.getParameter("mid");
String name = request.getParameter("name");
String pw = request.getParameter("pw");
String birthday = request.getParameter("birthday");
String tel = request.getParameter("tel");
String email = request.getParameter("email");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");


System.out.println(mid);
System.out.println(name);
System.out.println(pw);
System.out.println(birthday);
System.out.println(tel);
System.out.println(email);
System.out.println(addr1);
System.out.println(addr2);
%>

</body>
</html>
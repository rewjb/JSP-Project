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
	String date = request.getParameter("mtext1");
	String num = request.getParameter("mtext2");
	String pid = request.getParameter("mtext3");
	String mid = request.getParameter("mtext4");
	String grade = request.getParameter("grade");
	String content = request.getParameter("content");
	
	System.out.println(date);
	System.out.println(num);
	System.out.println(pid);
	System.out.println(mid);
	System.out.println(grade);
	System.out.println(content);

%>
</body>
</html>
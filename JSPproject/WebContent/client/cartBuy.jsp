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
   String mid = (String)session.getAttribute("id");
   String pid = (String)request.getParameter("pid");
   int quantity = Integer.parseInt(request.getParameter("quantity")); 
%>

<%= mid%>
<%= pid%>
<%= quantity%>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

int idx = 1;
String title = request.getParameter("title");
String time = request.getParameter("time");
String content = request.getParameter("content");
int count = 9999;


try {
String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:localhost:7777:XE";
Class.forName(driverName);
Connection con = DriverManager.getConnection(url,"system","1234");
Statement sm = con.createStatement();
String sql = "insert into test" + "(idx, title,	time, content )" + 
				"values("+2+", '"+title+"', '"+time+"', '"+content+"')";
sm.executeUpdate(sql);
con.close();
} catch (Exception e) {
	out.println("연결실패");
	out.println(e.getMessage());
	e.printStackTrace();
	} finally {
		out.print("<script>location.href='list.jsp';</script>");
	}
%>

</head>
<body>

</body>
</html>
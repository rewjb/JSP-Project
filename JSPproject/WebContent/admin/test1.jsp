<%@ page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content= "text/html" charset="UTF-8">
<title>게시판 내용을 보자용 </title>


</head>

<%
	String idx = request.getParameter("idx");

try{
    String driverName = "oracle.jdbc.driver.OracleDriver"; 
    
    String url = "jdbc:oracle:thin:@localhost:7777:XE";
	ResultSet rs = null;

	Class.forName(driverName);
	Connection con = DriverManager.getConnection(url, "system", "1234");
	out.println("Oracle DataBase Connection Success.");
	
	Statement stmt = con.createStatement();
	String sql = "SELECT * from test where idx = " + idx;
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
	
%>
<body>
	<h1>게시글 조회</h1>
	<table border ="1">
		<tr>
			<th>번호</th>
			<td><%=rs.getString("idx") %></td>
			<th>작성자</th>
			<td>관리자 </td>
			<th>날짜</th> 
			<td><%=rs.getString("time") %></td>
		</tr>
		<tr>
			<th colspan="2">제목</th>
			<td colspan="6"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
			<td colspan="6"><%=rs.getString("content") %></td>
		</tr>
	</table>

<%	
	}
	con.close();
}catch(Exception e){
	out.println("Oracle Database Connection Problem <hr>");
	out.println(e.getMessage());
	e.printStackTrace();
}
%>



</body>
</html>
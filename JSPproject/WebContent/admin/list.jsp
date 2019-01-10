<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.ProductDTO"%>
<%@ page import="dtodao.CartDAO"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="adminTop.jsp"></jsp:include>

<%

try {
String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:localhost:7777:XE";
ResultSet rs = null;
Class.forName(driverName);
Connection con = DriverManager.getConnection(url,"system","1234");

Statement sm = con.createStatement();
String sql = "select * from test order by idx desc";

rs = sm.executeQuery(sql);

 %>
</head>

	<h3>공지사항</h3>
<div class="table-responsive">
  <table class="table table-bordered" width="100%" cellspacing="0" style="text-align: center;">
																	<!-- 가운데정렬    -->
  <thead>
    <tr>
      <th scope="col" width="60" >번호</th>
      <th scope="col">작성자</th>
      <th scope="col" width="600">제목</th>
      <th scope="col">날짜</th>
    </tr>
  </thead>
  <tbody>
	
	<%
	while(rs.next()) {
		out.print("<tr>");
		out.print(("<td>") + rs.getString(1) + "</td>");
		out.print("<td>관리자</td>");
		out.print(("<td> <a href = 'content.jsp'>") + rs.getString(2) + "</a></td>");
		out.print(("<td>") + rs.getString(3) + "</td>");
		out.print("</tr>");
	}
	%>   

  </tbody>
</table>
	<a href="noticeWrite.jsp"><button type="button">글쓰기</button></a>
</div>

<% 
	con.close();
}catch (Exception e) {
	out.println("연결실패");
	out.println(e.getMessage());
	e.printStackTrace();
	}
%>

</body>
</html>


<!-- 3.숫자 증가-->
<!-- 4.content.jsp 5.delete.jsp  -->


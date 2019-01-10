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

String idx = request.getParameter("idx");

try {
String driverName = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:localhost:7777:XE";
Class.forName(driverName);
Connection con = DriverManager.getConnection(url,"system","1234");

ResultSet rs = null;

Statement sm = con.createStatement();
String sql = "select * from test where idx = " + idx;

rs = sm.executeQuery(sql);

while(rs.next()){

%>


</head>
<body>
	<h3>공지사항</h3>
<div class="table-responsive">
  <table class="table table-bordered" width="100%" cellspacing="0" style="text-align: center;">
																	<!-- 가운데정렬    -->
 
  <tr>
      <th scope="col" width="60" >번호</th>
      <td><%=rs.getString("idx") %></td>
      <th scope="col">작성자</th>
      <td>관리자</td>
      <th scope="col" width="600">제목</th>
      <td><%=rs.getString("title") %></td>
      <th scope="col">날짜</th>
  	  <td><%=rs.getString("time") %></td>
    </tr>
    <tbody>
	<tr>
		<th colspan="2">내용</th>
		<td colspan="6"><%= rs.getString("content") %></td>
	</tr>
	</tbody>
	</table>
	<a href="delete.jsp?idx=<%=rs.getString("idx") %>">게시글 삭제</a>
	<a href="list.jsp">목록</a>
	</div>



<%
}
	con.close();
}catch (Exception e) {
	out.println("연결실패11");
	out.println(e.getMessage());
	e.printStackTrace();
	}
%>

</body>
</html>


<!-- 3.숫자 증가-->
<!-- 4.content.jsp 5.delete.jsp  -->


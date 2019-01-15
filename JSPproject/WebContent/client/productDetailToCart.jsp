<%@page import="dtodao.CartDAO"%>
<%@page import="dtodao.ProductDetailDAO"%>
<%@page import="dtodao.ReviewDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="dtodao.ReviewDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<jsp:useBean id="cartdto" class="dtodao.CartDTO">
  <jsp:setProperty name="cartdto" property="*" />
</jsp:useBean>
s

<%

String mid = request.getParameter("mid");
String pid = request.getParameter("pid");
int quantity = Integer.parseInt(request.getParameter("amount"));

CartDAO cdao = new CartDAO();

cartdto.setMid(mid);
cartdto.setPid(pid);
cartdto.setQuantity(quantity);

System.out.println(mid);
System.out.println(pid);
System.out.println(quantity);

cdao.registerCart2(cartdto);
%>

<script>
    alert("장부구니에 추가되었습니다.");
    location.href="/JSPproject/client/productDetail2.jsp?pid=<%=pid%>";
</script>

</body>
</html>
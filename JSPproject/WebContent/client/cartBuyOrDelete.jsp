<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dtodao.CartDAO"%>
<%@ page import="dtodao.DealDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
	    if (session.getAttribute("id")==null) {
	    	
	    	out.println("<script>");

			out.println("alert('잘못된 접근입니다.');");
			
			out.println("location.href ='/JSPproject/index.jsp';");
			
			out.println("</script>");
			
			return;
	    	
	    }
	
		String mid = (String) session.getAttribute("id");
		String pid = (String) request.getParameter("pid");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String or = request.getParameter("or");

		if (or.equals("buy")) {
			
			DealDAO.getInstance().insertDealInfo(mid, pid, quantity);
			CartDAO.getInstance().deleteCart(pid, mid);
			
			out.println("<script>");

			out.println("alert('결제에 성공하셨습니다.');");
			
			out.println("location.href ='/JSPproject/client/privateCart.jsp';");

			
			out.println("</script>");

			
		}
		if (or.equals("cancel")) {
			
			out.println("<script>");

			out.println("alert('상품을 장바구니에서 삭제하셨습니다.');");
			
			out.println("location.href ='/JSPproject/client/privateCart.jsp';");

			
			out.println("</script>");
			
			CartDAO.getInstance().deleteCart(pid, mid);

		}


	%>





</body>
</html>
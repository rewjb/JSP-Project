<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dtodao.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String preUrl = request.getHeader("referer");

		if (preUrl == null) {

			out.println("<script>");

			out.println("alert('정상적인 접근이 아닙니다.');");

			out.println("location.href ='/JSPproject/index.jsp';");

			out.println("</script>");

		} else {

			if (preUrl.equals("http://localhost:9999/JSPproject/client/privateInfoForm.jsp")) {
				String id = (String) session.getAttribute("id");
				MemberDAO.getInstance().unjoinMember(id);
				session.removeAttribute("id");
				
				out.println("<script>");
				out.println("location.href ='/JSPproject/index.jsp';");

				out.println("</script>");
			} else {
				
				out.println("<script>");

				out.println("alert('정상적인 접근이 아닙니다.');");

				out.println("location.href ='/JSPproject/index.jsp';");

				out.println("</script>");
			}

		}
	%>


</body>
</html>
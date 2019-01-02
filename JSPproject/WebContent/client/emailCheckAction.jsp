<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dtodao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		if (request.getParameter("code") != null && session.getAttribute("code") != null) {
			

			if (((String)request.getParameter("code")).equals((String)session.getAttribute("code"))) {

				session.removeAttribute("code");

				MemberDAO memberDAO = new MemberDAO();

				memberDAO.joinMember((MemberDTO) session.getAttribute("tempUserInfo"));
				
				out.println("location.href='/JSPproject/index.jsp';");
				

			}
		} else {

			out.println("<script>");

			out.println("alert('회원가입 인증에 오류가 발생하였습니다.');");

			out.println("location.href='/JSPproject/index.jsp';");

			out.println("</script>");

		}
	%>




</body>
</html>
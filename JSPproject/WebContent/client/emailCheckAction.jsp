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
			
			out.println("값이 존재는 한다");

			
			if (((String)request.getParameter("code")).equals((String)session.getAttribute("code"))) {

				out.println("데이터에 들어 ?");
				session.removeAttribute("code");

				MemberDAO memberDAO = new MemberDAO();

				memberDAO.joinMember((MemberDTO) session.getAttribute("tempUserInfo"));
				

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
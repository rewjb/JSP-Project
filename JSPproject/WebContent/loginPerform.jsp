<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="dtodao.MemberDAO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//아이디 패스워드 받기

		String realPw = memberDAO.loginMember(id);
		//해당하는 아이디의 패스워드 얻어오기

		if (!(realPw == null)) {

			if (pw.equals(realPw)) {

				session.setAttribute("id", id);
				
				if(id.equals("root")){
					out.println("<script type=\"text/javascript\">");
					out.println("location.href=\"/JSPproject/admin/memberManager.jsp\";");
					out.println("</script>");
					
				}else{
					out.println("<script type=\"text/javascript\">");
					out.println("location.href=\"/JSPproject/index.jsp\";");
					out.println("</script>");
				}
				
		
				//다시 index 페이지로 이동
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('아이디 혹은 패스워드가 틀렸습니다.');");
				out.println("history.back();");
				out.println("</script>");
				//다시 index 페이지로 이동
			}

		} else {

			out.println("<script type=\"text/javascript\">");
			out.println("alert('아이디 혹은 패스워드가 틀렸습니다.');");
			out.println("history.back();");
			out.println("</script>");
			//다시 index 페이지로 이동

		} //패스워드 유효성 검사
	%>







</body>
</html>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>
<%@page import="dtodao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String mid = request.getParameter("mid");
String name = request.getParameter("name");
String pw = request.getParameter("pw");
String birthday = request.getParameter("birthday");
String tel = request.getParameter("tel");
String email = request.getParameter("email");
String addr1 = request.getParameter("addr1");
String addr2 = request.getParameter("addr2");

String addr = addr1+" "+addr2;

System.out.print(addr);

%>

<jsp:useBean id="memberdto" class="dtodao.MemberDTO">
  <jsp:setProperty name="memberdto" property="*" />
</jsp:useBean>

<%
MemberDAO mdao = new MemberDAO();

memberdto.setId(mid);
memberdto.setPw(pw);
memberdto.setName(name);
memberdto.setBirthDay(birthday);
memberdto.setTel(tel);
memberdto.setAddr(addr);
memberdto.setEmail(email);

mdao.updateMember(memberdto);
%>
<script>
    alert("회원정보  수정이 완료 되었습니다.");
    location.href="/JSPproject/admin/memberManager.jsp";
</script>

</body>
</html>
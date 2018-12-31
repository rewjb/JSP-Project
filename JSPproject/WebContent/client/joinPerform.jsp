<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dtodao.MemberDTO"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
   
   <%
   request.setCharacterEncoding("utf8");

   String id = request.getParameter("inputId");
   String pw = request.getParameter("reInputPw");
   String name = request.getParameter("InputName");
   String birthDay = request.getParameter("InputDate");
   String tel = request.getParameter("InputTel");
   String[] tempAddr = request.getParameterValues("InputAddr");
   String email = request.getParameter("InputEmail");
   
   String addr = "";
   
	for (int i = 0; i < tempAddr.length; i++) {
		addr +=  tempAddr[i];
	}
   
   
   
   MemberDTO dto = new MemberDTO();
   
   dto.setId(id);
   dto.setPw(pw);
   dto.setName(name);
   dto.setBirthDay(birthDay);
   dto.setTel(tel);
   dto.setAddr(addr);
   dto.setEmail(email);

    %>
    
    아이디 : <%=dto.getId()%><br>
  비밀번호 :   <%=dto.getPw()%><br>
  이름:  <%=dto.getName()%><br>
  생일 :   <%=dto.getBirthDay()%><br>
  전화번호 :   <%=dto.getTel()%><br>
  주소 :   <%=dto.getAddr()%><br>
  전화번호 <%=dto.getEmail()%>
    
</body>










</body>
</html>
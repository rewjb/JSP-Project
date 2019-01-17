<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dtodao.MemberDTO"%>
<%@page import="emialUtil.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="emialUtil.SHA256"%>
<%@page import="emialUtil.Mail"%>





<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<body>
   
   <%
      	MemberDTO userDTO = new MemberDTO();
         request.setCharacterEncoding("utf8");

         String id = request.getParameter("inputId");
         String pw = request.getParameter("reInputPw");
         String name = request.getParameter("InputName");
         String birthDay = request.getParameter("InputDate");
         String tel = request.getParameter("InputTel");
         String[] tempAddr = request.getParameterValues("InputAddr");
         String email = request.getParameter("InputEmail");
         
         String addr = "";
         // 모든 주소를 갖고 있는 문자열
         
      	for (int i = 0; i < tempAddr.length; i++) {
      		addr +=  tempAddr[i];
      	}
         
         
      	userDTO.setId(id);
      	userDTO.setPw(pw);
      	userDTO.setName(name);
      	userDTO.setBirthDay(birthDay);
      	userDTO.setTel(tel);
      	userDTO.setAddr(addr);
      	userDTO.setEmail(email);
      	
         
         session.setAttribute("code", SHA256.getSHA256(email));
         //암호 코드 세션에 저장
         session.setAttribute("tempUserInfo", userDTO);
         //회원가입을 시도하는 유저 정보 저장
         
         // 사용자에게 보낼 메시지를 기입합니다.

      	String host = "http://localhost:8080/JSPproject/";
          // 서버의 주소! 추후 변경해야 ㅎ
          
      	String from = "dbwnqls01@gmail.com";
          
      	String to = email;

      	String subject = "IT시계 사이트의 회원가입 인증을 해주세요.";

      	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요.<br>" +

      		"<a href='" + host + "client/emailCheckAction.jsp?code=" + session.getAttribute("code")+ "'>이메일 인증하기</a>";

      		// SMTP에 접속하기 위한 정보를 기입합니다.

      		Properties proper = new Properties();

      		proper.put("mail.smtp.user", from);

      		proper.put("mail.smtp.host", "smtp.googlemail.com");

      		proper.put("mail.smtp.port", "465");

      		proper.put("mail.smtp.starttls.enable", "true");

      		proper.put("mail.smtp.auth", "true");

      		proper.put("mail.smtp.debug", "true");

      		proper.put("mail.smtp.socketFactory.port", "465");

      		proper.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

      		proper.put("mail.smtp.socketFactory.fallback", "false");
      		
      		try{
      			
      			Authenticator auth = new Mail();

      		    Session ses = Session.getInstance(proper, auth);

      		    ses.setDebug(true);

      		    MimeMessage msg = new MimeMessage(ses); 

      		    msg.setSubject(subject);

      		    Address fromAddr = new InternetAddress(from);

      		    msg.setFrom(fromAddr);

      		    Address toAddr = new InternetAddress(to);

      		    msg.addRecipient(Message.RecipientType.TO, toAddr);

      		    msg.setContent(content, "text/html;charset=UTF-8");

      		    Transport.send(msg);
      		    
      	out.println("<script type=\"text/javascript\">");
      	
      	out.println("alert('이메일 인증을 해주세요.');");
      	
      	out.println("location.href='https://www." + email.split("@")[1] + "';");
      	
      	out.println("</script>");

      		} catch(Exception e){

      		    e.printStackTrace();

      	out.println("<script>");

      	out.println("alert('회원가입에 오류가 발생하였습니다.');");

      	out.println("history.back();");

      	out.println("</script>");


      		    return;

      		}
      %>
    
</body>










</body>
</html>
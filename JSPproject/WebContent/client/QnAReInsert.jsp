<%@page import="dtodao.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
    강좌와 다르게 html 요소는 제거를 했습니다.
    왜냐하면은 이 페이지에서는 프로세스 작업(데이터를 받고 Dao 를 통해 insert)을 하는 페이지이기 때문입니다.
 -->
 <%
    request.setCharacterEncoding("UTF-8");
 
 
 	String num = request.getParameter("num");
 	String pid = request.getParameter("pid");
 	String mid = request.getParameter("mid");
 	String ref = request.getParameter("ref");
 	String ref_step = request.getParameter("ref_step");
 	String ref_level = request.getParameter("ref_level");
 	
 	
 	String content = request.getParameter("content");
 	
 	
 	System.out.println(num);
 	System.out.println(pid);
 	System.out.println(mid);
 	System.out.println(ref);
 	System.out.println(ref_step);
 	System.out.println(ref_level);
 	
 	
  
 %>
<!--  데이터를 한번에 받아오는 빈클래스를 사용하도록 -->
<jsp:useBean id="qnadto" class="dtodao.QnADTO">
    <jsp:setProperty  name="qnadto"  property="*"/>
</jsp:useBean>
<%
    //데이터베이스 객체 생성
   	QnADAO qdao = new QnADAO();
	qdao.reInsertQnA(qnadto);
     
    //답변 데이터를 모두 저장후 전체 게시글 보기를 설정
    response.sendRedirect("productDetail2.jsp?center=QnATotal.jsp&pid="+pid+"&id="+mid);
%>
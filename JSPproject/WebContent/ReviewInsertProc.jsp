
<%@page import="models.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
    	request.setCharacterEncoding("UTF-8");//한글지원
    %>
<!-- 게시글 작성에 데이터를 한번에 읽어드림 -->

<jsp:useBean id="reviewbean" class="models.ReviewBean">
	<jsp:setProperty name="reviewbean" property="*"/>
</jsp:useBean>

<% System.out.print("성공3"); %>

<%

 	//데이터 베이스 쪽으로 변경클래스를 넘겨줌
     ReviewDAO rdao = new ReviewDAO();
   
      //데이커 저장 메소드를 호출
   	 rdao.insertReview(reviewbean);
   
      //게시글저장후 전체게시글 보기
      response.sendRedirect("productDetail.jsp");
 %>
 
 <% System.out.print("리뷰등록 성공"); %>
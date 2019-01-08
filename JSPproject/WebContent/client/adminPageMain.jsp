<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <jsp:include page="Top.jsp"></jsp:include>
  </head>
  
  <body>

  
 <%
    // Center 값을 변경해주기위해서 request 객체를 Center 값을 받아옴
    String center =request.getParameter("center");
    
    //처음 adminpage.jsp 를 실행하면 null값이 실행되기에 null 처를 해줌
    if(center == null){
        center ="adminPageSell.jsp";
    }
%>
  
<div class="container" style="position: relative; top: 200px;">
	<div class="row row-offcanvas row-offcanvas-left" >
	<!-- 리뷰 사이드바 -->
		 <jsp:include page="adminPageSideBar.jsp"/>
									         									         
		 <!-- 센터로 설정된 위치에  센터 값들을 뿌려줌 -->
		 <jsp:include page="<%=center %>" />
										         
									         	
	</div><!--/row-->

</div><!--/.container-->

 </body>
</html>
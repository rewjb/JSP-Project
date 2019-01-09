<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	String pid = request.getParameter("pid");
   		String mid = (String)session.getAttribute("id");
   		
   		System.out.println("사이드바pid"+pid);
   		System.out.println("사이드바mid"+mid);
    
    %>
        <div class="col-xs-6 col-xs-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group"> 
            <a style="FONT-SIZE: 10pt" href="productDetail2.jsp?center=reviewTotal.jsp&pid=<%=pid %>"
            class="list-group-item  ${ param.center=='reviewTotal.jsp'? 'active' : ''}">전체보기</a>
            <a style="FONT-SIZE: 10pt" href="productDetail2.jsp?center=reviewGradeList.jsp&pid=<%=pid %>"
            class="list-group-item ${ param.center=='reviewGradeList.jsp'? 'active' : ''}">평점순</a>
            <a style="FONT-SIZE: 10pt" href="productDetail2.jsp?center=reviewMyList.jsp&pid=<%=pid %>&mid=<%=mid %>"
             class="list-group-item ${ param.center=='reviewMyList.jsp'? 'active' : ''}">내글만보기</a>
            <a style="FONT-SIZE: 10pt" href="productDetail2.jsp?center=QnATotal.jsp&pid=<%=pid %>"
             class="list-group-item ${ param.center=='QnATotal.jsp'? 'active' : ''}">문의글보기</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
        
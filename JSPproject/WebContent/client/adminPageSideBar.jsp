<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String pid = request.getParameter("pid");
   		String mid = request.getParameter("mid");
   		
   		System.out.print("사이드바"+pid);
    
    %>
        <div class="col-xs-6 col-xs-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group"> 
            <a style="FONT-SIZE: 10pt" href="adminPage.jsp?center=adminPageSell.jsp"
            class="list-group-item  ${ param.center=='adminPageSell.jsp'? 'active' : ''}">판매그래프</a>           
            <a style="FONT-SIZE: 10pt" href="adminPage.jsp?center=adminPageSell.jsp"
            class="list-group-item  ${ param.center=='adminPageSell.jsp'? 'active' : ''}">판매그래프</a>           
            <a style="FONT-SIZE: 10pt" href="adminPage.jsp?center=adminPageSell.jsp"
            class="list-group-item  ${ param.center=='adminPageSell.jsp'? 'active' : ''}">판매그래프</a>           
            <a style="FONT-SIZE: 10pt" href="adminPage.jsp?center=adminPageSell.jsp"
            class="list-group-item  ${ param.center=='adminPageSell.jsp'? 'active' : ''}">판매그래프</a>           
            <a style="FONT-SIZE: 10pt" href="adminPage.jsp?center=adminPageSell.jsp"
            class="list-group-item  ${ param.center=='adminPageSell.jsp'? 'active' : ''}">판매그래프</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
        
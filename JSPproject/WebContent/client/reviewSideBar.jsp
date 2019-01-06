<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="col-xs-6 col-xs-3 sidebar-offcanvas" id="sidebar">
          <div class="list-group"> 
            <a style="FONT-SIZE: 10pt" href="productdetail2.jsp?center=reviewTotal.jsp"
            class="list-group-item  ${ param.center=='reviewTotal.jsp'? 'active' : ''}">전체보기</a>
            <a style="FONT-SIZE: 10pt" href="productdetail2.jsp?center=reviewGradeList.jsp"
            class="list-group-item ${ param.center=='reviewGradeList.jsp'? 'active' : ''}">평점순</a>
            <a style="FONT-SIZE: 10pt" href="productdetail2.jsp?center=reviewMyList.jsp"
             class="list-group-item ${ param.center=='reviewMyList.jsp'? 'active' : ''}">내글만보기</a>
          </div>
        </div><!--/.sidebar-offcanvas-->
        
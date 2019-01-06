<%@page import="dtodao.ReviewBean"%>
<%@page import="java.util.Vector"%>
<%@page import="dtodao.ReviewDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="Top.jsp"></jsp:include>

</head>
<body>
<body onload="init();">

<%
	String mid = request.getParameter("mid");

    // Center 값을 변경해주기위해서 request 객체를 Center 값을 받아옴
    String center =request.getParameter("center");
    String center2 =request.getParameter("center2");
    
    //처음 SessionMain.jsp 를 실행하면 null값이 실행되기에 null 처를 해줌
    if(center ==null || center2==null){
        center ="reviewTotal.jsp";
        center2 = "QnATotal.jsp";
    }
%>


	<!--디테일 페이지 시작-->
	
	
	<div style="margin: 0 auto;  width: 900px; position: relative; right: 370px; top:300px; " >
		<img src="../img/watch02.jpg" class="rounded float" alt="#" width="500"
			height="500" style="position: relative; left: 72px">


		<h2 style="width: 900px; position: relative; left: 650px; bottom: 450px;">[프리마
			클라쎄 PRIMA CLASSE]</h2>
		<br> <br>
		<table style="position: relative; left: 650px; bottom: 450px;">
			<tr>
				<td width="30%" height="50">판매가</td>

				<td>80000원</td>

			</tr>

			<tr>
				<td height="50">배송비</td>
				<td>3000원</td>
			</tr>
			<tr>
				<td height="50">적립금(3%)</td>
				<td>2400원</td>
			</tr>
			<tr>
				<td height="50">모델</td>
				<td>PC0013L03</td>
			</tr>
			<tr>
				<td height="50">구성품</td>
				<td>정품케이스+정품보증서+고급팔찌</td>
			</tr>

		</table>


		<form name="form" method="get" style="position: relative; left: 650px; bottom: 450px;">
			수량 : <input type=hidden name="sell_price" value="5500"> <input
				type="text" name="amount" value="1" size="3" onchange="change();">
			<input type="button" value=" + " onclick="add();"> <input
				type="button" value=" - " onclick="del();"><br> 금액 : <input
				type="text" name="sum" size="11" readonly>원 <br> <br>
			<br>
			<button type="button" class="btn btn-secondary" style="width: 400px;">카트추가</button>
		</form>

		
	</div>
	<hr style="max-width: 1100px; margin: 0 auto; border: double 4px lightgray;">


	<!-- 리뷰게시판과 문의게시판을 위한 탭 부분 -->
	<div style="margin: 0 auto; width: 900px; position: relative; top: 100px;">

		<ul class="tabs">
			<li><a href="#tab1">리뷰게시판</a></li>
			<li><a href="#tab2">문의게시판</a></li>
		</ul>

		<div class="tab_container">
			<div id="tab1" class="tab_content">
				<!-- 리뷰 등록 작성 부분 -->
				<div class="container">
					<div class="row">
						<div class="col-sm-4 col-md-4">
							<div class="panel panel-default"
								style="width: 835px; height: 600x;">
								<div class="panel-body">
									<form accept-charset="UTF-8" action="ReviewInsertProc.jsp"
										method="POST">
										<!--  별펑점을 위한 html-->
										<span class="star-input"
											style="position: relative; bottom: 25px;"> <span
											class="input"> <input type="radio" name="grade"
												value="1" id="p1"> <label for="p1">1</label> <input
												type="radio" name="grade" value="2" id="p2"> <label
												for="p2">2</label> <input type="radio" name="grade"
												value="3" id="p3"> <label for="p3">3</label> <input
												type="radio" name="grade" value="4" id="p4"> <label
												for="p4">4</label> <input type="radio" name="grade"
												value="5" id="p5"> <label for="p5">5</label>
										</span> <output for="star-input">
												<b>0</b>
											</output>
										</span>

										<textarea class="form-control counted" name="content"
											placeholder="320자 까지 입력 가능합니다." rows="5"
											style="margin-bottom: 10px; width: 800px; height: 130px;"></textarea>
										<h6 class="pull-right" id="counter"></h6>
										<input type="hidden" name="pid" value="ffff2124"> <input
											type="hidden" name="mid"
											value="<%=session.getAttribute("mid")%>">
										<button class="btn btn-info" type="submit">등록</button>
									</form>
									<hr style="width: 800px; border: double 4px lightgray; position: relative; right: 15px;">
						      
									    <div class="container">
									 
									       <div class="row row-offcanvas row-offcanvas-right" >
									        <!-- 리뷰 사이드바 -->
									        <jsp:include page="reviewSideBar.jsp"/>
									         
									         
									        <!-- 센터로 설정된 위치에  센터 값들을 뿌려줌 -->
									        <jsp:include page="<%=center %>" />
									         
									         
									      </div><!--/row-->
									     
									         
									 
									    </div><!--/.container-->

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
			<div id="tab2" class="tab_content">
			
			<!-- 문의게시판 등록 작성 부분 -->
					<div class="container">
						<div class="row">
							<div class="col-sm-4 col-md-4">
								<div class="panel panel-default" style="width: 835px; height: 700px;">
									<div class="panel-body">
										<form accept-charset="UTF-8" action="QnAInsert.jsp" method="POST">
											<textarea class="form-control counted" name="content"
												placeholder="320자 까지 입력 가능합니다." rows="5"
												style="margin-bottom: 10px; width: 800px; height: 130px;"></textarea>
											<h6 class="pull-right" id="counter"></h6>
											<input type="hidden" name="subject" value=""> <input
												type="hidden" name="mid" value="min">
											<input type="hidden" name="pid" value="ffff2124"> <input
												type="hidden" name="mid" value="min">
											<button class="btn btn-info" type="submit">등록</button>
										</form>
										<hr style="border: double 4px lightgray;">
										<!--문의게시판 리스트의 시작-->
										<jsp:include page="QnASideBar.jsp"/>
										<jsp:include page="<%=center2 %>" />

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	<script src="../js/productDetail/reviewList.js"></script>
	<script src="../js/productDetail/jquery-1.11.3.min.js"></script>
	<script src="../js/productDetail/star.js"></script>
	<script src="../js/productDetail/review.js"></script>
	<script src="../js/productDetail/tag.js"></script>
	<script src="../js/productDetail/count.js"></script>
	<script src="../js/productDetail/top.js"></script>
	

</body>
</html>
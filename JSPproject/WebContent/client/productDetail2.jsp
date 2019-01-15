<%@page import="dtodao.ProductDetailDAO"%>
<%@page import="dtodao.ReviewDTO"%>
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

	<jsp:useBean id="pdto" class="dtodao.ProductDTO">
		<jsp:setProperty name="pdto" property="*"/>
	</jsp:useBean>

<%
		
	String pid = request.getParameter("pid");
	System.out.println(pid);

    // Center 값을 변경해주기위해서 request 객체를 Center 값을 받아옴
    String center =request.getParameter("center");
    
    ProductDetailDAO pdao = new ProductDetailDAO();
    
    pdto = pdao.getOneProduct(pid);

    
    //처음 SessionMain.jsp 를 실행하면 null값이 실행되기에 null 처를 해줌
    if(center == null){
        center ="reviewTotal.jsp";
    }
%>


	<!--디테일 페이지 시작-->
	
	
	<div style="margin: 0 auto;  width: 900px; position: relative; right: 370px; top:300px; " >
		<img src="<%=pdto.getImgaddr() %>" class="rounded float" alt="#" width="500"
			height="500" style="position: relative; left: 72px">


		<h6 style="width: 900px; position: relative; left: 650px; bottom: 450px;"><%=pdto.getName() %></h6>
		<br> <br>
		<table style="position: relative; left: 650px; bottom: 450px;">
			<tr>
				<td width="30%" height="50">판매가</td>

				<td><%=pdto.getPrice() %>원</td>

			</tr>

			<tr>
				<td height="50">배송비</td>
				<td><%=pdto.getDeliverPrice() %>원</td>
			</tr>
			<tr>
				<td height="50">적립금(3%)</td>
				<td><%=pdto.getSaveMoney() %>원</td>
			</tr>
			<tr>
				<td height="50">모델</td>
				<td><%=pdto.getModelName() %></td>
			</tr>
			<tr>
				<td height="50">구성품</td>
				<td><%=pdto.getComponents() %></td>
			</tr>

		</table>


		<form  action="productDetailToCart.jsp" name="form" method="get" style="position: relative; left: 650px; bottom: 450px;">
			수량 : <input type=hidden name="sell_price" value="<%=pdto.getPrice() %>"> 
			<input type="text" name="amount" value="1" size="3" onchange="change();">
			<input type="button" value=" + " onclick="add();"> 
			<input type="button" value=" - " onclick="del();"><br> 금액 : 
			<input type="text" name="sum" size="11" readonly>원 <br> <br>
			<br>
			
			<input type="hidden" name="mid" value="<%=session.getAttribute("id")%>">
			<input type="hidden" name="pid" value="<%=pid%>">
			<button type="submit" class="btn btn-secondary" style="width: 400px;">카트추가</button>
			<button type="button" class="btn btn-secondary" style="width: 400px;" 
			onclick="location.href='payment2.jsp?mid=<%=session.getAttribute("id")%>&pid=<%=pid%>&price=<%=pdto.getPrice() %>&amount&snum'" >바로 결제</button>
		</form>

		
	</div>
	<hr style="max-width: 1100px; margin: 0 auto; border: double 4px lightgray;">


	<!-- 리뷰게시판과 문의게시판을 위한 탭 부분 -->
	<div style="margin: 0 auto; width: 900px; position: relative; top: 100px;">

		<ul class="tabs">
			<li><a href="#tab1">리뷰게시판</a></li>
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
										<div class="custom-control custom-radio">
										  <input type="radio" id="customRadio1" name="customRadio" value="리뷰" class="custom-control-input">
										  <label class="custom-control-label" for="customRadio1">
										  	<p style="position: relative; right: 375px; font-size: 11pt; ">리뷰 등록</p>
										  	</label>
										</div>
										<div class="custom-control custom-radio">
										  <input type="radio" id="customRadio2" name="customRadio" value="문의" class="custom-control-input">
										  <label class="custom-control-label" for="customRadio2">
										  <p style="position: relative; right: 375px; font-size: 11pt; ">문의 등록</p>
										  </label>
										</div>
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
										<input type="hidden" name="pid" value="<%=pid%>"> <input
											type="hidden" name="mid"
											value="<%=session.getAttribute("id")%>">
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
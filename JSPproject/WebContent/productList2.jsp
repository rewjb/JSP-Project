<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="Header.jsp"></jsp:include>

</head>
<body>


	<div align="center">
		<!-- 본문 시작 -->
		<table width="1000" style="margin:30px" border="1">
			<tr>
				<td width="280">
					<!-- 로고 삽입  --> <img src="/JSPproject/img/icon/logo.jpg" alt="로고"
					title="로고" />
				</td>
				<td>
					<!-- 검색창 삽입  -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<select name="job" style="width: 300px" class="custom-select">
								<option value="보기1" class="dropdown-item">보기1</option>
								<option value="보기2" class="dropdown-item">보기2</option>
								<option value="보기3" class="dropdown-item">보기3</option>
								<option value="보기4" class="dropdown-item">보기4</option>
							</select> <input type="text" width="500" class="form-control"> <input
								type="submit" class="btn btn-outline-secondary" value="검색">
						</div>
					</div> 
				
				</td>
			</tr>
		</table>
		<!-- 테이블 종료 -->
		<!-- 테이블 시작 : 메인버튼 및 전체적인 내용 넣기 -->
		<table width="1000" border="1">
			<!--↓ 메인버튼이 들어가 있는 1행 시작-->
			<tr>
				<td colspan="3">
					<!--↓메인버튼 그룹 시작-->
					<div class="btn-group" role="group"
						aria-label="Button group with nested dropdown">
						<!--메인 세부사항 선택못하는 버튼 시작 -->
						<button disabled="disabled" style="width: 200px" type="button"
							class="btn btn-secondary">회원관리</button>
						<!--메인 MBest 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="MBest" onclick="clickMainToggleBtn(MBest);"
								style="width: 300px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">남성시계
								BEST</button>
							<div style="width: 300px" class="dropdown-menu"
								aria-labelledby="MBest">
								<a class="dropdown-item" href="product/productList01.jsp">가이거</a>
								<a class="dropdown-item" href="#">다니엘 웰링턴</a> <a
									class="dropdown-item" href="#">디젤</a> <a class="dropdown-item"
									href="#">루미녹스</a>
							</div>
						</div>
						<!--메인 FBest 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="FBest" onclick="clickMainToggleBtn(FBest);"
								style="width: 300px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">여성시계 BEST</button>
							<div style="width: 300px" class="dropdown-menu"
								aria-labelledby="FBest">
								<a class="dropdown-item" href="#">구찌</a> <a
									class="dropdown-item" href="#">다니엘 웰링턴</a> <a
									class="dropdown-item" href="#">DKNY</a> <a
									class="dropdown-item" href="#">마크제이콥스</a>
							</div>
						</div>
						<!--메인 CBest 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="CBest" onclick="clickMainBtn(CBest);"
								style="width: 300px" type="button" class="btn btn-secondary">커플시계
								BEST</button>
						</div>
						<!--↑메인버튼 그룹 종료-->
					</div>
				</td>
			</tr>
			<!--↑ 메인버튼이 들어가 있는 1행 종료-->

		</table>
		
		<!-- 슬라이드 화면의 시작-->
	<div id="carousel3d" style="position: relative; top: 70px;">
		<carousel-3d :perspective="0" :space="200" :display="5" :controls-visible="true" :controls-prev-html="'<'" :controls-next-html="'>'" :controls-width="30" :controls-height="60" :clickable="true" :autoplay="true" :autoplay-timeout="5000">
			<slide :index="0">
				<span class="title">Web Development</span>
				<a href="preductDetail012.jsp">Click Here</a>
			</slide>
			<slide :index="1">
				<span class="title">Web Design</span>
				<a href="#">Click Here</a>
			</slide>
			<slide :index="2">
				<span class="title">You know</span>
				<a href="#">Click Here</a>
			</slide>
			<slide :index="3">
				<span class="title">You know</span>
				<a href="#">Click Here</a>
			</slide>
			<slide :index="4">
				<span class="title">You know</span>
				<a href="#">Click Here</a>
			</slide>
			<slide :index="5">
				<span class="title">You know</span>
				<a href="#">Click Here</a>
			</slide>
			<slide :index="6">
				<span class="title">You know</span>
				<a href="#">Click Here</a>
			</slide>

		</carousel-3d>
	</div>
		
		
		<!-- for문을 통해 해당 브랜드 제품을 화면에 뿌려줌-->
 		<div class="shop-product-wrap grid row">
			<%
				for (int i = 0; i < 9; i++) {
			%>
			<div class="col-xl-4 col-lg-6 col-md-6 col-12 pb-30 pt-10">
				<br>
				<br>
				<br>

				<div class="card" style="width: 18rem;">
					<img class="card-img-top" src="img/product-1.png"
						alt="Card image cap">
					<div class="card-body">
						<form action="productDetail2.jsp">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">Some quick example text to build on the
									card title and make up the bulk of the card's content.</p>
								<input type="hidden" name="pid" value="ffff2124">
								<input type="hidden" name="id" value="<%=session.getAttribute("id") %>">
								<button type="submit" class="btn btn-secondary">제품페이지로 이동</button>
						</form>
					</div>
				</div>
			</div>
			<%
				}
			%> 
		</div>

	</div>






	<!-- 슬라이더를 위한 스크립트 -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.7/vue.js'></script>
	<script src='https://rawgit.com/Wlada/vue-carousel-3d/master/dist/vue-carousel-3d.min.js'></script>
	<script type="text/javascript">
	new Vue({
		el : '#carousel3d',
		data : {
			slides : 7
		},
		components : {
			'carousel-3d' : Carousel3d.Carousel3d,
			'slide' : Carousel3d.Slide
		}
	})
	</script>
	
</body>
</html>
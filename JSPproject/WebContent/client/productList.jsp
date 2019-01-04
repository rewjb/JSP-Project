<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="/Header.jsp"></jsp:include>
</head>
<body >
	<%
		String clientId = "IcCXaLO3qfRlkqm3HRU0";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:9999/JSPproject/client/loginNaverPerform.jsp",
				"UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>


	<div align="center">
		<!-- 본문 시작 -->
		<div style="margin:0 auto;max-width:1000px">
		<div style="background:white;z-index: 1;position:fixed;top:0px;margin:0 auto;" >
		
		<table width="1000"   style="position:relative;margin:0 auto;">
			<tr  >
				<td width="280" >
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
		
		<table width="1000"    >
			<!--↓ 메인버튼이 들어가 있는 1행 시작-->
			<tr >
				<td colspan="3" >
					<!--↓메인버튼 그룹 시작-->
					<div class="btn-group" role="group"
						aria-label="Button group with nested dropdown">
						<!--회원관리 버튼 활성화 -->
						<button  style="width: 200px" type="button"
							class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">회원관리</button>
						<div style="width: 200px" class="dropdown-menu alert alert-dark  btn-light" 
								aria-labelledby="MBest"   >

							<div align="center" >
								<!--로그인 및 회원관리 -->
								
								<%
							if (session.getAttribute("id") == null) {
						%>
								
								<form action="/JSPproject/loginPerform.jsp" method="post">
									<input name="id" class="form-control" type="text"
										placeholder="아이디 입력"> <input name="pw"
										class="form-control" type="text" placeholder="비밀번호 입력">
									<a href="client/joinFormAgree.jsp"><button type="button"
											class="btn-dark">회원가입</button></a> <input width="200"
										class=" btn-dark" type="submit" value="로그인">
								</form>
								<h5>
									<a href="<%=apiURL%>"><span class="badge badge-success">네이버로
											로그인하기 </span></a>
								</h5>
								<%
							} else {
						%>
						<%=session.getAttribute("id")%>님 환영합니다.<br>회원정보<br>
						장바구니<br> 거래정보
						<%
							}
						%>
								
							</div>

						</div>
						<!--메인 MBest 버튼 시작 -->
						<div class="btn-group" role="group">
									<button id="MBest" onclick="clickMainToggleBtn(MBest);"
										style="width: 300px" type="button"
										class="btn btn-secondary dropdown-toggle"
										data-toggle="dropdown">남성시계 BEST</button>
									<div style="width: 300px" class="dropdown-menu"
										aria-labelledby="MBest">
										<a class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=gager">가이거</a> <a
											class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=danielm">다니엘 웰링턴</a> <a
											class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=digel">디젤</a> <a
											class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=loomi">루미녹스</a>
									</div>
								</div>
								<!--메인 FBest 버튼 시작 -->
								<div class="btn-group" role="group">
									<button id="FBest" onclick="clickMainToggleBtn(FBest);"
										style="width: 300px" type="button"
										class="btn btn-secondary dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">여성시계 BEST</button>
									<div style="width: 300px" class="dropdown-menu"
										aria-labelledby="FBest">
										<a class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=gucci">구찌</a> <a
											class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=danielf">다니엘 웰링턴</a> <a
											class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=dkny">DKNY</a> <a
											class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=mike">마크제이콥스</a>
									</div>
								</div>
								<!--메인 CBest 버튼 시작 -->
								<div class="btn-group" role="group">
									<a href="/JSPproject/client/productList.jsp?brand=couple"><button id="CBest" onclick="clickMainBtn(CBest);"
										style="width: 300px" type="button" class="btn btn-secondary">커플시계
										BEST</button></a>
								</div>
					</div>
				</td>
			</tr>
			<!--↑ 메인버튼이 들어가 있는 1행 종료-->

</table>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Library</a></li>
    <li class="breadcrumb-item active" aria-current="page">Data</li>
  </ol>
</nav>


</div>
</div>

 <div>
		
		<!-- 슬라이드 화면의 시작-->
	<div id="carousel3d" style="position: relative; top: 70px;margin-top:150px;">
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
		
		
		<div style="max-width:1000px">
		
		<!-- for문을 통해 해당 브랜드 제품을 화면에 뿌려줌-->
 		<div class="shop-product-wrap grid row" style="margin-top:150px ">
			<%
				for (int i = 0; i < 9; i++) {
			%>
			<div class="col-xl-4" >
				<br>

				<div class="card" style="width: 18rem;">
					<img class="card-img-top" src="/JSPproject/img/Cimage/anchorBoxId_19845.jpg"
						alt="Card image cap">
					<div class="card-body">
						<form action="productDetail2.jsp">
								<h5 >Card title</h5>
								<p class="card-text">dddddd</p>
								<button type="button" class="btn btn-secondary">제품페이지로 이동</button>
						</form>
					</div>
				</div>
			</div>
			<%
				}
			%> 
		</div>

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
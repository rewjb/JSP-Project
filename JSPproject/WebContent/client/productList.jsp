<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.ProductDTO"%>
<%@ page import="dtodao.CartDAO"%>
<jsp:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="/Header.jsp"></jsp:include>
</head>
<body style="max-width: 1100px; margin: 0 auto;">
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

		//String id = request.getParameter("id");
		String id = "유주빈";
		ArrayList<String> pidList = pidList = CartDAO.getInstance().selectPinfo(id);

		String brand = request.getParameter("brand");
		int paging;
		int index;

		try {
			paging = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			paging = 1;
		}

		ArrayList<ProductDTO> productList;

		if (brand == null) {
			productList = productDAO.openProductPage("가이거");
			brand = "가이거";
		} else {

			if (brand.equals("danielm")) {
				productList = productDAO.openProductPage("다니엘 웰링턴(남)");
				brand = "다니엘 웰링턴(남)";
			} else if (brand.equals("digel")) {
				productList = productDAO.openProductPage("디젤");
				brand = "디젤";
			} else if (brand.equals("loomi")) {
				productList = productDAO.openProductPage("루미눅스");
				brand = "루미눅스";
			} else if (brand.equals("gucci")) {
				productList = productDAO.openProductPage("구찌");
				brand = "구찌";
			} else if (brand.equals("danielf")) {
				productList = productDAO.openProductPage("다니엘 웰링턴(여)");
				brand = "다니엘 웰링턴(여)";
			} else if (brand.equals("dkny")) {
				productList = productDAO.openProductPage("DKNY");
				brand = "DKNY";
			} else if (brand.equals("mike")) {
				productList = productDAO.openProductPage("마크제이콥스");
				brand = "마크제이콥스";
			} else if (brand.equals("couple")) {
				productList = productDAO.openProductPage("커플시계");
				brand = "커플시계";
			} else {
				productList = productDAO.openProductPage("가이거");
				brand = "가이거";
			}
		}
		int productCount = productList.size();
	%>





	<div align="center">
		<!-- 본문 시작 -->
		<div style="margin: 0 auto; max-width: 1100px; width: 100%;">
			<div
				style="background: white; z-index: 1; position: fixed; top: 0px; margin: 0 auto;">

				<table width="1000px" style="position: relative; margin: 0 auto;">
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

				<table width="1000px">
					<!--↓ 메인버튼이 들어가 있는 1행 시작-->
					<tr>
						<td colspan="3">
							<!--↓메인버튼 그룹 시작-->
							<div class="btn-group" role="group"
								aria-label="Button group with nested dropdown">
								<!--회원관리 버튼 활성화 -->
								<button style="width: 200px" type="button"
									class="btn btn-secondary dropdown-toggle"
									data-toggle="dropdown">회원관리</button>
								<div style="width: 200px"
									class="dropdown-menu alert alert-dark  btn-light"
									aria-labelledby="MBest">

									<div align="center">
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
										<a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=gager&page=1">가이거</a>
										<a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=danielm&page=1">다니엘
											웰링턴</a> <a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=digel&page=1">디젤</a>
										<a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=loomi&page=1">루미녹스</a>
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
										<a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=gucci&page=1">구찌</a>
										<a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=danielf&page=1">다니엘
											웰링턴</a> <a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=dkny&page=1">DKNY</a>
										<a class="dropdown-item"
											href="/JSPproject/client/productList.jsp?brand=mike&page=1">마크제이콥스</a>
									</div>
								</div>
								<!--메인 CBest 버튼 시작 -->
								<div class="btn-group" role="group">
									<a
										href="/JSPproject/client/productList.jsp?brand=couple&page=1"><button
											id="CBest" onclick="clickMainBtn(CBest);"
											style="width: 300px" type="button" class="btn btn-secondary">커플시계
											BEST</button></a>
								</div>
							</div>
						</td>
					</tr>
					<!--↑ 메인버튼이 들어가 있는 1행 종료-->

				</table>

				<nav aria-label="breadcrumb">
					<ol class="breadcrumb" align="right">



						<%
							if (brand.equals("가이거") || brand.equals("다니엘 웰링턴(남)") || brand.equals("디젤") || brand.equals("루미눅스")) {
						%>
						<li class="breadcrumb-item"><a href="#">남성시계 BEST</a></li>
						<li class="breadcrumb-item"><a href="#"><%=brand%></a></li>
						<%
							} else if (brand.equals("커플시계")) {
						%>
						<li class="breadcrumb-item"><a href="#">커플시계 BEST</a></li>
						<li class="breadcrumb-item"><a href="#"><%=brand%></a></li>
						<%
							} else {
						%>
						<li class="breadcrumb-item"><a href="#">여성시계 BEST</a></li>
						<li class="breadcrumb-item"><a href="#"><%=brand%></a></li>
						<%
							}
						%>


					</ol>
				</nav>


			</div>
		</div>

		<div>

			<!-- 슬라이드 화면의 시작-->
			<div id="carousel3d"
				style="position: relative; top: 70px; margin-top: 150px;">
				<carousel-3d :perspective="0" :space="200" :display="5"
					:controls-visible="true" :controls-prev-html="'<'"
					:controls-next-html="'>'" :controls-width="30"
					:controls-height="60" :clickable="true" :autoplay="true"
					:autoplay-timeout="5000"> <slide :index="0">
				<span class="title"> <iframe width="100%" height="260"
						src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1"></iframe>
				</span> </slide> <slide :index="1"> <span class="title"> <iframe
						width="100%" height="260"
						src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1"></iframe>
				</span> </slide> <slide :index="2"> <span class="title"> <iframe
						width="100%" height="260"
						src="https://www.youtube.com/embed/tgbNymZ7vqY?autoplay=1"></iframe>
				</span> </slide> </carousel-3d>
			</div>


			<div style="max-width: 1000px">

				<!-- for문을 통해 해당 브랜드 제품을 화면에 뿌려줌-->
				<div class="shop-product-wrap grid row" style="margin-top: 150px">


					<%
						if (paging == productCount / 9 + 1) {
							index = (paging - 1) * 9;
							for (int i = 0; i < productCount % 9; i++) {
					%>
					<div class="col-xl-4">
						<br>
						<div class="card" style="width: 18rem; text-align: left;">
							<img class="card-img-top"
								src="<%=productList.get(index + i).getImgaddr()%>"
								alt="Card image cap">
							<div class="card-body">
								<form action="productDetail2.jsp">
									<font style="font-weight: bold" size="4">글제목 : <%=productList.get(index + i).getName()%></font><br>
									<br> <font size="4" color="red">판매원 : <%=productList.get(index + i).getPrice()%>원
									</font><br> <br> <font size="4">구성품 : <%=productList.get(index + i).getComponents()%></font><br>
									<br>


									<table border="">
										<tr>
											<td><a
												href="/JSPproject/client/productDetail2.jsp?pid=<%=productList.get(index + i).getId()%>">
													<button type="button" class="btn btn-secondary">상세보기</button>
											</a>


												</form>
												</div>
												</div>
												</div> <%
 	}
 	} else {
 		index = (paging - 1) * 9;
 %> <%
 	for (int i = 0; i < 9; i++) {
 %>

												<div class="col-xl-4">
													<br>
													<div class="card" style="width: 18rem; text-align: left;">
														<img class="card-img-top"
															src="<%=productList.get(index + i).getImgaddr()%>"
															alt="Card image cap">
														<div class="card-body">
															<form action="productDetail2.jsp">
																<font style="font-weight: bold" size="4">글제목 : <%=productList.get(index + i).getName()%></font><br>
																<br> <font size="4" color="red">판매가 : <%=productList.get(index + i).getPrice()%>원
																</font><br> <br> <font size="4">구성품 :<%=productList.get(index + i).getComponents()%></font><br>
																<br>


																<table width="250px">
																	<tr>
																		<td align="left"><a
																			href="/JSPproject/client/productDetail2.jsp?pid=<%=productList.get(index + i).getId()%>">
																				<button type="button" class="btn btn-secondary">상세보기</button>
																		</a></td>
																		<td align="right">
																		<%if (pidList.contains(productList.get(index + i).getId())){%>
																			<button type="button" class="btn btn-success">장바구니</button>
																		<%}else { %>
																			<button onclick="insertCart(this);" type="button" class="btn btn-secondary" alter="<%=productList.get(index + i).getId()%>">장바구니</button>
																			<%}%>
																		</td>
																	</tr>
																</table>
															</form>
														</div>
													</div>
												</div> <%
 	}
 	}
 %>
												</div>

												</div>
												</div>
												
												<script type="text/javascript">
												
												insertCartRequest = new XMLHttpRequest();
												var mid;
												
												function insertCart(btn) {
													
													if ('유주빈'==null) {
														alert('회원가입을 하셔야 이용이 가능한 서비스입니다.');
														location.href = '/JSPproject/index.jsp';
														return ;
													}else {
														if (btn.getAttribute('class')=='btn btn-success') {
															alert('이미 장바구니에 추가된 상품입니다.');
														}else{
															insertCartRequest.open("POST", "/JSPproject/InsertCartServlet?PID="+btn.getAttribute('alter')+"&MID="+<%=request.getParameter("id")%>, true)
															insertCartRequest.onreadystatechange = getRespone;
															insertCartRequest.send(null);
															btn.setAttribute('class', 'btn btn-success');
														}
														
														
													}
												}
												
												
												function getRespone() {
													if (insertCartRequest.readyState==4 && insertCartRequest.status==200) {
														 var object = eval('('+ insertCartRequest.responseText +')')
													}
												}
												</script>
												
												
												
												
												








												<nav aria-label="..." style="margin-top: 20px">
													<ul class="pagination pagination-lg"
														style="display: inline-block;">
														<li class="page-item"
															style="float: left; display: inline-block;"><a
															id="preBtn" class="page-link" href="#">?</a></li>
														<li class="page-item"
															style="float: left; display: inline-block;"><a
															id="nowBtn" class="page-link" href="#">1</a></li>
														<li class="page-item"
															style="float: left; display: inline-block;"><a
															id="nextBtn" class="page-link" href="#">3</a></li>
													</ul>
												</nav>

												<button onclick="sdasd();">눌러</button> <a id="temp"> </a> <script
													type="text/javascript">
			window.onload = function() {
				var preBtn = document.getElementById('preBtn');
				var nowBtn = document.getElementById('nowBtn');
				var nextBtn = document.getElementById('nextBtn');

				var page =<%=paging%>;
				
				nowBtn.innerHTML = page;
				

				if ((<%=paging%> - 1) == 0) {
					preBtn.innerHTML = '';
					preBtn.setAttribute('class', '');
				} else {
					preBtn.innerHTML = page-1 ; 
					preBtn.setAttribute('class', 'page-link');
					preBtn.setAttribute('href', '<%=request.getRequestURI() + "?brand=" + brand + "&page=" + (paging - 1)%>');
				}
				
				if ((page)==<%=(int) (productCount / 9 + 1)%>) {
					nextBtn.innerHTML  = '';
					nextBtn.setAttribute('class', '');
				}else {
					nextBtn.innerHTML = page+1;
					nextBtn.setAttribute('class', 'page-link');
					nextBtn.setAttribute('href', '<%=request.getRequestURI() + "?brand=" + brand + "&page=" + (paging + 1)%>');
						
							}
						}
					</script> <!-- 슬라이더를 위한 스크립트 --> <script
													src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.7/vue.js'></script>
												<script
													src='https://rawgit.com/Wlada/vue-carousel-3d/master/dist/vue-carousel-3d.min.js'></script>
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
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
<title>상세페이지</title>


<jsp:include page="../Header.jsp"></jsp:include>

</head>
<body onload="init();">



	<%
		request.setCharacterEncoding("UTF-8");

		//사용자로부터 데이터를 읽어드림
		String id = request.getParameter("id");
		String pid = request.getParameter("pid");

		//아이디외 패스워드를 저장
		session.setAttribute("id", id);

		//세셔의 유효시간 설정
		session.setMaxInactiveInterval(60 * 60);//60분
	%>


	<%
		//전체 게시글의 내용을 jsp 쪽으로 가져와야 함
		ReviewDAO rdao = new ReviewDAO();

		Vector<ReviewBean> vec = rdao.getPidReview(pid);
	%>

	<!--네이버 로그인 연동 -->

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

	<!-- 본문 시작 -->
	<div style="margin: 0 auto; max-width: 1000px">
		<div
			style="background: white; z-index: 1; position: fixed; top: 0px; margin: 0 auto;">

			<table width="1000" style="position: relative; margin: 0 auto;">
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

			<table width="1000">
				<!--↓ 메인버튼이 들어가 있는 1행 시작-->
				<tr>
					<td colspan="3">
						<!--↓메인버튼 그룹 시작-->
						<div class="btn-group" role="group"
							aria-label="Button group with nested dropdown">
							<!--회원관리 버튼 활성화 -->
							<button style="width: 200px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">회원관리</button>
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
									<a class="dropdown-item" href="#">가이거</a> <a
										class="dropdown-item" href="#">다니엘 웰링턴</a> <a
										class="dropdown-item" href="#">디젤</a> <a class="dropdown-item"
										href="#">루미녹스</a>
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

			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Library</a></li>
					<li class="breadcrumb-item active" aria-current="page">Data</li>
				</ol>
			</nav>



		</div>
	</div>





	<!--디테일 페이지 시작-->
	
	
	<div style="margin: 0 auto;  width: 900px; position: relative; right: 100px; top:300px; " >
		<img src="img/watch02.jpg" class="rounded float" alt="#" width="500"
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
		<hr style="width: 1000px;  border: double 4px lightgray; position: relative; left: 15px;">


	<!-- 리뷰게시판과 문의게시판을 위한 탭 부분 -->
	<div style="margin: 0 auto;  width: 900px; position: relative; top:300px;" >
	<div class="container" style="position: relative; bottom: 300px;">
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
								style="width: 835px; height: 900px;">
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
												<b>0</b>점
											</output>
										</span>

										<textarea class="form-control counted" name="content"
											placeholder="320자 까지 입력 가능합니다." rows="5"
											style="margin-bottom: 10px; width: 800px; height: 130px;"></textarea>
										<h6 class="pull-right" id="counter"></h6>
										<input type="hidden" name="pid" value="ffff2124"> <input
											type="hidden" name="mid"
											value="<%=session.getAttribute("id")%>">
										<button class="btn btn-info" type="submit">등록</button>
									</form>
									<hr style="width: 800px;  border: double 4px lightgray; position: relative; right: 15px;">

									<!--리뷰 리스트의 시작-->
									<div class="container">
										<div class="row">
											<div class="col-md-3">
												<form action="#" method="get">
													<div class="input-group">
														<!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
														<input class="form-control" id="system-search" name="q"
															placeholder="Search for" required>
													</div>
												</form>
											</div>
											<div class="col-md-9">
												<table class="table table-list-search">
													<thead>
														<tr>
															<th width="15%">글번호</th>
															<th width="15%">아이디</th>
															<th width="40%">내용</th>
															<th width="15s%">평점</th>
															<th width="15%">날짜</th>
														</tr>
													</thead>
													<tbody>
														<%
															for (int i = 0; i < vec.size(); i++) {
																//벡터에 저장되어 있는 빈클래스를 하나씩 추출
																ReviewBean bean = vec.get(i);
														%>
														<tr>
															<td><span style="FONT-SIZE: 12pt"><%=i + 1%></span></td>
															<td><span style="FONT-SIZE: 12pt"><%=bean.getMid()%></span></td>
															<td><span style="FONT-SIZE: 12pt"><a
																	href="ReviewInfo.jsp?num=<%=bean.getNum()%>&mid=<%=bean.getMid()%>"><%=bean.getContent()%></a></span></td>
															<td><span style="FONT-SIZE: 12pt"><%=bean.getGrade()%>점</span></td>
															<td><span style="FONT-SIZE: 12pt"><%=bean.getReg_date()%></span></td>
															<%
																}
															%>
														</tr>

													</tbody>
												</table>
											</div>
										</div>
									</div>

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
							<div class="panel panel-default"
								style="width: 835px; height: 300px;">
								<div class="panel-body">
									<form accept-charset="UTF-8" action="ReviewInsertProc.jsp"
										method="POST">
										<textarea class="form-control counted" name="content"
											placeholder="320자 까지 입력 가능합니다." rows="5"
											style="margin-bottom: 10px; width: 800px; height: 130px;"></textarea>
										<h6 class="pull-right" id="counter"></h6>
										<input type="hidden" name="id"
											value="<%=session.getAttribute("id")%>">
										<button class="btn btn-info" type="submit">등록</button>
									</form>

									<hr style="border: double 4px lightgray;">

									<!--문의게시판 리스트의 시작-->
									<ul class="media-list">
										<li class="media">
											<div class="media-body">
												<h4 class="media-heading">아이디 : 장민 날짜 :20190101</h4>
												재고품 있나요?
											</div> <br>
										</li>
									</ul>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script src="js/productDetail/reviewList.js"></script>
	<script src="js/productDetail/jquery-1.11.3.min.js"></script>
	<script src="js/productDetail/star.js"></script>
	<script src="js/productDetail/review.js"></script>
	<script src="js/productDetail/tag.js"></script>
	<script src="js/productDetail/count.js"></script>
	<script src="js/productDetail/top.js"></script>
</body>
</html>
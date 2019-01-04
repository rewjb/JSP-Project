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
<body>
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
								<button style="width: 200px" type="button" disabled="disabled"
									class="btn btn-secondary" data-toggle="dropdown">회원관리</button>
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
								<!--↑메인버튼 그룹 종료-->
							</div>
						</td>
					</tr>
					<!--↑ 메인버튼이 들어가 있는 1행 종료-->
				</table>
				<!-- 메인 위 화면 -->
			<!--↓ 속성분류 , 주된 내용이 들어가는 테이블 시작-->
			
			<table border="1" style="width:1100px;">
			<tr>
				<!--↓ 메인화면에 로그인 구역-->
				<td width="200" valign="top" align="center" rowspan="2">
					<div class="alert alert-dark  btn-light" role="alert">


						<%
							if (session.getAttribute("id") == null) {
						%>
						<form action="/JSPproject/loginPerform.jsp" method="post">
							<input name="id" class="form-control" type="text"
								placeholder="아이디 입력"> <input name="pw"
								class="form-control" type="text" placeholder="비밀번호 입력">
							<a href="client/joinFormAgree.jsp"><button type="button" class="btn-dark">회원가입</button></a>
							<input width="200" class=" btn-dark" type="submit" value="로그인">
						</form>
						<br>
						<h5>
							<span class="badge badge-success">네이버로 로그인하기 </span>
						</h5>
						<a href="<%=apiURL%>"><img height="50"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
						<!--로그인 전 추천순위-->
						<%
							} else {
						%>
						<%=session.getAttribute("id")%>님 환영합니다.<br> 회원정보<br>
						장바구니<br> 거래정보
						<%
							}
						%>
						<br> <br>
						<h2>
							<span class="badge badge-primary">추천순위</span>
						</h2>
						<div class="row">
							<div class="col-4">
								<div style="width: 150px" class="list-group" id="list-tab"
									role="tablist">
									<a class="list-group-item list-group-item-action active"
										data-toggle="list" href="#list-home" role="tab"
										aria-controls="home">Home</a> <a
										class="list-group-item list-group-item-action"
										data-toggle="list" href="#list-profile" role="tab"
										aria-controls="profile">Profile</a> <a
										class="list-group-item list-group-item-action"
										data-toggle="list" href="#list-messages" role="tab"
										aria-controls="messages">Messages</a> <a
										class="list-group-item list-group-item-action"
										data-toggle="list" href="#list-settings" role="tab"
										aria-controls="settings">Settings</a> <a
										class="list-group-item list-group-item-action"
										data-toggle="list" href="#list-settings" role="tab"
										aria-controls="settings">Settings</a>
								</div>
							</div>
							<!--로그인 전 추천순위 끝-->
						</div>
				</td>

				<!--로그인 하는 곳-->
				<td valign="top">
				
				<ul class="nav">
  <li class="nav-item">
    <a class="nav-link active" href="#">약관 동의</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">정보 입력</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">정보 확인</a>
  </li>
</ul>
				sadasdasd
				sad
				asd
				
				
				
				
				
				
				
				
				
				
				</td>
			</tr>
			<!--로그인 하는 곳-->
</table>


















		

























	</center>


	<script>
	<!--버튼 눌렀을 때 발생하는 색상 이벤트 -->
		var MBest = document.getElementById('MBest');
		var FBest = document.getElementById('FBest');
		var CBest = document.getElementById('CBest');
		function clickMainToggleBtn(xBtn) {

			MBest.className = "btn btn-secondary dropdown-toggle";
			FBest.className = "btn btn-secondary dropdown-toggle";
			CBest.className = "btn btn-secondary"

			xBtn.className = "btn  btn-dark dropdown-toggle";
		}
		function clickMainBtn(xBtn) {

			MBest.className = "btn btn-secondary dropdown-toggle";
			FBest.className = "btn btn-secondary dropdown-toggle";
			CBest.className = "btn btn-secondary"

			xBtn.className = "btn  btn-dark";
		}
	</script>
</body>
</html>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery.min.js"></script>


<html>
<head>
<title>네이버로그인</title>
</head>
<body>

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
	
	
	
	<center>
		<!-- 본문 시작 -->
		<table width="1000" height="130">
			<tr>
				<td width="280">
					<!-- 로고 삽입  --> <img src="img/icon/logo.jpg" alt="로고" title="로고" />
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
							<button id="MBest" onclick="clickMainBtn(MBest);"
								style="width: 300px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">남성시계
								BEST</button>
							<div style="width: 300px" class="dropdown-menu"
								aria-labelledby="MBest">
								<a class="dropdown-item" href="#">CPU-1</a> <a
									class="dropdown-item" href="#">CPU-2</a>
							</div>
						</div>
						<!--메인 FBest 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="FBest" onclick="clickMainBtn(FBest);"
								style="width: 300px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">여성시계 BEST</button>
							<div style="width: 300px" class="dropdown-menu"
								aria-labelledby="FBest">
								<a class="dropdown-item" href="#">RAM-1</a> <a
									class="dropdown-item" href="#">RAM-2</a>
							</div>
						</div>
						<!--메인 CBest 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="CBest" onclick="clickMainBtn(CBest);"
								style="width: 300px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">메인보드</button>
							<div style="width: 300px" class="dropdown-menu"
								aria-labelledby="CBest">
								<a class="dropdown-item" href="#">메인보드-1</a> <a
									class="dropdown-item" href="#">메인보드-2</a>
							</div>
						</div>
						<!--↑메인버튼 그룹 종료-->
					</div>
				</td>
			</tr>
			<!--↑ 메인버튼이 들어가 있는 1행 종료-->
			<!--↓ 속성분류 , 주된 내용이 들어가는 테이블 시작-->
			<tr>
				<!--↓ 메인화면에 로그인 구역-->
				<td width="200" valign="top" align="center" rowspan="2">
					<div class="alert alert-dark  btn-light" role="alert">

                   
                    <% if(session.getAttribute("id")==null){%>
                    
						<form action="loginPerform.jsp" method="post">
							<input name="id" class="form-control" type="text"
								placeholder="아이디 입력"> <input name="pw"
								class="form-control" type="text" placeholder="비밀번호 입력">
							<a href="joinForm.jsp"><button type="button" class="btn-dark">회원가입</button></a>
							<input width="200" class=" btn-dark" type="submit" value="로그인">
						</form>
						<br>
						<h5><span class="badge badge-success">네이버로 로그인하기 </span></h5>
						<a href="<%=apiURL%>"><img height="50"
							src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
						<!--로그인 전 추천순위-->
						<%}else{%>
						<%=session.getAttribute("id")%>님 환영합니다.<br>
						회원정보<br>
						장바구니<br>
						거래정보
						<%}%>
						<br><br>
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

				<!--메인 페이지 : 슬라이딩 쇼-->
				<td colspan="2" valign="top" height="170">
					<div id="autoslide" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#autoslide" data-slide-to="0" class="active"></li>
							<li data-target="#autoslide" data-slide-to="1"></li>
							<li data-target="#autoslide" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="img/main/slide1.png" class="img w-100">
							</div>
							<div class="carousel-item">
								<img src="img/main/slide2.png" class="img w-100">
							</div>
							<div class="carousel-item">
								<img src="img/main/slide3.png" class="img w-100">
							</div>
						</div>
						<a class="carousel-control-prev btn-secondary" href="#autoslide"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon " aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next  btn-secondary" href="#autoslide"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon " aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</td>
			</tr>
			<!--메인 페이지 : 슬라이딩 쇼 끝-->

			<tr>
				<td>추천</td>
				<td>실시간</td>

			</tr>
			<!--↑ 속성분류 , 주된 내용이 들어가는 테이블 종료-->


















		</table>

		<script>
		<!--버튼 눌렀을 때 발생하는 색상 이벤트 -->
			var MBest = document.getElementById('MBest');
			var FBest = document.getElementById('FBest');
			var CBest = document.getElementById('CBest');
			var VGAbtn = document.getElementById('VGAbtn');
			var SSDbtn = document.getElementById('SSDbtn');
			var HDDbtn = document.getElementById('HDDbtn');
			var ODDbtn = document.getElementById('ODDbtn');
			var CASEbtn = document.getElementById('CASEbtn');
			var arrayBtn = Array(MBest, FBest, CBest);
			function clickMainBtn(xBtn) {
				for (var i = 0; i < 3; ++i) {
					arrayBtn[i].className = "btn btn-secondary dropdown-toggle";
				}
				xBtn.className = "btn  btn-dark dropdown-toggle";
			}
		</script>




























	</center>

</body>
</html>
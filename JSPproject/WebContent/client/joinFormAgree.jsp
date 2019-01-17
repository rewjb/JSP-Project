<%@page import="dtodao.SalesManagerDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="dtodao.SalesManagerDAO"%>
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
<title>회원가입</title>
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
		
		/* ------------추천 순위-------------------- */
		
		SalesManagerDAO sdao = new SalesManagerDAO();
		
		Vector<SalesManagerDTO> vec = sdao.getRecommend();
	%>


	<center>
		<!-- 본문 시작 -->
		<table width="1000" height="130">
			<tr>
				<td width="280">
					<!-- 로고 삽입  --> <img src="/JSPproject/img/icon/logo.jpg" alt="로고"
					title="로고" />
				</td>
				<td>
					<!-- 검색창 삽입  -->
					<div class="input-group mb-3" method="GET">
						<form action="/JSPproject/client/searchProductList.jsp">
							<div class="input-group-prepend">
								<select name="searchType" style="width: 300px"
									class="custom-select">
									<option value="subject" class="dropdown-item">제목</option>
									<option value="brand" class="dropdown-item">브랜드</option>
								</select> <input name="content" type="text" width="500"
									class="form-control"> <input type="submit"
									class="btn btn-outline-secondary" value="검색">
							</div>
						</form>
					</div>
				</td>
			</tr>
		</table>
		<!-- 테이블 종료 -->
		<!-- 테이블 시작 : 메인버튼 및 전체적인 내용 넣기 -->
		<table id="table" width="1000" border="1">
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
								<a class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=gager&page=1">가이거</a> <a
									class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=danielm&page=1">다니엘 웰링턴</a> <a
									class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=digel&page=1">디젤</a> <a class="dropdown-item"
									href="/JSPproject/client/productList.jsp?brand=loomi&page=1">루미녹스</a>
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
								<a class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=gucci&page=1">구찌</a> <a
									class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=danielf&page=1">다니엘 웰링턴</a> <a
									class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=dkny&page=1">DKNY</a> <a
									class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=mike&page=1">마크제이콥스</a>
							</div>
						</div>
						<!--메인 CBest 버튼 시작 -->
						<div class="btn-group" role="group">
							<a href="/JSPproject/client/productList.jsp?brand=couple&page=1"><button id="CBest" onclick="clickMainBtn(CBest);"
								style="width: 300px" type="button" class="btn btn-secondary">커플시계
								BEST</button></a>
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


						<%
							if (session.getAttribute("id") == null) {
						%>
						<form action="/JSPproject/loginPerform.jsp" method="post">
							<input name="id" class="form-control" type="text"
								placeholder="아이디 입력"> <input name="pw"
								class="form-control" type="text" placeholder="비밀번호 입력">
							<a href="joinFormAgree.jsp"><button type="button" class="btn-dark">회원가입</button></a>
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
										<button type="button" class="btn btn-outline-info"><h5><%=session.getAttribute("id")%>님</h5><br>
								환영합니다.
								</button><br><br>
								<a href="/JSPproject/client/privateInfoForm.jsp"><button type="button" class="btn btn-info">개인정보</button></a><br>
								<a href="/JSPproject/client/privateCart.jsp"><button type="button" class="btn btn-info">장바구니</button></a><br>
								<a href="/JSPproject/client/dealListForm.jsp"><button type="button" class="btn btn-info">거래내역</button></a><br>
								<a href="/JSPproject/logOutPerform.jsp"><button type="button" class="btn btn-info">로그아웃</button></a><br>
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
											<%
											int count = 0;
											for(int i = 0; i <5; i++){
												SalesManagerDTO sdto = vec.get(i);
												count++;
											%>
											<button type="button" class="btn btn-default " onclick="location.href='/JSPproject/client/productDetail2.jsp?pid=<%=sdto.getPid()%>'"><%=count%>위 :<br> <%=sdto.getModelName() %></button>
<%-- 											<a class="list-group-item list-group-item-action active" data-toggle="list" href="productDetail2.jsp?pid=<%=sdto.getPid()%>" role="tab" aria-controls="home">
											<%=count%>위 : <%=sdto.getModelName() %>
											</a>  --%>
											<%
											}
											%>
									</div>
							</div>
							<!--로그인 전 추천순위 끝-->
						</div>
				</td>

				<!--회원가입 하는 곳-->
				<td align="center" valign="top">

					<ul class="nav">
						<li class="nav-item"><a class="nav-link active" href="#">약관
								동의</a></li>
						<li class="nav-item"><a class="nav-link" href="#">정보 입력</a></li>
						<li class="nav-item"><a class="nav-link disabled" href="#">정보
								확인</a></li>
					</ul> <br> <br> <!--약관1-->
					<h3>
						<span class="badge badge-secondary">서비스 약관 동의</span>
					</h3> <textarea disabled rows="3"
						style="resize: none; margin-top: 0px; margin-bottom: 0px; width: 800px; height: 300px;">
						<jsp:include page="agreementText1.jsp" flush="false" />
                          </textarea>

					<div class="form-check">
						<h3>
							<input style="width: 20px; height: 20px;" name="agree1"
								class="form-check-input" type="checkbox" id="agree1"> 동의
						</h3>
					</div> <br> <!--약관2-->
					<h3>
						<span class="badge badge-secondary">개인정보 수정 및 이용 동의</span>
					</h3> <textarea disabled rows="3"
						style="resize: none; margin-top: 0px; margin-bottom: 0px; width: 800px; height: 200px;">
						<jsp:include page="agreementText2.jsp" flush="false" />
                          </textarea>
					<div class="form-check">

						<h3>
							<input style="width: 20px; height: 20px;" name="agree2"
								class="form-check-input" type="checkbox" id="agree2"> 동의
						</h3>

						<br> <br>
						<!-- 약관 전부 동의 후 동의버튼-->
						<h1>
							<button onclick="nextAgreePage();"
								style="width: 200; height: 80px;" class="btn btn-secondary">
								<font size="50">다음</font>
							</button>
							
							<form id="agree" action="/JSPproject/client/joinForm.jsp" method="post"> 
							<input type="hidden" name="agree" value="true">
							</form>
							
						</h1>
				</td>
			</tr>
			<!--회원가입 하는 곳-->

			<script type="text/javascript">
				function nextAgreePage() {
					agree1.checked;
					agree2.checked;
					
					var tempHtml;

					if (agree1.checked == true && agree2.checked == true) {
						
					     document.getElementById('agree').submit();
						
						//회원가입시 동의를 완료하고 다음버튼을 누르면 변경하게 하는 자바스크립트 함수 입니다.
					    //var content = document.getElementById("table").rows[1].cells;
						//alert(document.getElementById("table").rows.item(1).innerHTML);
						
					}else{alert('동의를 선택해 주세요.');}

				};
			</script>







































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
		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
<%@page import="java.util.Vector"%>
<%@page import="dtodao.SalesManagerDTO"%>
<%@page import="dtodao.SalesManagerDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="crawlingUtil.PullData"%>
<%@ page import="dtodao.ProductDAO"%>
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
		
	/* ------------추천 순위-------------------- */
	
	SalesManagerDAO sdao = new SalesManagerDAO();
	
	Vector<SalesManagerDTO> vec = sdao.getRecommend();
	
		
	%>


	<div align="center">
		<!-- 본문 시작 -->
		<div style="margin: 0 auto; max-width: 1100px">
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
							<div class="input-group mb-3" method="GET">
							<form action="/JSPproject/client/searchProductList.jsp">
								<div class="input-group-prepend">
									<select name="searchType" style="width: 300px" class="custom-select">
										<option value="subject" class="dropdown-item">제목</option>
										<option value="brand" class="dropdown-item">브랜드</option>
									</select> <input name="content" type="text" width="500" class="form-control"> <input
										type="submit" class="btn btn-outline-secondary" value="검색">
								</div>
							</form>
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
								<!--↑메인버튼 그룹 종료-->
							</div>
						</td>
					</tr>
					<!--↑ 메인버튼이 들어가 있는 1행 종료-->
				</table>
				<!-- 메인 위 화면 -->
				<!--↓ 속성분류 , 주된 내용이 들어가는 테이블 시작-->

				<table style="width: 1100px;">
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
									<a href="client/joinFormAgree.jsp"><button type="button"
											class="btn-dark">회원가입</button></a> <input width="200"
										class=" btn-dark" type="submit" value="로그인">
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

						<!--로그인 하는 곳-->
						<td valign="top">
						
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
  <a class="carousel-control-prev btn-secondary" href="#autoslide" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon " aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next  btn-secondary" href="#autoslide" role="button" data-slide="next">
    <span class="carousel-control-next-icon " aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<table class="table table-sm">

  <thead>
    <tr>
      <th style='text-align:center;' >순위</th>
      <th >제품</th>
	  <th style='text-align:center;'>브랜드</th>
	  <th style='text-align:center;'>모델</th>
      <th style='text-align:center;'>가격</th>
    </tr>
  </thead>
  
  <tbody>
  	<%
  	int count2 = 0;
	for(int i = 0; i <5; i++){
		SalesManagerDTO sdto = vec.get(i);
		count2++;
  	%> 
  	<tr>
		<td style='text-align:center;vertical-align:middle'><%=count2 %>위</td>
		<td><img src="<%=sdto.getImgAddr() %>" class="rounded float-left" alt="..." style="width: 50px; height: 50px;"></td>
		<td style='text-align:center;vertical-align:middle'><%=sdto.getBrand() %></td>
		<td style='text-align:center;vertical-align:middle'><%=sdto.getModelName() %></td>		                      		                        
		<td style='text-align:center;vertical-align:middle'><%=sdto.getPrice()%></td>	                        
	</tr>
	<%
		}
	%>   
  
  
<!--     <tr>
      <th scope="row">1</th>
      <td>TISSO</td>
      <td>[티쏘 TISSOT] T006.408.11.057.00  르로끌 Le Locle 신형 39mm</td>
      <td>952,000원</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>SEIKO</td>
      <td>[세이코시계 SEIKO] 크로노그래프 Chronograph 42mm</td>
      <td>952,000원</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>CITIZEN</td>
      <td>[시티즌시계 CITIZEN]  / 43mm 에코드라이브 라디오컨트롤</td>
      <td>952,000원</td>
    </tr>
        <tr>
      <th scope="row">4</th>
      <td>GUESS</td>
      <td>[게스시계 GUESS]  남성용 메탈시계</td>
      <td>952,000원</td>
    </tr>
        <tr>
      <th scope="row">5</th>
      <td>TISSO</td>
      <td>[티쏘시계 TISSOT] T099.207.11.048.00  CHEMIN DES TOURELLES 슈망 데 뚜렐 여성용 32mm</td>
      <td>952,000원</td>
    </tr> -->
  </tbody>

</table>
						</td>
						
					</tr>
					<!--로그인 하는 곳-->
				</table>
				<jsp:include page="footer.jsp"></jsp:include>
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
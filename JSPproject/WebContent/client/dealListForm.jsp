<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.CartDAO"%>
<%@ page import="dtodao.ProductDTO"%>
<%@ page import="dtodao.DealDAO"%>
<!DOCTYPE html>

<html>
<head>
<title>개인 거래내역</title>

<jsp:include page="/Header.jsp"></jsp:include>
</head>
<body style="max-width: 1100px; margin: 0 auto;">
	<%
	
    if (session.getAttribute("id")==null) {
    	
    	out.println("<script>");

		out.println("alert('로그인을 먼저 해주세요.');");
		
		out.println("location.href ='/JSPproject/index.jsp';");
		
		out.println("</script>");
		
		return;
    	
    }
	
	
	
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

		String mid = (String) session.getAttribute("id");
	
		ArrayList<ProductDTO> cartProductList = DealDAO.getInstance().dealList(mid);

		String stringPage = request.getParameter("page");
		int intPage;
		try {
			intPage = Integer.parseInt(stringPage);
		} catch (Exception e) {
			intPage = 1;
		}
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
						<li class="breadcrumb-item"><a href="#"><%=session.getAttribute("id")%></a></li>
						<li class="breadcrumb-item"><a href="#">개인 거래내역</a></li>
					</ol>
				</nav>
			</div>

		</div>
	</div>
	<table class="table"
		style="margin-top: 200px; text-align: center; vertical-align: center;"
		border="1">
		<thead>
			<tr>
				<th style="width: 60px" scope="col">번호</th>
				<th style="width: 120px" scope="col">사진</th>
				<th  scope="col">내용</th>
				<th style="width: 100px" scope="col">가격</th>
				<th style="width: 80px" scope="col">수량</th>
				<th style="width: 220px" scope="col">총가격</th>
			</tr>
		</thead>
		<tbody>
			<%
				int pageProductListSize;
				//해당 페이지에 보여줄 리스트 수량

				if ((cartProductList.size() / 5 + 1) == intPage) {
					pageProductListSize = cartProductList.size() % 5 + 5 * (intPage - 1);
				} else {
					pageProductListSize = 5 + 5 * (intPage - 1);
				}
				int productCount = 5 * (intPage);
				for (int i = 5 * (intPage - 1); i < pageProductListSize; i++) {
			%>
			<tr>
			
				<th scope="row"><%=i + 1%></th>
				<td><img src="<%=cartProductList.get(i).getImgaddr()%>"
					style="width: 80px; height: 80px" /></td>
				<td><%=cartProductList.get(i).getName()%>
					</td>
				<td><%=cartProductList.get(i).getPrice()%></td>
				<td><input id="quantity<%=i + 1%>" type="text" name="quantity" readonly="readonly"
					onkeyup="calculatePrice(this,document.getElementById('total<%=i + 1%>'),<%=cartProductList.get(i).getPrice()%>);"
					alert="<%=cartProductList.get(i).getId()%>"
					style="width: 25px; text-align: right;" onblur="saveCartQuantity(this ,'<%=cartProductList.get(i).getId()%>');"
					value="<%=cartProductList.get(i).getQuantity()%>">개</td>
				<td><input id="total<%=i + 1%>" type="text" name="totalPrice"
					style="width: 130px; text-align: right;" readonly="readonly" value="<%=cartProductList.get(i).getQuantity()*cartProductList.get(i).getPrice()%>">
					총가격<br>
				<br>
				<br>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<script type="text/javascript">
	
	
		
function calculatePrice( input, result , price) {	
	
	input.value = input.value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|]/g, "");
	// 한글입력 제한
	input.value = input.value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
	// 특수문자 제한
	input.value = input.value.trim();
	// 공백문자 제한
	input.value = input.value.replace( /[A-Za-z]/g, "");
	// 영어입력 제한
	
	if( parseInt(input.value) >99){
		alert('수량은 99를 넘을 수 없습니다.');
		input.value=99;
	}else{
	 result.setAttribute('value', input.value * price);
	}
}

var insertCartQuantityRequest = new XMLHttpRequest();

function saveCartQuantity(input , pid) {
	insertCartQuantityRequest.open("POST", "/JSPproject/InsertCartQuantity?MID=<%=session.getAttribute("id")%>&PID="+pid+"&QUANTITY="+input.value, false);
	insertCartQuantityRequest.onreadystatechange = getRespone;
	insertCartQuantityRequest.send(null);
}

function getRespone() {
	if (insertCartQuantityRequest.readyState==4 && insertCartRequest.status==200) {
		 var object = eval('('+ insertCartRequest.responseText +')');
		 alert(object);
	}
}
</script>



	<div style="text-align: center;">
		<nav aria-label="..." style="margin-top: 20px">
			<ul class="pagination pagination-lg" style="display: inline-block;">
				<li class="page-item" style="float: left; display: inline-block;"><a
					id="preBtn" class="page-link" href="#">0</a></li>
				<li class="page-item" style="float: left; display: inline-block;"><a
					id="nowBtn" class="page-link" href="#">0</a></li>
				<li class="page-item" style="float: left; display: inline-block;"><a
					id="nextBtn" class="page-link" href="#">2</a></li>
			</ul>
		</nav>
	</div>


	<script type="text/javascript">
	window.onload = function() {
		
		var preBtn = document.getElementById('preBtn');
		var nowBtn = document.getElementById('nowBtn');
		var nextBtn = document.getElementById('nextBtn');

		var page =<%=intPage%>;
		
		nowBtn.innerHTML = page;
		

		if ((page - 1) == 0) {
			preBtn.innerHTML = '';
			preBtn.setAttribute('class', '');
		} else {
			preBtn.innerHTML = page-1 ; 
			preBtn.setAttribute('class', 'page-link');
			preBtn.setAttribute('href', '<%=request.getRequestURI() + "?page=" + (intPage - 1)%>');
		}
		
		if ((page)==<%=(int) (cartProductList.size() / 5 + 1)%>) {
			nextBtn.innerHTML  = '';
			nextBtn.setAttribute('class', '');
		}else {
			nextBtn.innerHTML = page+1;
			nextBtn.setAttribute('class', 'page-link');
			nextBtn.setAttribute('href', '<%=request.getRequestURI() + "?page=" + (intPage + 1)%>');
	

		}
	}
	
	
	
	
	
	
	</script>





</body>
</html>
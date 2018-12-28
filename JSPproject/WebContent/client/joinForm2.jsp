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
			<!--↓ 속성분류 , 주된 내용이 들어가는 테이블 시작-->
			<tr>
				<!--↓ 메인화면에 로그인 구역-->
				<td width="200" valign="top" align="center" rowspan="2">
					<div class="alert alert-dark  btn-light" role="alert">


						<%
							if (session.getAttribute("id") == null) {
						%>
						<form action="loginPerform.jsp" method="post">
							<input name="id" class="form-control" type="text"
								placeholder="아이디 입력"> <input name="pw"
								class="form-control" type="text" placeholder="비밀번호 입력">
							<a href="joinForm.jsp"><button type="button" class="btn-dark">회원가입</button></a>
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

				<!--회원가입 하는 곳-->

				<td align="center" valign="top">
				<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
				<input style="width:300px;" type="text" class="form-control" disabled id="sample2_postcode" placeholder="우편번호"> <br>
				<input type="text" style="width:300px;" class="form-control" id="sample2_address" disabled placeholder="주소"><br>
				<input type="text" class="form-control" id="sample2_extraAddress" style="width:300px;" disabled placeholder="참고항목"><br>
				<input type="text" class="form-control" id="sample2_detailAddress" placeholder="상세주소" style="width:300px;" >

					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
					<div id="layer"
						style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
							id="btnCloseLayer"
							style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
							onclick="closeDaumPostcode()" alt="닫기 버튼">
					</div> <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 화면을 넣을 element
						var element_layer = document.getElementById('layer');

						function closeDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_layer.style.display = 'none';
						}

						function sample2_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var addr = ''; // 주소 변수
											var extraAddr = ''; // 참고항목 변수

											//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
											if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
												addr = data.roadAddress;
											} else { // 사용자가 지번 주소를 선택했을 경우(J)
												addr = data.jibunAddress;
											}

											// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
											if (data.userSelectedType === 'R') {
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if (data.bname !== ''
														&& /[동|로|가]$/g
																.test(data.bname)) {
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if (data.buildingName !== ''
														&& data.apartment === 'Y') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
												if (extraAddr !== '') {
													extraAddr = ' ('
															+ extraAddr + ')';
												}
												// 조합된 참고항목을 해당 필드에 넣는다.
												document
														.getElementById("sample2_extraAddress").value = extraAddr;

											} else {
												document
														.getElementById("sample2_extraAddress").value = '';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('sample2_postcode').value = data.zonecode;
											document
													.getElementById("sample2_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById(
													"sample2_detailAddress")
													.focus();

											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_layer.style.display = 'none';
										},
										width : '100%',
										height : '100%',
										maxSuggestItems : 5
									}).embed(element_layer);

							// iframe을 넣은 element를 보이게 한다.
							element_layer.style.display = 'block';

							// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
							initLayerPosition();
						}

						// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						function initLayerPosition() {
							var width = 300; //우편번호서비스가 들어갈 element의 width
							var height = 400; //우편번호서비스가 들어갈 element의 height
							var borderWidth = 5; //샘플에서 사용하는 border의 두께

							// 위에서 선언한 값들을 실제 element에 넣는다.
							element_layer.style.width = width + 'px';
							element_layer.style.height = height + 'px';
							element_layer.style.border = borderWidth
									+ 'px solid';
							// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
							element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
									+ 'px';
							element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
									+ 'px';
						}
					</script></td>
			</tr>
			<!--회원가입 하는 곳-->



			<script type="text/javascript">
				function nextAgreePage() {
					agree1.checked;
					agree2.checked;

					var tempHtml;

					if (agree1.checked == true && agree2.checked == true) {
						//회원가입시 동의를 완료하고 다음버튼을 누르면 변경하게 하는 자바스크립트 함수 입니다.
						var content = document.getElementById("table").rows[1].cells;
						//alert(document.getElementById("table").rows.item(1).innerHTML);

						tempHtml = '';
						tempHtml += '<h3><input style="width: 20px; height: 20px;" name="agree2"	class="';
						tempHtml += 'form-check-input" type="checkbox" id="agree2"> 동의</h3>';

						content[1].innerHTML = tempHtml;
					}

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
</body>
</html>
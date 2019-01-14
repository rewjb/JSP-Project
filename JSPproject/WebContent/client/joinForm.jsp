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
	if (request.getParameter("agree")==null) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.replace('/JSPproject/client/joinFormAgree.jsp');");
		out.println("</script>");
	
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
									class="dropdown-item" href="/JSPproject/client/productList.jsp?brand=mike&page=">마크제이콥스</a>
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
							<a href="joinFormAgree.jsp"><button type="button"
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

				<!--회원가입 하는 곳-->

				<form method="post" action="joinPerform.jsp" id="joinInfo" onsubmit="return finalCheck()"
					class="needs-validation" novalidate>

					<td align="left" valign="top"><br>
						<div align="center">
							<span class="badge badge-secondary"><font size="5">가입
									정보 입력</font></span>
						</div>
						<div align="center">로그인 정보 및 가입 정보를 입력하세요.</div> <br>

						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text">아이디 </span>
							</div>
							<!-- 회원가입 아이디 입력란 -->
							<input type="text" class="form-control" id="inputId"
								name="inputId" placeholder="아이디를 입력하세요."
								onKeyUp="checkInputId();" style="margin-right: 350px;"
								aria-describedby="basic-addon3" maxlength="15">
						</div>

						<div style="margin-left: 150px">
							<font id="idCheckResult" color="red"></font>
						</div> <br>

						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text" >비밀번호</span>
							</div>
							<input id="inputPw" type="password" class="form-control" oninput="checkInputPw();" 
								style="margin-right: 350px" aria-describedby="basic-addon3" maxlength="15"
								placeholder="비밀번호를 입력하세요.">
						</div>

						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text">재확인</span>
							</div>
							<input id="reInputPw" name="reInputPw" type="password" class="form-control"  oninput="checkInputPw();" disabled="disabled"
								placeholder="비밀번호 재확인을 입력하세요." style="margin-right: 350px" maxlength="15"
								aria-describedby="basic-addon3">
						</div>
						<div style="margin-left: 150px"><font color="red" id="pwCheckResult"></font></div> <br>

						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text">이름</span>
							</div>
							<input id="InputName" name="InputName" type="text" class="form-control" placeholder="이름을 입력하세요." oninput="checkInputName();"
								maxlength="6" style="margin-right: 350px" aria-describedby="basic-addon3">
						</div>
						<div style="margin-left: 150px"><font color="red" id="nameCheckResult"></font></div> <br>


						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text">생년월일</span>
							</div> 
							<input id="InputDate" name="InputDate" type="date" class="form-control" oninput="checkInputDate();"
								placeholder="생년월일 입력 하세요." style="margin-right: 350px" maxlength="10"
								aria-describedby="basic-addon3">
						</div>
						<div style="margin-left: 150px"><font id="dateCheckResult" color="red"></font></div> <br>

						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text" >전화번호</span>
							</div>
							<input id="InputTel" name="InputTel" type="text" class="form-control" oninput="checkInputTel();" placeholder="'-' 없이 입력해 주세요"
							maxlength="10" style="margin-right: 350px" aria-describedby="basic-addon3">
						</div>
						<div style="margin-left: 150px"><font color="red" id="telCheckResult"></font></div> <br>

						<input type="button" onclick="sample2_execDaumPostcode()" style="margin-left: 150px" value="우편번호 찾기">
						<input  name="InputAddr" type="text" style="margin-left: 150px; width: 300px;" class="form-control" disabled id="sample2_postcode" oninput="checkInputAddr();" placeholder="우편번호">
						<input type="text" name="InputAddr" style="margin-left: 150px; width: 300px;" class="form-control" id="sample2_address" disabled placeholder="주소">
						<input name="InputAddr" type="text" class="form-control" id="sample2_extraAddress" style="margin-left: 150px; width: 300px;" disabled placeholder="참고항목">
						<input type="text" name="InputAddr"  class="form-control" id="sample2_detailAddress" placeholder="상세주소" style="margin-left: 150px; width: 300px;" maxlength="20" oninput="checkInputAddr();">
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer"
							style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
								id="btnCloseLayer"
								style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
								onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div> <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<div style="margin-left: 150px"><font id="addrCheckResult" color="red"> </font>
							</div> <br> <br>
						<div class="input-group mb-3" style="margin-left: 150px">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">이메일</span>
							</div>
							<input type="email" class="form-control" id="InputEmail" name="InputEmail" maxlength="60" oninput="checkInputEmail();"
								style="margin-right: 350px" aria-describedby="basic-addon3">
						</div>
						<div style="margin-left: 150px"><font id="emailCheckResult" color="red"></font></div> <br>
						<div style="margin-left: 400px">
							<input type="submit" class="btn btn-dark" value="회원가입" 
								style="margin-right: 350px" aria-describedby="basic-addon3">
						</div>
				</form>





				</td>
			</tr>
			<!--회원가입 하는 곳-->


		</table>
	</center>


	<script type="text/javascript">
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
						
						
						// 버튼 눌렀을 때 발생하는 색상 이벤트 
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
						
						//동의를 하는 자바스크립트 논리
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
					
					
					<script type="text/javascript">
					//유효성을 검사하는 자바스크립트
					
					
					   var request = new XMLHttpRequest();
		               var id;
		               
		               var idCheck = false;
		               var pwCheck = false;
		               var nameCheck = false;
		               var dateCheck = false;
		               var telCheck = false;
		               var placeCheck = false;
		               var emailCheck = false;
	                   
	                    function checkInputId(){  // 아이디 유효성 검사
	                    	
	                         document.getElementById('inputId').value = document.getElementById('inputId').value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|]/g, "");
	                         // 한글입력 제한
	                         document.getElementById('inputId').value = document.getElementById('inputId').value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
	                         // 특수문자 제한
	                         document.getElementById('inputId').value = document.getElementById('inputId').value.replace(/\s+$/,'');
	                         // 공백문자 제한
	                         // 뒤의 공백 제거          : str.replace(/\s+$/,'');
                             // 앞뒤 공백 제거          : str.replace(/^\s+|\s+$/g,'');
	                         
	                         var confirm  =  document.getElementById('inputId').value;
	                        
	                         //alert('db='+id+'\n'+'입력='+ document.getElementById('inputId').value);
	                         
	                        request.open("Post", "/JSPproject/UserSearchServlet?userName="+confirm,false);
		                    request.onreadystatechange = searchProcess;
		                    request.send(null);
	                         
	                         
	                         if(document.getElementById('inputId').value.length<4){
	                        	 document.getElementById('idCheckResult').setAttribute('color', "red")
	                        	 document.getElementById('idCheckResult').innerHTML = '아이디는 4글자 이상이어야 합니다.';
	                        	 idCheck = false;
	                         }else{
	                        	var regId = /[A-Za-z]/g;
	                        	 if(!regId.test(document.getElementById('inputId').value))
	                        	 {
	                        		 document.getElementById('idCheckResult').setAttribute('color', "red")
	                        	     document.getElementById('idCheckResult').innerHTML = '숫자로만 아이디를 입력할 수 없습니다.';
	                        		 idCheck = false;
	                        	 }else{
                                      
                                      if (confirm == id ) {
                                    	document.getElementById('idCheckResult').setAttribute('color', "red")
                                    	document.getElementById('idCheckResult').innerHTML = '이미 존재하는 아이디입니다.';
                                    	idCheck = false;
                                    	id = '';
									}else{
										 document.getElementById('idCheckResult').setAttribute('color', "green");
										document.getElementById('idCheckResult').innerHTML = '사용 가능한 아이디입니다.';
										idCheck = true;
									}
	                        	 }
	                         }
	                    }
		                    
		                    function searchProcess() {
		                    if (request.readyState == 4 && request.status ==200) {
		                    	var object = eval('('+request.responseText+')');
		                    	var result = object.result;
		                    	id = String(result);
		                     }
		                    }
		                    
	                         
	                    function checkInputPw(){  // 패스워드 유효성 검사
	                    	
	                         document.getElementById('inputPw').value = document.getElementById('inputPw').value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|]/g, "");
	                         // 한글입력 제한
	                         document.getElementById('inputPw').value = document.getElementById('inputPw').value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
	                         // 특수문자 제한
	                         document.getElementById('inputPw').value = document.getElementById('inputPw').value.trim();
	                         // 공백문자 제한
	                         document.getElementById('reInputPw').value = document.getElementById('reInputPw').value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|]/g, "");
	                         document.getElementById('reInputPw').value = document.getElementById('reInputPw').value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
	                         document.getElementById('reInputPw').value = document.getElementById('reInputPw').value.trim();
	                         // 뒤의 공백 제거          : str.replace(/\s+$/,'');
                            // 앞뒤 공백 제거          : str.replace(/^\s+|\s+$/g,'');
	                        
	                         if(document.getElementById('inputPw').value.length<4){
	                        	 //inputPw
	                        	 document.getElementById('pwCheckResult').setAttribute('color', "red");
	                        	 document.getElementById('reInputPw').setAttribute( 'disabled', "disabled");
	                        	 document.getElementById('pwCheckResult').innerHTML = '비밀번호는 4글자 이상입니다.';
	                        	 document.getElementById('reInputPw').value = null;
	                        	 pwCheck = false;
	                         }else{  
	                        	 document.getElementById('reInputPw').removeAttribute('disabled');   
	                        	 if(document.getElementById('inputPw').value == document.getElementById('reInputPw').value) {
	                        	
	                        		 document.getElementById('pwCheckResult').setAttribute('color', "green");
	                        		 document.getElementById('pwCheckResult').innerHTML = '비밀번호가 일치합니다.';
	                        		 pwCheck = true;
	                        	 }else{
	                        		 document.getElementById('pwCheckResult').setAttribute('color', "red");
	                        		 document.getElementById('pwCheckResult').innerHTML = '비밀번호가 불일치합니다.';
	                        		 pwCheck = false;
	                        	 }
	                         }
	                    }
	                    
	                    function checkInputName(){ // 이름 유효성 검사
	                        
	                         document.getElementById('InputName').value = document.getElementById('InputName').value.replace( /[0-9]/g, "");
	                         //숫자제한
	                         document.getElementById('InputName').value = document.getElementById('InputName').value.replace( /[A-Za-z]/g, "");
	                         // 영어입력 제한
	                         document.getElementById('InputName').value = document.getElementById('InputName').value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
	                         // 특수문자 제한
	                         document.getElementById('InputName').value = document.getElementById('InputName').value.trim();
	                         // 공백문자 제한
	                         // 뒤의 공백 제거          : str.replace(/\s+$/,''); /[A-Za-z]/g;
                           // 앞뒤 공백 제거          : str.replace(/^\s+|\s+$/g,'');
	                        
	                         if(document.getElementById('InputName').value.length<2){
	                        	 //inputPw
	                        	 document.getElementById('nameCheckResult').setAttribute('color', "red");
	                        	 document.getElementById('nameCheckResult').innerHTML = '이름은 2글자 이상입니다.';
	                        	 nameCheck = false;
	                         }else{  
	                        	 var regName = /[ㄱ-ㅎ|ㅏ-ㅣ]/g;
	                        	 if(regName.test(document.getElementById('InputName').value)){
	                        		 document.getElementById('nameCheckResult').setAttribute('color', "red");
	                        		 document.getElementById('nameCheckResult').innerHTML = '이름은 2글자 이상이며 , 자음만 사용은 불가능합니다.';
	                        		 nameCheck = false;
	                        	 }else{
	                        		 document.getElementById('nameCheckResult').setAttribute('color', "green");
	                        		 document.getElementById('nameCheckResult').innerHTML = '올바른 이름입니다.';
	                        		 nameCheck = true;
	                        	 }
	                         }
	                    }
	                    
	                    function checkInputDate(){ // 생년월일 유효성 검사
	                    	var regDate = /[0-9]/g;
	                    	if(regDate.test(document.getElementById('InputDate').value)){
	                    		 document.getElementById('dateCheckResult').setAttribute('color', "green");
                        		 document.getElementById('dateCheckResult').innerHTML = '올바른 날짜입니다.';
                        		 dateCheck = true;
	                    	}
	                    }
	                    
	                    function checkInputTel(){ // 전화번호 유효성 검사
	                    	//	telCheckResult / InputTel	
	                        
	                         document.getElementById('InputTel').value = document.getElementById('InputTel').value.replace( /[A-Za-z]/g, "");
	                         // 영어입력 제한
	                         document.getElementById('InputTel').value = document.getElementById('InputTel').value.replace( /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g,'');
	                         // 특수문자 제한
	                         document.getElementById('InputTel').value = document.getElementById('InputTel').value.trim();
	                         // 공백문자 제한
	                         document.getElementById('InputTel').value = document.getElementById('InputTel').value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'');
	                         // 한글입력 제한
	                         
	                         if(document.getElementById('InputTel').value.length>5){
	                        	 document.getElementById('telCheckResult').setAttribute('color', "green");
                        		 document.getElementById('telCheckResult').innerHTML = '올바른 전화번호 입니다.';
                        		 telCheck = true;
	                         }else{
	                        	 document.getElementById('telCheckResult').setAttribute('color', "red");
                        		 document.getElementById('telCheckResult').innerHTML = '전화번호를 다시 입력해 주세요.';
                        		 telCheck = false;
	                         }
	                    }
	                    
	                    
	                  
	                    function checkInputAddr(){ // 주소 유효성 검사
	                    //	addrCheckResult  / sample2_postcode /sample2_detailAddress
	                         
	                    	
	                    
	                         if(document.getElementById('sample2_postcode').value.length >0 && document.getElementById('sample2_detailAddress').value.length >0){
	                        	 document.getElementById('addrCheckResult').setAttribute('color', "green");
                        		 document.getElementById('addrCheckResult').innerHTML = '올바른 주소입니다.';
                        		  placeCheck = true;
	                         }else{
	                        	 document.getElementById('addrCheckResult').setAttribute('color', "red");
                        		 document.getElementById('addrCheckResult').innerHTML = '주소를 입력해 주세요.';
                        		  placeCheck = false;
	                         }
	                    }
	                    
	                    function checkInputEmail(){ // 이메일 주소 유효성 검사
	                    	//emailCheckResult / InputEmail
	                    	
	                    	var regEmail = /[@]/g;
	                    	var regEmail2 = /[.]/g;
	                    	
	                    	
	                    	document.getElementById('InputEmail').value = document.getElementById('InputEmail').value.replace( /[\{\}\[\]\/?,;:|\)*~`!^\-+<>\#$%&\\\=\(\'\"]/g,'');
	                        // 특수문자 제한 ('.' , '@' 제외)
	                        document.getElementById('InputEmail').value = document.getElementById('InputEmail').value.replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,'');
	                        // 한글입력 제한
	                        document.getElementById('InputEmail').value = document.getElementById('InputEmail').value.replace(/\s+$/,'');
	                        // 공백문자 제한
                            var tempCount = document.getElementById('InputEmail').value.match(/[@]/g);
	                    	if(regEmail.test(document.getElementById('InputEmail').value) && regEmail2.test(document.getElementById('InputEmail').value) && tempCount.length==1){
	                    	 document.getElementById('emailCheckResult').setAttribute('color', "green");
                        	 document.getElementById('emailCheckResult').innerHTML = '올바른 이메일 주소입니다.';
                        	 emailCheck = true;
	                    		
	                    	}else{
	                    	 document.getElementById('emailCheckResult').setAttribute('color', "red");
                       		 document.getElementById('emailCheckResult').innerHTML = '올바른 이메일 주소가 아닙니다.';
                       		 emailCheck = false;
	                    	 }
		                    }
	                    
	                    
	                    function finalCheck() {
	                    	//마지막 보내기전 유효성 검사
	                    	 if(idCheck == true && pwCheck == true && nameCheck == true && dateCheck == true &&  telCheck == true && placeCheck == true && emailCheck == true) {
	                    		 return true;
	                    		  }else{
	                    	       alert("올바른 회원가입 정보를 입력해 주세요.");
                 		           return false;
	                    		  }
	                    }
	      
						</script>
						
						

						
						   
				
</body>
</html>
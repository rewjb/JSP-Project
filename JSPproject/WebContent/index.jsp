<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    String redirectURI = URLEncoder.encode("http://localhost:9999/JSPproject/client/loginNaverPerform.jsp", "UTF-8");
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
						<!--메인 CPU 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="CPUbtn" onclick="clickMainBtn(CPUbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">CPU</button>
							<div class="dropdown-menu" aria-labelledby="CPUbtn">
								<a class="dropdown-item" href="#">CPU-1</a> <a
									class="dropdown-item" href="#">CPU-2</a>
							</div>
						</div>
						<!--메인 RAM 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="RAMbtn" onclick="clickMainBtn(RAMbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">RAM</button>
							<div class="dropdown-menu" aria-labelledby="RAMbtn">
								<a class="dropdown-item" href="#">RAM-1</a> <a
									class="dropdown-item" href="#">RAM-2</a>
							</div>
						</div>
						<!--메인 RAM 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="MAiNBOARDbtn" onclick="clickMainBtn(MAiNBOARDbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">메인보드</button>
							<div class="dropdown-menu" aria-labelledby="MAiNBOARDbtn">
								<a class="dropdown-item" href="#">메인보드-1</a> <a
									class="dropdown-item" href="#">메인보드-2</a>
							</div>
						</div>
						<!--메인 VGA 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="VGAbtn" onclick="clickMainBtn(VGAbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">VGA</button>
							<div class="dropdown-menu" aria-labelledby="VGAbtn">
								<a class="dropdown-item" href="#">VGA-1</a> <a
									class="dropdown-item" href="#">VGA-1</a>
							</div>
						</div>
						<!--메인 SSD 버튼 시작 -->
						<div class="btn-group" role="group">

							<button id="SSDbtn" onclick="clickMainBtn(SSDbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">SSD</button>
							<div class="dropdown-menu" aria-labelledby="SSDbtn">
								<a class="dropdown-item" href="#">SSD-1</a> <a
									class="dropdown-item" href="#">SSD-1</a>
							</div>
						</div>
						<!--메인 HDD 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="HDDbtn" onclick="clickMainBtn(HDDbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">HDD</button>
							<div class="dropdown-menu" aria-labelledby="HDDbtn">
								<a class="dropdown-item" href="#">HDD-1</a> <a
									class="dropdown-item" href="#">HDD-2</a>
							</div>
						</div>
						<!--메인 ODD 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="ODDbtn" onclick="clickMainBtn(ODDbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">ODD</button>
							<div class="dropdown-menu" aria-labelledby="ODDbtn">
								<a class="dropdown-item" href="#">ODD-1</a> <a
									class="dropdown-item" href="#">ODD-2</a>
							</div>
						</div>
						<!--메인 ODD 버튼 시작 -->
						<div class="btn-group" role="group">
							<button id="CASEbtn" onclick="clickMainBtn(CASEbtn);"
								style="width: 100px" type="button"
								class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">케이스</button>
							<div class="dropdown-menu" aria-labelledby="CASEbtn">
								<a class="dropdown-item" href="#">케이스-1</a> <a
									class="dropdown-item" href="#">케이스-2</a>
							</div>
						</div>
					</div> <!--↑메인버튼 그룹 종료-->
				</td>
			</tr>
			<!--↑ 메인버튼이 들어가 있는 1행 종료-->
			<!--↓ 속성분류 , 주된 내용이 들어가는 테이블 시작-->
			<tr>
				<!--↓ 메인화면에 로그인 구역-->
				<td width="200" align="center" rowspan="2">
					<div class="alert alert-dark  btn-light" role="alert">
					<form action="loginPerform.jsp" method="post">
					<input name="id" class="form-control" type="text" placeholder="아이디 입력">
					<input name="pw" class="form-control" type="text" placeholder="비밀번호 입력">
					<a href="joinForm.jsp"><button  type="button" class="btn-dark">회원가입</button></a>
					<input width="200"class=" btn-dark" type="submit" value="로그인">
					<!--↑ 네이버 로그인 연동해야함-->
					</form>
					
					네이버 로그인하기
					  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
					</div>
				</td>
				
				<td colspan="2">슬라이드 쇼</td>
			</tr>
			
			
			<tr>
			<td>
			 추천
			</td>
			<td>
			실시간 
			</td>
			
			</tr>
			<!--↑ 속성분류 , 주된 내용이 들어가는 테이블 종료-->
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</table>

		<script>
		<!--버튼 눌렀을 때 발생하는 색상 이벤트 -->
			var CPUbtn = document.getElementById('CPUbtn');
			var RAMbtn = document.getElementById('RAMbtn');
			var MAiNBOARDbtn = document.getElementById('MAiNBOARDbtn');
			var VGAbtn = document.getElementById('VGAbtn');
			var SSDbtn = document.getElementById('SSDbtn');
			var HDDbtn = document.getElementById('HDDbtn');
			var ODDbtn = document.getElementById('ODDbtn');
			var CASEbtn = document.getElementById('CASEbtn');
			var arrayBtn = Array(CPUbtn, RAMbtn, MAiNBOARDbtn, VGAbtn, SSDbtn,
					HDDbtn, ODDbtn, CASEbtn);
			function clickMainBtn(xBtn) {
				for (var i = 0; i < 8; ++i) {
					arrayBtn[i].className = "btn btn-secondary dropdown-toggle";
				}
				xBtn.className = "btn  btn-dark dropdown-toggle";
			}
		</script>




  
























	</center>
  
  </body>
</html>
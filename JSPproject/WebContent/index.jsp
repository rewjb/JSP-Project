<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>장민 유주빈 김정태</title>
</head>
<body>
	<center>
		<header class="btn-light"">유주빈</header>
		<table width="1000" height="130">
			<tr>
				<td colspan="2"><a href="#">조달청</a>|<a href="#">나라장터 </a>|<a
					href="#">목록정보 </a>|<a href="#">벤처나라</a></td>
			</tr>

			<tr>
				<td width="280">
					<!-- 로고 삽입  --> <img src="img/icon/logo.gif" alt="로고" title="로고" />
				</td>
				<td>
					<!-- 검색창 삽입  -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<select name="job" style="width: 300px"
								class="btn btn-outline-secondary dropdown-toggle">
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

		<table width="1080">
			<tr>
				<td colspan="3">
					<div class="btn-group" class="btn btn-primary">
						<button disabled="disabled" style="width: 200px" type="button"
							class="btn btn-secondary">세부항목</button>
						<button id="CPUbtn" onclick="clickMainBtn(CPUbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">CPU</button>
						<button id="RAMbtn" onclick="clickMainBtn(RAMbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">RAM</button>
						<button id="MAiNBOARDbtn" onclick="clickMainBtn(MAiNBOARDbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">메인보드</button>
						<button id="VGAbtn" onclick="clickMainBtn(VGAbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">VGA</button>
						<button id="SSDbtn" onclick="clickMainBtn(SSDbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">SSD</button>
						<button id="HDDbtn" onclick="clickMainBtn(HDDbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">HDD</button>
						<button id="ODDbtn" onclick="clickMainBtn(ODDbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">ODD</button>
						<button id="CASEbtn" onclick="clickMainBtn(CASEbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">케이스</button>
						<button id="POWERbtn" onclick="clickMainBtn(POWERbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">파워</button>
						<button id="KEYBOARDbtn" onclick="clickMainBtn(KEYBOARDbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">키보드</button>
						<button id="MOUSEbtn" onclick="clickMainBtn(MOUSEbtn);"
							style="width: 80px" type="button" class="btn btn-secondary">마우스</button>
					</div>
				</td>
			</tr>
			<tr>
				<td width="200">
					<div class="alert alert-primary" role="alert">
						This is a primary alert—check it out!<br>
					</div>
				</td>
				<td>
				asd
				</td>
				<td>
				asd
				</td>
			</tr>
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
			var POWERbtn = document.getElementById('POWERbtn');
			var KEYBOARDbtn = document.getElementById('KEYBOARDbtn');
			var MOUSEbtn = document.getElementById('MOUSEbtn');
			var arrayBtn = Array(CPUbtn, RAMbtn, MAiNBOARDbtn, VGAbtn, SSDbtn,
					HDDbtn, ODDbtn, CASEbtn, POWERbtn, KEYBOARDbtn, MOUSEbtn);
			function clickMainBtn(xBtn) {
				for (var i = 0; i < 11; ++i) {
					arrayBtn[i].className = "btn btn-secondary";
				}
				xBtn.className = "btn  btn-dark";
			}
		</script>


































	</center>
</body>
</html>
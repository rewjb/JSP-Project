<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품관리</title>
</head>
<body>
	<jsp:include page="adminTop.jsp"></jsp:include>



	<nav style="margin-top: 150px;">
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#productJoinForm" role="tab" aria-controls="nav-home" aria-selected="true">제품등록</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">제품목록</a>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="productJoinForm" role="tabpanel" aria-labelledby="nav-home-tab">
  
  
  
  <form action="productInserPerform.jsp" enctype="multipart/form-data" method="POST">
  	<!--제품 등록 테이블 -->
	<table style=";text-align: center;"   class="table" >
		<!--1행 -->
		<tr>
			<td>
			사진파일을 업로드 해주세요 : <input style="width:88px" type="file" id="myFile" name="myFile" accept="image/*" onchange="imgPreShow();" enctype="">

			</td>
			<td style="width:90px">제목</td><td style="widows: 500px"><input type="subject" id="subject" name="subject" style="width:250px" placeholder="필수입력 사항입니다." onkeyup="subjectCheck();"><br>
			<font color="red" id="subjectch"></font>  </td>
		</tr>
		<tr>
			<td rowspan="8">
			<img id="img" style="width: 300px;height: 300px;background: red" > 
			</td>
		</tr>
		<!--2행 -->      
		<tr style="height: 50px">
			<td style="height: 55px" >브랜드</td>
						<td><select name="brand">
								<option value="가이거" selected="selected">가이거</option>
								<option value="다니엘">다니엘</option>
								<option value="웰링턴 디젤(남)" >웰링턴 디젤(남)</option>
								<option value="루미녹스" >루미녹스</option>
								<option value="구찌" >구찌</option>
								<option value="DKNY">DKNY</option>
								<option value="마크제이콥스">마크제이콥스</option>
								<option value="커플시계" >커플시계</option>
						</select></td>
					</tr>
		<tr  style="height: 50px">
			<td >아이디</td><td style="width:250px"><input id="inputPID"  name="inputPID" type="text" style="width:250px" placeholder="필수입력 사항입니다." onkeyup="checkPID();"><br>
			<font color="red" id="inputPIDch"></font> </td><td style="text-align: left;"  ></td>
		</tr>
		<tr  style="height: 50px">
			<td >모델</td><td style="width:250px"><input id="model"  name="model" type="text" style="width:250px" placeholder="필수입력 사항입니다." onkeyup="modelCheck();"><br>
			<font color="red" id="modelch"></font> </td><td style="text-align: left;"></td>
		</tr>
		<tr style="height: 50px">
			<td >구성품</td><td><input type="text"  name="components"  style="width:250px"> </td>
		</tr>
		<tr style="height: 50px">
			<td>판매가</td><td><input id="price" name="price" type="text" style="width:250px" onkeyup="calSaveMoney();" placeholder="필수입력 사항입니다."><br>
			<font color="red" id="pricech"></font> </td>
		</tr>
		<tr style="height: 50px">
			<td>적립금</td><td><input id="saveMoney" name="saveMoney" type="text" style="width:250px" readonly="readonly"> </td>
		</tr>
		<tr style="height: 50px">
			<td>배송비</td><td><input type="text" name="delMoney" id="delMoney" style="width:250px" onkeyup="checkDelMoney();"> </td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: right;"><input type="submit" value="등록하기" onclick="return finalCheck();"></td>
		</tr>
	</table>
  </form>
  
  
  
  </div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">제품목록</div>
</div>




<script type="text/javascript">

 var modeltrue = false;
 var subjecttrue = false;
 var moneytrue = false;
 var PIDtrue = false;
 
 
 


	
	function finalCheck() {

		if (modeltrue == false || subjecttrue == false || moneytrue == false
				|| PIDtrue == false) {
			
			alert('입력 조건을 만족시켜 주세요.');
			  return false;
		}else{
			  return true;
		}
	}

	function modelCheck() {

		var model = document.getElementById('model');
		var modelch = document.getElementById('modelch');

		if (model.value.length > 3) {
			modelch.setAttribute('color', 'green');
			modelch.innerHTML = '사용이 가능한 모델명입니다.';
			modeltrue = true;
		} else {
			modelch.setAttribute('color', 'red');
			modelch.innerHTML = '4글자 이상부터 가능합니다.';
			modeltrue = false;
		}

	}

	function subjectCheck() {
		var subject = document.getElementById('subject');
		var subjectch = document.getElementById('subjectch');
		if (subject.value.length > 3) {
			subjectch.setAttribute('color', 'green');
			subjectch.innerHTML = '사용이 가능한 제목입니다.';
			subjecttrue = true;
		} else {
			subjectch.setAttribute('color', 'red');
			subjectch.innerHTML = '4글자 이상부터 가능합니다.';
			subjecttrue = false;
		}
	}

	function calSaveMoney() {

		var price = document.querySelector('#price');
		var saveMoney = document.querySelector('#saveMoney');
		var pricech = document.getElementById('pricech');

		price.value = price.value.replace(/[A-Za-z]/g, "");
		// 영어입력 제한
		price.value = price.value.replace(
				/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g, '');
		// 특수문자 제한
		price.value = price.value.trim();
		// 공백문자 제한
		price.value = price.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
		// 한글입력 제한

		saveMoney.value = Math.floor(Number(price.value) * 0.03);

		if (price.value.length > 0) {
			pricech.setAttribute('color', 'green');
			pricech.innerHTML = '조건을 만족하셨습니다.';
			moneytrue = true;
		} else {
			pricech.setAttribute('color', 'red');
			pricech.innerHTML = '1글자 이상이어야 가능합니다.';
			moneytrue = false;
		}

	}

	function checkDelMoney() {

		var delMoney = document.querySelector('#delMoney');

		delMoney.value = price.value.replace(/[A-Za-z]/g, "");
		// 영어입력 제한
		delMoney.value = price.value.replace(
				/[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/g, '');
		// 특수문자 제한
		delMoney.value = price.value.trim();
		// 공백문자 제한
		delMoney.value = price.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
		// 한글입력 제한

	}

	function imgPreShow() {
		//이미지 등록 !

		var file = document.getElementById("myFile");

		var fileList = file.files;
		var Freader = new FileReader();
		Freader.readAsDataURL(fileList[0]);

		//파일을 다 읽으면  바로 실행!
		Freader.onload = function() {
			var img = document.getElementById('img');
			img.src = Freader.result;
		}
	}

	var request = new XMLHttpRequest();
	var DBpid;
	var inputPid

	function checkPID() {
		DBpid = null;
		inputPid = document.getElementById('inputPID');
		inputPid.value = inputPid.value.trim();
		// 공백문자 제한
		if (inputPid.value.length > 3) {
			request.open("Post", "/JSPproject/PIDSearchServlet?PID="
					+ inputPid.value, false);
			request.onreadystatechange = searchProcess;
			request.send(null);
		} else {
			var inputPidch = document.getElementById('inputPIDch');
			inputPidch.setAttribute('color', 'red');
			inputPidch.innerHTML = '4글자 이상이어야 합니다.';
			PIDtrue = false;
		}
	}

	function searchProcess() {

		if (request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			DBpid = String(result);
			if (DBpid == inputPid.value) {
				var inputPidch = document.getElementById('inputPIDch');
				inputPidch.color = 'red';
				inputPidch.innerHTML = '해당 아이디가 이미 존재합니다.';
				PIDtrue = false;
			} else {
				var inputPidch = document.getElementById('inputPIDch');
				inputPidch.color = 'green';
				inputPidch.innerHTML = '사용 가능한 아이디입니다.';
				PIDtrue = true;
			}
		}
	}

	//inputPid = document.querySelector('#inputPID');
</script>





</body>
</html>
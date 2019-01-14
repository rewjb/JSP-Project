<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<input type="file"  id="temp"> 

<button onclick="changeTrue();">dd</button>


<script type="text/javascript">
function changeTrue() {
	
	var requestUpdate = new XMLHttpRequest();
		
		var file  = document.getElementById('temp');
		var fileList = file.files;
		
		
//		var data = new FormData(document.getElementById(inputCom.form.id));
//      이거 .. 오류는 없지만 작동이 안된다..
		var data = new FormData();
		data.append('img', fileList[0]);
		
		
		requestUpdate.open("POST", "/JSPproject/test", false);
		requestUpdate.onreadystatechange = searchProcess;
		requestUpdate.send(data);
	
	function searchProcess() {
		if (requestUpdate.readyState == 4 && requestUpdate.status == 200) {
			alert('수정이 완료되었습니다.');
		}
	}
}
</script>
</body>
</html>
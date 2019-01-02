<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input oninput="searchFunction();" id="userName" type="text" placeholder="테스트 중입니다." >

<h1 id="test">

</h1>
								

<script type="text/javascript">
var request = new XMLHttpRequest();
var id ;

function searchFunction() {

	  request.open("Post", "/JSPproject/UserSearchServlet?userName=" + encodeURIComponent(document.getElementById("userName").value),true);
	  request.onreadystatechange = searchProcess;
	  request.send(null);
	}

function searchProcess() {
	
if (request.readyState == 4 && request.status ==200) {
	
	var object = eval('('+request.responseText+')');
	var result = object.result;
	id  = result;
	alert(id);
	document.getElementById("test").innerHTML += ''+id;
}
	
}
</script>










</body>
</html>
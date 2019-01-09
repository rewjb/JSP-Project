<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		session.removeAttribute("id");
	%>
	
	<iframe style="width: 0px;height: 0px" src="https://nid.naver.com/nidlogin.logout" onload="logOutFinish();"></iframe>
	
	
	<script type="text/javascript">
	function logOutFinish() {
		
		location.href = '/JSPproject/index.jsp';
	}
	</script>









</body>
</html>
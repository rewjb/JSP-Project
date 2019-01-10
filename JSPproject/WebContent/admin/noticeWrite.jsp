<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.ProductDTO"%>
<%@ page import="dtodao.CartDAO"%>
<jsp:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="adminTop.jsp"></jsp:include>


				<form action="insert.jsp" method="post" >
				작성자 :  관리자 <br><br/>
				<!-- 작성자 항상 고정되게 하기 -->
				날짜 :  <input id="date" type="text" name="time"/> <br><br/>
				제목 :  <input id="subject" type="text" name="title"/> <br><br/>
				
				<textarea id="content" rows="20" cols="130" name="content"></textarea><br/>
				<input type="submit" onclick="return checkContent();"/> 
				</form>


<script>

function checkContent() {
	
	
	var temp1 = document.getElementById('date');
	var temp2 = document.getElementById('subject');
	var temp3 = document.getElementById('content');
	
	if (temp1.value.length == 0 || temp2.value.length == 0 || temp3.value.length == 0) {
		
		alert('작성하지 않은 내용이 있습니다.');
		
		return false;
		
	}else {
		
		return true;
	}
	
	
}

</script>




</body>
</html>
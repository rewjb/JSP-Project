<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dtodao.ProductDAO"%>
<%@ page import="dtodao.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품관리</title>
</head>
<body>

	<jsp:include page="adminTop.jsp"></jsp:include>

	<%
		String path = "D:\\WebDeveloper-Jangmin2\\workspace\\JSP-Project\\JSPproject\\WebContent\\img\\Cimage";
	
		ProductDTO productDTO = new ProductDTO();

		MultipartRequest mr = new MultipartRequest(request, path, 1100 * 6000, "UTF-8",
				new DefaultFileRenamePolicy());

		String brand = mr.getParameter("brand");
		String modelName = mr.getParameter("model");
		String subject = mr.getParameter("subject");
		String inputPID = mr.getParameter("inputPID");
		int price = Integer.parseInt(mr.getParameter("price"));
		int saveMoney = Integer.parseInt(mr.getParameter("saveMoney"));
		String components;
		int delMoney;

		try {
			components = mr.getParameter("components");
		} catch (Exception e) {
			components = "";
		}
		
		try {
			delMoney = Integer.parseInt(mr.getParameter("delMoney"));
		} catch (Exception e) {
			delMoney = 0;
		}

		try {
			productDTO.setImgaddr("/JSPproject/img/Cimage/"+ mr.getFilesystemName("myFile"));
		} catch (Exception e) {
			productDTO.setImgaddr("");
		}

		productDTO.setBrand(brand);
		productDTO.setName(subject);
		productDTO.setId(inputPID);
		productDTO.setModelName(modelName);
		productDTO.setComponents(components);
		productDTO.setPrice(price);
		productDTO.setSaveMoney(saveMoney);
		productDTO.setDeliverPrice(delMoney);

	    ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list.add(productDTO);

		ProductDAO.getInstance().joinProduct(list);
	%>

	<!-- 확인용  -->
    	<div style="margin-top: 300px">
		1.
		<%=brand%><br> 2.
		<%=modelName%><br> 3.
		<%=subject%><br> 4.
		<%=inputPID%><br> 5.
		<%=components%><br> 6.
		<%=price%><br> 7.
		<%=saveMoney%><br> 8.
		<%=delMoney%><br> 9.
		<%=path + "\\" + mr.getFilesystemName("myFile")%><br>
		<%="/JSPproject/img/Dimage/" + mr.getFilesystemName("myFile")%><br>
	</div> 
	
	
	
<script type="text/javascript">
//location.href = '/JSPproject/admin/productManager.jsp';
</script>
	
	
	


</body>
</html>
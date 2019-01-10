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
	
   String path = "C:\\Users\\user\\git\\JSP-Project\\JSPproject\\WebContent\\img\\Dimage";

   ProductDTO productDTO = new ProductDTO();
   
   MultipartRequest mr = new MultipartRequest(request, path, 1100 * 6000, "UTF-8",new DefaultFileRenamePolicy());
   
   String  brand = mr.getParameter("brand");
   String  modelName = mr.getParameter("model");
   String  subject = mr.getParameter("subject");
   String  inputPID = mr.getParameter("inputPID");
   String  components = mr.getParameter("components");
   int  price;
   int  saveMoney;
   int  delMoney;
   
   if(request.getParameter("price")==null){
	   price=0;
   }else{
	   price=Integer.parseInt(mr.getParameter("price"));
   }
   if(request.getParameter("saveMoney")==null){
	   saveMoney=0;
   }else{
	   saveMoney=Integer.parseInt(mr.getParameter("saveMoney"));
   }
   if(request.getParameter("delMoney")==null){
	   delMoney=0;
   }else{
	   delMoney=Integer.parseInt(mr.getParameter("delMoney"));
   }

   productDTO.setBrand(brand);
   productDTO.setName(subject);
   productDTO.setId(inputPID);
   productDTO.setModelName(modelName);
   productDTO.setComponents(components);
   productDTO.setPrice(price);
   productDTO.setSaveMoney( saveMoney);
   productDTO.setDeliverPrice(delMoney);
   productDTO.setImgaddr(path+"\\"+mr.getFilesystemName("myFile"));
%>

	<div style="margin-top: 300px">

		1. <%=brand %><br> 
		2. <%=modelName %><br> 
		3. <%=subject %><br> 
		4. <%=inputPID %><br>
		5. <%=components %><br> 
		6. <%=price %><br> 
		7. <%=saveMoney %><br> 
		8. <%= delMoney%><br> 
		9. <%= path+"\\"+mr.getFilesystemName("myFile")%><br>
	</div>


</body>
</html>
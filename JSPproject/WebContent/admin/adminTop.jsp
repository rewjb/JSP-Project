<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="dtodao.ProductDTO"%>
<jsp:useBean id="productDAO" class="dtodao.ProductDAO" />
<!DOCTYPE html>

<html>
<head>
<title>제품 목록 리스트</title>

<jsp:include page="../Header.jsp"></jsp:include>

</head>
<body style="max-width: 1100px; margin: 0 auto;">
	<%

		String brand = request.getParameter("brand");
		int paging;
		int index;
		
		try {
			paging = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			paging = 1;
		}

		
		
		
		ArrayList<ProductDTO> productList;

		if (brand == null) {
			productList = productDAO.openProductPage("가이거");
			brand ="가이거";
		} else {

			if (brand.equals("danielm")) {
				productList = productDAO.openProductPage("다니엘 웰링턴(남)");
				brand ="다니엘 웰링턴(남)";
			} else if (brand.equals("digel")) {
				productList = productDAO.openProductPage("디젤");
				brand ="디젤";
			} else if (brand.equals("loomi")) {
				productList = productDAO.openProductPage("루미눅스");
				brand ="루미눅스";
			} else if (brand.equals("gucci")) {
				productList = productDAO.openProductPage("구찌");
				brand ="구찌";
			} else if (brand.equals("danielf")) {
				productList = productDAO.openProductPage("다니엘 웰링턴(여)");
				brand ="다니엘 웰링턴(여)";
			} else if (brand.equals("dkny")) {
				productList = productDAO.openProductPage("DKNY");
				brand ="DKNY";
			} else if (brand.equals("mike")) {
				productList = productDAO.openProductPage("마크제이콥스");
				brand ="마크제이콥스";
			} else if (brand.equals("couple")) {
				productList = productDAO.openProductPage("커플시계");
				brand ="커플시계";
			} else {
				productList = productDAO.openProductPage("가이거");
				brand ="가이거";
			}
		}
		int productCount = productList.size();
	%>





	<div align="center">
		<!-- 본문 시작 -->
		<div style="margin: 0 auto; max-width: 1100px; width: 100%;">
			<div
				style="background: white; z-index: 1; position: fixed; top: 0px; margin: 0 auto;">

				<table width="1000px" style="position: relative; margin: 0 auto;">
					<tr>
						<td width="280">
							<!-- 로고 삽입  --> <img src="/JSPproject/img/icon/logo.jpg" alt="로고"
							title="로고" />
						</td>
						<td>
							<!-- 검색창 삽입  -->
						<div class="input-group mb-3" method="GET">
							<form action="/JSPproject/client/searchProductList.jsp">
								<div class="input-group-prepend">
									<select name="searchType" style="width: 300px" class="custom-select">
										<option value="subject" class="dropdown-item">제목</option>
										<option value="brand" class="dropdown-item">브랜드</option>
									</select> <input name="content" type="text" width="500" class="form-control"> <input
										type="submit" class="btn btn-outline-secondary" value="검색">
								</div>
							</form>
							</div>
						</td>
					</tr>
				</table>
				<!-- 테이블 종료 -->




				<!-- 테이블 시작 : 메인버튼 및 전체적인 내용 넣기 -->

				<table width="1000px">
					<!--↓ 메인버튼이 들어가 있는 1행 시작-->
					<tr>
						<td colspan="3">
							<!--↓메인버튼 그룹 시작-->
							<div class="btn-group" role="group"
								aria-label="Button group with nested dropdown">
								<!--회원관리 버튼 활성화 -->
									<div class="btn-group" role="group">
									<button id="MBest" onclick="clickMainToggleBtn(MBest);"
										style="width: 275px" type="button"
										class="btn btn-secondary "
										data-toggle="dropdown">회원관리</button>
								</div>
								<!--메인 MBest 버튼 시작 -->
								<div class="btn-group" role="group">
									<button id="MBest" onclick="clickMainToggleBtn(MBest);"
										style="width: 275px" type="button"
										class="btn btn-secondary "
										data-toggle="dropdown">상품관리</button>
								</div>
								<!--메인 FBest 버튼 시작 -->
								<div class="btn-group" role="group">
									<button id="FBest" onclick="clickMainToggleBtn(FBest);"
										style="width: 275px" type="button"
										class="btn btn-secondary "
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">매출관리</button>
								</div>
								<!--메인 CBest 버튼 시작 -->
								<div class="btn-group" role="group">
									<a
										href="/JSPproject/client/productList.jsp?brand=couple&page=1"><button
											id="CBest" onclick="clickMainBtn(CBest);"
											style="width: 275px" type="button" class="btn btn-secondary ">공지사항</button></a>
								</div>
							</div>
						</td>
					</tr>
					<!--↑ 메인버튼이 들어가 있는 1행 종료-->

				</table>
			</div>
		</div>

		<nav aria-label="breadcrumb" style="margin-top: 140px"> 
			<ol class="breadcrumb" align="right">

				<li class="breadcrumb-item"><a href="#">관리자 페이지</a></li>



			</ol>
		</nav>
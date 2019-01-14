<%@page import="dtodao.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="dtodao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<jsp:include page="adminTop.jsp"></jsp:include>

<%
MemberDAO mdao = new MemberDAO();

Vector<MemberDTO> vec = mdao.getAllMember();
%>

										<h1 style="position: relative; top: 200px;">회원 관리 리스트</h1>


	<div class="container"
		style="position: relative; top: 230px; left: 10px; width: 100%; height: 700px; overflow: auto;">

		<div class="row">
			<div class="col-lg-4 col-lg-offset-4">
				<input type="search" id="search" value="" class="form-control"
					placeholder="Search using Fuzzy searching">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<table class="table" id="table"
					style="margin: auto; text-align: center;">
					<thead>
						<tr>
							<th width="50px;">아이디</th>
							<th width="100px;">이름</th>
							<th width="100px;">비밀번호</th>
							<th>생일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>
						<%
		                	for(int i = 0; i <vec.size(); i++){
		                		MemberDTO mdto = vec.get(i);
		                %>
						<tr>

							<td>
							<!-- 모달기능을 이용하여 리뷰 내용이 버튼으로 안으로 들어가게  만듬 -->
							<span style="FONT-SIZE: 11pt;"> 

							<button type="button" class="btn btn-link btn-xs" data-toggle="modal" data-target="#<%=mdto.getId()%>" onclick="">
							<p><%=mdto.getId()%></p>
							</button>
							</span>
								<div class="modal fade" id="<%=mdto.getId()%>" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLongTitle"
									aria-hidden="true">

									<div class="modal-dialog" role="document">
									
										<form action="updateMember.jsp">
											<div class="modal-content" style="width: 500px; height: 600px;">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle" style="position: relative; left: 150px;">회원  상세 정보</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true"></span>
													</button>
												</div>


												<!--모달 바디에 세뷰 리뷰 내용 출력-->
												<div class="modal-body">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">아&nbsp;&nbsp;이&nbsp;&nbsp;디 </span>
														</div>
														<input type="text" class="form-control" id="mid" name="mid" maxlength="15" value="<%=mdto.getId() %>" readonly="readonly">
													</div>
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">비밀번호</span>
														</div>
														<input id="pw" name="pw" type="password" class="form-control" maxlength="15" value="<%=mdto.getPw()%>" readonly="readonly">
													</div>
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</span>
														</div>
														<input id="name" name="name" type="text" class="form-control"  maxlength="6" value="<%=mdto.getName()%>" readonly="readonly">
													</div>
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</span>
														</div>
														<input id="birthday" name="birthday" type="text" class="form-control"  maxlength="6"  value="<%=mdto.getBirthDay()%>" readonly="readonly">
													</div>
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">전화번호</span>
														</div>
														<input id="birthday" name="tel" type="text" class="form-control"  maxlength="6"  value="<%=mdto.getTel()%>">
													</div>
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<span class="input-group-text">이&nbsp;&nbsp;메&nbsp;&nbsp;일</span>
														</div>
														<input id="birthday" name="email" type="text" class="form-control"  maxlength="6"  value="<%=mdto.getEmail()%>">
													</div>
													
													<!--주소 설정 부분 -->
													<input type="text" id="sample6_postcode" placeholder="우편번호" style="position: relative; right: 80px;">
													<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="position: relative; right: 80px;"><br>
													<input type="text" name="addr1" id="sample6_address" value="<%=mdto.getAddr()%>" style="position: relative; right: 5px; width: 450px;"><br>
													<input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소" style="position: relative; right: 5px; width: 450px;">
													<input type="text" id="sample6_extraAddress" placeholder="참고항목"  style="position: relative; right: 5px; width: 450px;">
													
													
													<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
													<script>
													    function sample6_execDaumPostcode() {
													        new daum.Postcode({
													            oncomplete: function(data) {
													                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
													
													                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
													                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
													                var addr = ''; // 주소 변수
													                var extraAddr = ''; // 참고항목 변수
													
													                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													                    addr = data.roadAddress;
													                } else { // 사용자가 지번 주소를 선택했을 경우(J)
													                    addr = data.jibunAddress;
													                }
													
													                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
													                if(data.userSelectedType === 'R'){
													                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
													                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
													                        extraAddr += data.bname;
													                    }
													                    // 건물명이 있고, 공동주택일 경우 추가한다.
													                    if(data.buildingName !== '' && data.apartment === 'Y'){
													                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
													                    }
													                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													                    if(extraAddr !== ''){
													                        extraAddr = ' (' + extraAddr + ')';
													                    }
													                    // 조합된 참고항목을 해당 필드에 넣는다.
													                    document.getElementById("sample6_extraAddress").value = extraAddr;
													                
													                } else {
													                    document.getElementById("sample6_extraAddress").value = '';
													                }
													
													                // 우편번호와 주소 정보를 해당 필드에 넣는다.
													                document.getElementById('sample6_postcode').value = data.zonecode;
													                document.getElementById("sample6_address").value = addr;
													                // 커서를 상세주소 필드로 이동한다.
													                document.getElementById("sample6_detailAddress").focus();
													            }
													        }).open();
													    }
													</script>
					

												</div>
												<div class="modal-footer">

													<input type="hidden" name="mid"> 
													<input type="hidden" name="name"> 
													<input type="hidden" name="pw"> 
													<input type="hidden" name="birthday">  
													<input type="hidden" name="tel"> 
													<input type="hidden" name="email"> 
													<input type="hidden" name="addr1">
													<input type="hidden" name="addr2">													
													<button type="submit" class="btn btn-secondary">수정완료</button>
													<button type="button" class="btn btn-secondary" onclick="location.href='deleteMember.jsp?id=<%=mdto.getId()%>'">탈퇴처리</button>
													<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
												</div>
											</div>
										</form>
									</div>
								</div></td>
							<td style='text-align: center; vertical-align: middle'><%=mdto.getName() %></td>
							<td style='text-align: center; vertical-align: middle'><%=mdto.getPw() %>***</td>
							<td style='text-align: center; vertical-align: middle'><%=mdto.getBirthDay() %></td>
							<td style='text-align: center; vertical-align: middle'><%=mdto.getTel() %></td>
							<td style='text-align: center; vertical-align: middle'><%=mdto.getAddr() %></td>
							<td style='text-align: center; vertical-align: middle'><%=mdto.getEmail() %></td>
						</tr>
						<%
		                	}
		                 %>
					</tbody>
				</table>
				<hr>
			</div>
		</div>
	</div>


<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
<script type="text/javascript">
$(function () {
    $( '#table' ).searchable({
        striped: true,
        oddRow: { 'background-color': '#f5f5f5' },
        evenRow: { 'background-color': '#fff' },
        searchType: 'fuzzy'
    });
    
    $( '#searchable-container' ).searchable({
        searchField: '#container-search',
        selector: '.row',
        childSelector: '.col-xs-4',
        show: function( elem ) {
            elem.slideDown(100);
        },
        hide: function( elem ) {
            elem.slideUp( 100 );
        }
    })
});
</script>
</body>
</html>
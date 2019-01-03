  	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lz0e8vpjrz5ApswJPUqL&submodules=geocoder"></script>

	<jsp:include page="/WEB-INF/view/admin/include/admin_page_header.jsp"/>
	
	<section id="adminpage">
		<div class="#wrap">
			<div class="container">
				<!-- 왼쪽 메뉴바 -->
				
				<jsp:include page="/WEB-INF/view/admin/include/admin_menu_nav.jsp"/>
				
				<!-- 컨텐츠바디 -->
				<div class="admin_main_right col-md-9">
					<div class="notices">
					<form action="${pageContext.request.contextPath }/admin_user_list" method="post">
						<div class="tables">
	
							<table>
						
								<tbody>
									<tr>
										<th>체크박스</th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>이름</th>
										<th>생일</th>
										<th>성별</th>
										<th>전화번호</th>
										<th>맴버등급</th>
										<th>가입날자</th>
										<th>프로필사진</th>
										<th>이메일</th>
										<th>우편번호</th>
										<th>주소</th>
										<th>상세주소</th>
										<th>타입</th>
									</tr>
									<c:forEach items="${user_list }" var="user_list" varStatus="status">
									<tr>
										<td><input type="checkbox"></td>
										<td>${user_list.member_id}</td>
										<td>${user_list.member_password}</td>
										<td>${user_list.member_name}</td>
										<td>${user_list.member_birthday}</td>
										<td>${user_list.member_gender}</td>
										<td>${user_list.member_phone}</td>
										<td>${user_list.member_trip_exp}</td>
										<td>${user_list.member_register_date}</td>
										<td>${user_list.member_profile_pic}</td>
										<td>${user_list.member_email}</td>
										<td>${user_list.member_Zip_code}</td>
										<td>${user_list.member_Street_name_address}</td>
										<td>${user_list.member_Detailed_Address}</td>
										<td>${user_list.member_type}</td>
										
									</tr>
									</c:forEach>
								</tbody>
							</table>
	
					
							<!-- 테이블 하단 -->
							<!-- 검색및 페이징 -->
							<div>
								<div>[1][2][3]</div>
								<div>
									<input type="text" >
									
								</div>
							</div>
							<!-- 버튼 -->
							<div class="btns row">
								<div class="btn btn1">
									<a href="#" class="alink"> <input type="button" name="cartin"
										value="삭제하기">
									</a>
								</div>
								<div class="btn btn1">
									<a href="#" class="alink"> <input type="button" name="cartin"
										value="수정하기">
									</a>
								</div>
								<div class="btn btn2">
									<a href="#" class="alink"> <input type="button" name="more"
										value="글쓰기">
									</a>
								</div>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		
	

	</section>
	<jsp:include page="/WEB-INF/view/admin/include/admin_page_footer.jsp"/>



	

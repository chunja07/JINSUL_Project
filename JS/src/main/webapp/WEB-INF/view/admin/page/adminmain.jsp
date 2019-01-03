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
					<form>
						<div class="tables">
	
							<table>
						
								<tbody>
									<tr>
										<th>번호</th>
										<th style="width: 70%;">내용</th>
										<th>아이디</th>
										<th>작성일</th>
									</tr>
										<td>인덱스</td>
										<td>잘했지 놀랍지 신기하지</td>
										<td>어드민</td>
										<td>날자</td>
										
									</tr>
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


	

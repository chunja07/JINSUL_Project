  	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<form action="${pageContext.request.contextPath }/admin_noticesubmit" method="post" enctype="multipart/form-data">
						<div class="table">
							
							<!-- 테이블시작 -->
							<table>
								<tbody>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" name="title">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
											<textarea rows="20" cols="80" name="content"></textarea>
										</td>
									</tr>
									<tr>
										<th>이미지</th>
										<td>
											<input type="file" name="files" multiple="multiple"> 
										</td>
									</tr>
								</tbody>
							</table>
					
							<!-- 버튼 -->
							<div class="btns row">
								<div class="btn btn1">
									<a href="${pageContext.request.contextPath }/admin_notice" class="alink">
										<input type="button" name="cancel" value="취소하기">
									</a>
									
								</div>
								
								<div class="btn btn2">
									<a href="#" class="alink">
										<input type="submit" name="submit" value="글쓰기">
									</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
	

	</section>
	<jsp:include page="/WEB-INF/view/admin/include/admin_page_footer.jsp"/>


<script>

$('[id^="notice"]').on('click', function(e) {
    $('.noticeview').hide();
    
    $('.'+ this.id).show();
    
});


</script>

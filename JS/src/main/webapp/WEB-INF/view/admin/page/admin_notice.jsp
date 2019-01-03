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
					<form action="${pageContext.request.contextPath }/admin_notice" method="post">
						<div class="tables">
							<table>
						
								<tbody>
									<tr>
										<th>check</th>
										<th>Index</th>
										<th>Title</th>
										<th>Id</th>
										<th>Day</th>
									</tr>
									<c:forEach items="${notice}" var="list" varStatus="status">
									<tr id="notice${status.index}">
										<td>
											<input type="checkbox" value="${list.notice_id}" name="d_notice_id" class="d_notice_id">
										</td>
										<td>${list.notice_id}</td>
										<td class="taget">
											${list.notice_title}
										</td>
										<td>${list.member_id}</td>
										<td>${list.notice_date}</td>
									</tr>
									<tr class="notice${status.index} noticeview" style="display: none;">
										<td colspan="5">
											<img src="${list.notice_img}" style="width: 200px;">
											<br>
											${list.notice_content}
										</td>
									</tr>
									
									</c:forEach>
								</tbody>
									<!-- 테이블 하단 -->
								
							</table>
							<div id="pasing" style="text-align: center">
							   <c:if test="${ page != 1 }">   
							      <a href="${pageContext.request.contextPath}/admin_notice">처음</a>
							   </c:if>   
							
							   <c:if test="${ startPage != 1 }">   
							      <a href="${pageContext.request.contextPath}/admin_notice?page=${startPage-1}">이전</a>
							   </c:if>      
							
							   <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							   <c:if test="${ i == page }" var="result">   
							      <b>${ i }</b>
							   </c:if>         
							   <c:if test="${ not result }">   
							      <a href="${pageContext.request.contextPath}/admin_notice?page=${i}">${ i }</a>
							   </c:if>         
							   </c:forEach>
							
							   <c:if test="${ endPage != totalPage }">   
							      <a href="${pageContext.request.contextPath}/admin_notice?page=${endPage+1}">다음</a>
							   </c:if>   
							
							   <c:if test="${ page != totalPage }">   
							      <a href="${pageContext.request.contextPath}/admin_notice?page=${totalPage}">끝</a>
							   </c:if>      
							</div>
	
					
						
							<!-- 검색및 페이징 -->
							
							<!-- 버튼 -->
							<div class="btns row">
								<div class="btn btn1">
									<a href="#" class="alink">
										<input type="submit" name="cartin" value="삭제하기">
									</a>
									
								</div>
								<div class="btn btn2">
									<a href="${pageContext.request.contextPath}/admin_noticesubmit" class="alink">
										<input type="button" name="cartin" value="글쓰기">
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


<script>



 $('[id^="notice"]').on('click', function(e) {
    $('.noticeview').hide();
    
    $('.'+ this.id).show();
    
});
 
 
//배열 선언
 var arrayParam = new Array();
 //each로 loop를 돌면서 checkbox의 check된 값을 가져와 담아준다.
 $("input:checkbox[name=d_notice_id]:checked").each(function(){
 	arrayParam.push($(this).val());
 });


 
 
 


</script>

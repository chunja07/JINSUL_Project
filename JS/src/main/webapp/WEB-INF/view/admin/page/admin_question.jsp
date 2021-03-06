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
					<form action="${pageContext.request.contextPath }/admin_question" method="post">
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
									<c:forEach items="${question}" var="list" varStatus="status">
									<tr id="admin_question${status.index}">
										<td>
											<input type="checkbox" value="${list.question_id}" name="d_question_id" class="d_question_id">
										</td>
										<td>${list.question_id}</td>
										<td class="taget">
											${list.question_title}
										</td>
										<td>${list.member_id}</td>
										<td>${list.question_date}</td>
									</tr>
									<tr class="admin_question${status.index} admin_questionview" style="display: none;">
										<td colspan="5">
											${list.question_content}
										</td>
									</tr>
									<tr class="admin_question${status.index} admin_questionview" style="display: none;">
										<td>
											리플 : <input type="text" name="text">
										</td>
									</tr>
									
									</c:forEach>
								</tbody>
									<!-- 테이블 하단 -->
								
							</table>
							
							<!-- 검색및 페이징 -->
							
							<div id="pasing" style="text-align: center">
							   <c:if test="${ page != 1 }">   
							      <a href="${pageContext.request.contextPath}/admin_question">처음</a>
							   </c:if>   
							
							   <c:if test="${ startPage != 1 }">   
							      <a href="${pageContext.request.contextPath}/admin_question?page=${startPage-1}">이전</a>
							   </c:if>      
							
							   <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							   <c:if test="${ i == page }" var="result">   
							      <b>${ i }</b>
							   </c:if>         
							   <c:if test="${ not result }">   
							      <a href="${pageContext.request.contextPath}/admin_question?page=${i}">${ i }</a>
							   </c:if>         
							   </c:forEach>
							
							   <c:if test="${ endPage != totalPage }">   
							      <a href="${pageContext.request.contextPath}/admin_question?page=${endPage+1}">다음</a>
							   </c:if>   
							
							   <c:if test="${ page != totalPage }">   
							      <a href="${pageContext.request.contextPath}/admin_question?page=${totalPage}">끝</a>
							   </c:if>      
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



 $('[id^="admin_question"]').on('click', function(e) {
    $('.admin_questionview').hide();
    
    $('.'+ this.id).show();
    
});
 
 
 
 
 


</script>

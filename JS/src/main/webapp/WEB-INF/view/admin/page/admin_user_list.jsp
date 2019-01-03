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
					<form action="${pageContext.request.contextPath }/admin_user_list" method="post">
						<div class="tables">
							<table>
						
								<tbody>
									<tr>
										<th>check</th>
										<th>Id</th>
										<th>Pw</th>
										<th>Name</th>
										<th>Birthday</th>
										<th>Gender</th>
										<th>Phone</th>
										<th>Trip</th>
										<th>Register</th>
										<th>Profile</th>
										<th>Email</th>
										<th>Zip_code</th>
										<th>Address</th>
										<th>Detailed_Address</th>
										<th>type</th>
									</tr>
									<c:forEach items="${member}" var="list" varStatus="status">
									<tr>
										<td><input type="checkbox" value="${user.member_id}"></td>
										<td>${list.member_id}</td>
										<td>${list.member_password}</td>
										<td>${list.member_name}</td>
										<td>${list.member_birthday}</td>
										<td>${list.member_gender}</td>
										<td>${list.member_phone}</td>
										<td>${list.member_trip_exp}</td>
										<td>${list.member_register_date}</td>
										<td>
											<img src="${list.member_profile_pic}" style="width: 50px;">
										</td>
										<td>${list.member_email}</td>
										<td>${list.member_Zip_code}</td>
										<td>${list.member_Street_name_address}</td>
										<td>${list.member_Detailed_Address}</td>
										<td>${list.member_type}</td>
										
									</tr>
									</c:forEach>
								</tbody>
									<!-- 테이블 하단 -->
								
							</table>
							<div id="pasing" style="text-align: center">
							   <c:if test="${ page != 1 }">   
							      <a href="${pageContext.request.contextPath}/admin_user_list">처음</a>
							   </c:if>   
							
							   <c:if test="${ startPage != 1 }">   
							      <a href="${pageContext.request.contextPath}/admin_user_list?page=${startPage-1}">이전</a>
							   </c:if>      
							
							   <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
							   <c:if test="${ i == page }" var="result">   
							      <b>${ i }</b>
							   </c:if>         
							   <c:if test="${ not result }">   
							      <a href="${pageContext.request.contextPath}/admin_user_list?page=${i}">${ i }</a>
							   </c:if>         
							   </c:forEach>
							
							   <c:if test="${ endPage != totalPage }">   
							      <a href="${pageContext.request.contextPath}/admin_user_list?page=${endPage+1}">다음</a>
							   </c:if>   
							
							   <c:if test="${ page != totalPage }">   
							      <a href="${pageContext.request.contextPath}/admin_user_list?page=${totalPage}">끝</a>
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
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
		
	

	</section>
	<jsp:include page="/WEB-INF/view/admin/include/admin_page_footer.jsp"/>



	

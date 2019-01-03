
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lz0e8vpjrz5ApswJPUqL&submodules=geocoder"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/view/user/include/mainheader.jsp" />

<section id="main">
	<div id="wrap">
		<div class="container row">
			<div class="main_left col-md-8">

				<div class="best_user">
					<ul class="bxslider">
						<li><a href=""><img
								src="<%=request.getContextPath()%>/resources/img/2.jpg" /></a></li>
						<li><a href=""><img
								src="<%=request.getContextPath()%>/resources/img/3.jpg" /></a></li>
						<li><a href=""><img
								src="<%=request.getContextPath()%>/resources/img/4.jpg" /></a></li>
					</ul>
				</div>
				<div class="contents">
					<div class="posts">
						<div class="sub_title">
							<img src="<%=request.getContextPath()%>/resources/img/logo.gif"
								style="width: 5%;" /> <a class="alink"
								href="${pageContext.request.contextPath}/userprofile"> <span
								class="user_id">${rv_board.member_id}</span></a>
						</div>
						<div class="imgbox">
							<a href=""><img
								src="<%=request.getContextPath()%>/resources/img/1.jpg" /></a>
						</div>
						<div class="bot" style="padding: 15px;">
							<div class="icons row">
								<div class="icon icon_l">
									<a href="#" class="alink"> <i class="far fa-heart"></i>
									</a>
								</div>
								<div class="icon icon_l">
									<a href="#" class="alink"> <i class="far fa-comment"></i>
									</a>
								</div>
								<div class="icon icon_l">
									<a href="#" class="alink"> <i class="fas fa-share-alt"></i>
									</a>
								</div>
								<!-- 즐겨찾기 온오프 -->
								<div class="icon icon_r">
									<a href="#" class="alink"> <i class="far fa-star"></i>
									</a>
								</div>
								<!-- 즐겨찾기 온오프 -->
								<div class="icon icon_r">
									<a href="#" class="alink"> <i class="fas fa-star"></i>
									</a>
								</div>
							</div>
							<div class="like">
								<a href="#" class="alink">좋아요<span>99999개</span></a>
							</div>
							<div class="content">
								<a href="#" class="alink"> <span>ID</span>
								</a> <a href="#" class="alink"> <span> 간략한 글내용... </span>
								</a> <a href="#" class="alink"> <span> 내용더보기</span>
								</a>
							</div>
							<div class="ripples">
								<div class="ripple  row">
									<div class="id">
										<a href="#" class="alink"> ID </a>
									</div>
									<div class="Posts_ripple">
										<a href="#" class="alink"> 댓글 내용... </a>
									</div>
									<div class="like_btn">
										<a href="#" class="alink"> <i class="far fa-heart"></i>
										</a>
									</div>
								</div>
								<div class="more_ripple">
									<a href="#" class="alink"> 댓글 더보기 </a>
								</div>
							</div>

							<hr class="animated-width" />

							<div class="posts_bottom row">
								<div class="l_text col-md-11">
									<input type="text" name="text" value="로그인사용자 댓글쓰기기능"
										onfocus="this.value=''">
								</div>
								<div class="r_btn col-md-1">
									<button type="button" class="btn" data-toggle="modal"
										data-target=".bs-example-modal-sm">...</button>
									<div class="modal fade bs-example-modal-sm" tabindex="-1"
										role="dialog" aria-labelledby="mySmallModalLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content" style="top: 200px;">
												<div>
													<a href="#" class="alink" style="color: #ed4f5c"> 부적절한
														콘텐츠 신고 </a>
												</div>
												<div>
													<a href="#" class="alink"> 게시물로 이동 </a>
												</div>
												<div>
													<a href="#" class="alink"> 퍼가기 </a>
												</div>
												<div>
													<a href="#" class="alink"> 공유하기 </a>
												</div>
												<div>
													<a href="#" class="alink"> 링크 복사하기 </a>
												</div>
												<div>
													<a href="#" class="alink"> 취소 </a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 로그인 이후 -->
			<div class="main_right col-md-4">
				<c:if test="${LoginMember}" var="login">
					<div>
						<div class="user_info row">
						<!-- 로그인 후 로그인된 아이디의 사진 및 아이디를 보여주는 섹션 -->
							<!-- 로그인 된 아이디의 사진을 보여주는 Div -->
							<div class="user_profile_photo col-md-4">
								<a
									href="${pageContext.request.contextPath}/userprofile/${Member.member_id}"><img
									src="${Member.member_profile_pic}"
									style="width: 100px; height: 100px;" /></a>
							</div>
							<!-- 로그아웃 기능을 해주는 Div -->
							<form action="${pageContext.request.contextPath}/logout"
								method="get">
								<div class="id_name col-md-8">
									<div class="user">
										<a
											href="${pageContext.request.contextPath}/userprofile/${Member.member_id}"><strong><span
												style="font-size: 20px;">${Member.member_id}</span></strong></a>
									</div>
									<div>
										<button type="submit" name="logout" value="logout">Logout</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 팔로잉 해주는 사람들의 목록을 보여주는 섹션 -->
					<div class="storys">
						<div class="top row">
							<div class="title">스토리</div>
							<div class="more">
								<a href="#myModalFollowed" data-toggle="modal"
									data-target="#myModalFollowed" style="text-decoration: none;"
									class="alink"> 모두 보기 </a> 
							</div>
						</div>
						<c:forEach items="${follow}" var="follow" begin="0" end="2">
							<div class="story">
								<div class="body">
									<div class="user row">
										<div class="user_profile_photo  col-md-4">
											<a
												href="${pageContext.request.contextPath}/userprofile/${follow.followed_id}"
												style="text-decoration: none;"><img src="${follow.pic2}"
												style="width: 75px; height: 75px;" /></a>
										</div>
										<div class="id_name col-md-8">
											<div class="user">
												<a
													href="${pageContext.request.contextPath}/userprofile/${follow.followed_id}"
													style="text-decoration: none;">${follow.followed_id}</a>
											</div>
											<div class="time">몇시간전</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="maps">
							<div class="top row">
								<div class="title">지도</div>
							</div>
							<div class="map">
								<jsp:include page="dmap.jsp" />
							</div>
						</div>
					</div>
					<div>
						<jsp:include page="/WEB-INF/view/chat/websocket-echo.jsp" />
					</div>
				</c:if>

				<!-- 오른쪽 메인 유저 화면 끝나는 부분 -->


				<!-- 메인 유저 프로필 화면 구성 시작 부분 -->
				<!-- 로그인 이전 -->
				<c:if test="${not login}">
					<div class="loginentrance">
						<div class="id">
							<a href=" ${pageContext.request.contextPath}/login"><button
									type="button" class="btn btn-light btn-lg btn-block">LogIn</button></a>
						</div>
						<div class="search">
							<a href=" ${pageContext.request.contextPath}/MyId"><button
									type="button" class="btn btn-light btn-sm" style="width: 49%;">Did
									you forget you Id?</button></a> <a
								href=" ${pageContext.request.contextPath}/regist"><button
									type="button" class="btn btn-light btn-sm" style="width: 49%;">Sign
									Up</button></a>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<!-- 팔로잉를 보여주는 모달 -->
	<div class="modal fade" id="myModalFollowed" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="margin-top: 150px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">내가 팔로잉 하는 사람들</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${follow}" var="follow">
						<div class="story">
							<div class="body">
								<div class="user row">
									<div class="user_profile_photo  col-md-4" style = "width: 100px;">
										<a
											href="${pageContext.request.contextPath}/userprofile/${follow.followed_id}"
											style="text-decoration: none;"><img
											src="${follow.pic2}" style="width: 75px; height: 75px;" /></a>
									</div>
									<div class="id_name col-md-8">
										<div class="user">
											<a
												href="${pageContext.request.contextPath}/userprofile/${follow.followed_id}"
												style="text-decoration: none;">${follow.followed_id}</a>
										</div>
										<div class="time">몇시간전</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>




</section>
<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp" />



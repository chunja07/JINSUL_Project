<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/user/include/mainheader.jsp" />

	<div id="userpage">
		<div class="container">
			<div class="row profile_header">
				<div class="user_profile_picture col-md-4">
					<img src="${userMember.member_profile_pic}"
						style="width: 100px; height: 100px;" />
				</div>
				<div class="userprofile-explanation">
					<div class="userprofile-name a">
						<form
							action="${pageContext.request.contextPath}/userprofile/${userMember.member_id}"
							method="POST">
							<!-- 만약 로그인 하지 않은 경우 경우 -->
							<c:if test="${Member==null}" var="m">
								<div>
									<span>${userMember.member_id}</span> <span></span>
								</div>

							</c:if>
							<!-- 로그인한 경우 -->
							<c:if test="${not m}">
								<!--현재 로그인유저랑 유저프로필 아이디랑 같은 경우 -->
								<c:if test="${Member.member_id==userMember.member_id}" var="id1">
									<div>
										<span>${userMember.member_id}</span> <span><a
											href="${pageContext.request.contextPath}/update"><button
													type="button" class="btn btn-warning btn-sm">프로필
													편집</button></a></span> <span><a
											href="${pageContext.request.contextPath}/update"><button
													type="button" class="btn btn-danger btn-sm">글 올리기
													</button></a></span>
									</div>
								</c:if>

								<!--현재 로그인유저랑 유저프로필 아이디랑 같지 않은 경우 -->
								<c:if test="${not id1}">
									<!--현재 관계가 yes라고 써져 있는 경우 -->
									<c:if
										test="${follow.relationship eq 'yes' && follow.followed_id==userMember.member_id}"
										var="fl">
										<div>
											<span>${userMember.member_id}</span> <span><button
													type="submit" class="btn btn-warning btn-sm"
													id="followCancel">팔로우 취소</button></span>
										</div>
									</c:if>
									<!--  팔로우 관계가 현재 yes라고 되어있지 않은 경우 -->
									<c:if test="${not fl}">
										<div>
											<span>${userMember.member_id}</span> <span><button
													type="submit" class="btn btn-warning btn-sm"
													id="followRequest">팔로우 신청</button></span>
										</div>
									</c:if>
								</c:if>
							</c:if>
						</form>
						<!-- 유저 프로필 중 게시물, 팔로워 수, 팔로잉 숫자를 보여주는 Div -->
						<div>
						<!-- 게시물 개수를 보여주는 Div -->
							<div class="userprofile-write row a">
								<div class="num">
									게시물<span> 0개</span>
								</div>
								<!-- 팔로워 목록을 보여주는 Div -->
								<div class="num">
									<span><a href="#myModalFollower" data-toggle="modal"
										data-target="#myModalFollower" style="color: black;"
										class="alink">팔로워 ${followed_Count}명</a></span>
								</div>
								<!-- 팔로잉 목록을 보여주는 Div -->
								<div class="num">
									<span><a href="#myModalFollowed" data-toggle="modal"
										data-target="#myModalFollowed" style="color: black;"
										class="alink">팔로잉 ${follower_Count}명</a></span>
								</div>
							</div>
						</div>
						<!-- 유저 프로필 멤버의 이름과 소개글 출력하는 Div -->
						<div class="a">
							<div>${userMember.member_name}</div>
							<div>${introduction.introduction}</div>
						</div>
					</div>
				</div>
			<!-- 유저가 기록한 사진 및 글이 출력되는 공간 -->
			</div>
			<div>
				<div class = "review row" >
					<div class = "reviewDiv">
						<img src="${userMember.member_profile_pic}"
						style="width: 300px; height: 300px;" />
					</div>				
				
					<div class = "reviewDiv">
						<img src="${userMember.member_profile_pic}"
						style="width: 300px; height: 300px;" />
					</div>	
				
				
					<div class = "reviewDiv">
						<img src="${userMember.member_profile_pic}"
						style="width: 300px; height: 300px;" />
					</div>
				</div>				
			</div>
		</div>
	</div>
	<!-- 팔로잉 및 팔로워들 목록을 보여주는 모달 -->
		<!-- 팔로워를 보여주는 모달 -->
	<div class="modal fade" id="myModalFollower" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="margin-top: 150px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">나를 팔로우 하는 사람들</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${followerList}" var="followerList">
						<div class="story">
							<div class="body">
								<div class="user row">
									<div class="user_profile_photo  col-md-4" style = "width: 100px;">
										<a
											href="${pageContext.request.contextPath}/userprofile/${followerList.follower_id}"
											style="text-decoration: none;"><img
											src="${followerList.pic1}" style="width: 75px; height: 75px;" /></a>
									</div>
									<div class="id_name col-md-8">
										<div class="user">
											<a
												href="${pageContext.request.contextPath}/userprofile/${followerList.follower_id}"
												style="text-decoration: none;">${followerList.follower_id}</a>
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
					<c:forEach items="${followedList}" var="followedList">
						<div class="story">
							<div class="body">
								<div class="user row">
									<div class="user_profile_photo  col-md-4" style = "width: 100px;">
										<a
											href="${pageContext.request.contextPath}/userprofile/${followedList.followed_id}"
											style="text-decoration: none;"><img
											src="${followedList.pic2}" style="width: 75px; height: 75px;" /></a>
									</div>
									<div class="id_name col-md-8">
										<div class="user">
											<a
												href="${pageContext.request.contextPath}/userprofile/${followedList.followed_id}"
												style="text-decoration: none;">${followedList.followed_id}</a>
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

	<script type="text/javascript">
		$('#followRequest').click(function() {
			if (confirm("정말 팔로우 하시겠습니까?") == true) {
				document.form.submit();
			} else {
				return false;
			}
		})

		$('#followCancel').click(function() {
			if (confirm("정말 팔로우를 취소 하시겠습니까?") == true) {
				document.form.submit();
			} else {
				return false;
			}
		})
	</script>


<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp" />
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 왼쪽 메뉴바 -->
<div class="admin_main_left col-md-3">
	<ul>
		<li>홈페이지 관리
			<ul>
				<li><a href="${pageContext.request.contextPath }/admin_notice" class="alink">공지사항</a></li>
			</ul>
		</li>
		<li>회원관리
			<ul>
				<li><a href="/JS/admin_user_list" class="alink">회원보기</a></li>
				<li><a href="/JS/admin_warning_list" class="alink">경고내역</a></li>
				<li><a href="#" class="alink">탈퇴 예정 회원</a></li>
			</ul>
		</li>
		<li>게시물관리
			<ul>
				<li><a href="#" class="alink">최근 게시물 보기</a></li>
				<li><a href="#" class="alink">게시물 이동</a></li>
			</ul>
		<li>건의 및 신고
			<ul>
				<li><a href="/JS/admin_question" class="alink">건의사항</a></li>
				<li><a href="#" class="alink">신고목록</a></li>
			</ul>
		</li>
	</ul>
</div>



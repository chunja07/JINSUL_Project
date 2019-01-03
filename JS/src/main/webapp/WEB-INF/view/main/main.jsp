<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>
<body>
<h3>메인페이지</h3>

<!-- Member 는 Session 에 저장되어있다 -->
<!-- empty Member(session) 적용 x empty Member.member_id 구체적으로 지정해줘야한다 -->
<!-- Member.member_id 가 없다면(아직 로그인 전 이거나 , 로그아웃 후) [로그인] 뜨도록 -->
<c:if test="${empty Member.member_id}" var="a"><a href="${pageContext.request.contextPath}/login">[로그인]</a> <a href="${pageContext.request.contextPath}/regist">[회원가입]</a></c:if><br>
<!-- 그 반대라면 [로그아웃] 뜨도록 -->
<c:if test="${not a}"><a href="${pageContext.request.contextPath }/logout">[로그아웃]</a><a href="${pageContext.request.contextPath }/update">[정보수정]</a><br>
<p>아이디 : ${Member.member_id }</p><p>이름 : ${Member.member_name }</p><p>등급 : ${Member.member_trip_exp }</p><p>주소 : ${Member.member_Street_name_address }</p><p><img src="${Member.member_profile_pic }" width="100px" height="100px"></p>
<%-- 팝업창으로 처리하므로 자세한 경로는 필요없다(팝업창 이벤트에서 경로 작성) #은 onclick 할수있도록 빈 하이퍼링크 생성해주는 역할 --%>
<a href="${pageContext.request.contextPath }/message">[메시지]</a>
</c:if>
</body>
</html>
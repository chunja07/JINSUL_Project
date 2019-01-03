<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 회원정보 변경하기전 사용자의 비밀번호 체크--%>
<span style="color: red"><c:if test="${passwordF }">비밀번호가 일치하지 않습니다</c:if></span>
<form action="${pageContext.request.contextPath }/checkPw" method="post">
비밀번호 : <input type="password" name="member_password">
<input type="submit" value="확인">
</form>

</body>
</html>
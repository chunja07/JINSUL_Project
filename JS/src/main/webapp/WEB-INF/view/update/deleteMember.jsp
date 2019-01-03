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
<h3>회원 탈퇴</h3>
<form action="${pageContext.request.contextPath }/update/deleteMember" method="POST">
<c:if test="${pwNotEq }"><span style="color: red">패스워드가 일치하지 않습니다</span></c:if><br>
비밀번호 : <input type="password" name="member_password">
<input type="submit" value="삭제">
</form>

</body>
</html>
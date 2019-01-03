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
<h3>메시지 보관함</h3>

<c:forEach items="${Message }" var="a">
보낸사람 : ${a.member_receiver }<img src="${a.message_profil_pic }" width="50px" height="50px" border="1px" style="border-radius: 100px;"/><br><br>

									<%-- 받은 내용 수정못하고 읽을수만 있도록 --%>
내용<br><textarea rows="10" cols="10" readonly="readonly" style="overflow: scroll ">${a.message_content }</textarea>
<form id="form">
<%-- 받은 이미지 출력될 공간 type="text" 일때는 src 못읽어 밑에 제이쿼리문에서 type="image" 로 바꿔주면 이미지 출력 --%>
<input type="text" src="${a.message_picture }" width="50px" height="50px"  name="image" value="받은 이미지가 존재합니다" disabled="disabled">
</form>
<button id="btn" type="button">이미지 보기</button><br>

${a.message_send_date }


</c:forEach>
<script>

<%-- 이미지 보이도록 출력 --%>
	$("#btn").click(function(){
		f = document.forms.form;
		f.image.type="image";
		
		
	});


</script>
</body>
</html>
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
<a href="#" onclick="sendMsg()" >[메시지 보내기]</a>
<a href="#" onclick="sendMsgStore()">[보낸 메시지 보관함]</a>
<a href="#" onclick="receiveMsgStore()">[받은 메시지 보관함]</a>

<script>
// 팝업창 이벤트
function sendMsg() { 		//window.open 1.경로 2.별명(미기입 시 팝업뜨지않고 새 창생성) 3.팝업창의 크기와 위치
	window.open("${pageContext.request.contextPath}/message/send","" ,"width=500, height=500, left=500, top=50" );
}
function sendMsgStore() { 
	window.open("${pageContext.request.contextPath}/message/sendMessageStore","","width=500, height=500, left=500, top=50" ); 
}
function receiveMsgStore() { 
	window.open("${pageContext.request.contextPath}/message/receiveMessageStore","", "width=500, height=500, left=500, top=50" ); 
}
</script>
</body>
</html>
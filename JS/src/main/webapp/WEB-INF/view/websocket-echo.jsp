<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>





<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<body>
	
	<c:set var="loginmember" value="${loginMember}" />
	
	
	<div id="data" style="height: 500px;
		border:2px solid gray;
	    border-radius:5px;
	    overflow:auto;    
	    overflow-x:hidden;"></div>
	    
	<div style="position: fixed; bottom: 0; z-index: 9999; background: white; width: 100%; margin: 100px 200px; ">
		<input type="text" id="message" />
		<input type="button" id="sendBtn" value="전송" />
	</div>
	<div>
		너님 아이이디는 : ${loginmember.id } 입니다.	
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/main">메인으로</a>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('');
		});

		$("#message").keydown(function(key) {
			// 엔터키 입력 감지
			if (key.keyCode == 13) {
				sendMessage();
				$('#message').val('');
			}
		});

	});

	// 웹소켓을 지정한 url로 연결한다.
	let sock = new SockJS("<c:url value="/echo"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;

	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#data").append(data + "<br/>");
		$("#data").scrollTop($("#data").height());
	}

	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#data").append("연결 끊김");
	}
	
	// $("#data").scrollTop($("#data")[0].scrollHeight); 
  
	//$("#data").scrollTop($("#data").height());

</script>
 
	
	
	
	
</script>

</body>
</html>
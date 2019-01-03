<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

	<div id="data" style="height: 500px;
		border:2px solid gray;
	    border-radius:5px;
	    overflow:auto;    
	    overflow-x:hidden;"></div>
	    
	<div>
		<input type="text" id="id" value="${loginMemberId}" disabled  style="width: 20%;"/>
		<input type="text" id="message" style="width: 60%;"/>
		<input type="button" id="sendBtn" value="전송" style="width: 15%;"/>
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
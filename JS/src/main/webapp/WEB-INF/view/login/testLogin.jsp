<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>
<body>
<table class="logintb"><colgroup> <col style="width: 32%;" /> <col /> <col style="width: 20%;" /> </colgroup>
<tbody>
<tr class="box captcha">
<td style="padding-left: 30px;" colspan="3">
<div class="loading"></div>
<img id="captchaImg" title="캡차 이미지" src="/captcha" alt="캡차 이미지" /></td>
</tr>
<tr>
<th><label for="captcha">자동 로그인 방지</label></th>
<td><input id="captcha" autocomplete="off" name="captcha" required="" type="text" /></td>
<td><a class="reflashbtn"  onclick="fnCmdReCaptcha();" tabindex="3" href="#none">새로고침</a></td>
</tr>
<tr>
<th>ID</th>
<td><input id="logId" style="ime-mode: inactive;" tabindex="1" maxlength="20" name="logId" type="text" placeholder="Login Id" /></td>
<td rowspan="2"><a class="loginbtn" tabindex="3" href="#none">로그인</a></td>
</tr>
<tr>
<th>Password</th>
<td><input id="logPw" tabindex="2" maxlength="20" name="logPw" type="password" placeholder="Password" /></td>
</tr>
</tbody>
</table>
<script>
function fnCmdLogin() {
 
var captcha = $('#captcha').val();
if(captcha == ''){
alert("자동등록 방지 문자를 입력해 주세요.");
$('#captcha').focus();
return;
}
 
var captchaOk = $.commandAjax('<c:url value="/mngr/com/login/checkCaptcha.do"/>', 'loginForm');
 
if (captchaOk.status == 'FAIL') {
alert(captchaOk.message);
return;
}
 
var logId = $('#logId').val();
var pwd = $('#logPw').val();
 
 
if(logId == ''){
alert("아이디를 입력하세요.");
$('#logId').focus();
return;
}
if(pwd == ''){
alert("비밀번호를 입력하세요.");
$('#logPw').focus();
return;
}
 
var login = $.commandAjax('LoginConfirm.do', 'loginForm');
 
if (login.status == 'SUCCESS') {
location.href = login.message;
} else {
alert(login.message);
}
 
return false;
}
 
function fnCmdReCaptcha() {
	
	 var $captchaLoader = $("#loginForm .box.captcha .loading");
	 var $captchaImg = $("#loginForm .box.captcha img");
	 
	 $captchaLoader.show();
	 $('#captchaImg').attr("src", "/captcha?ran=" + Math.random());
	 $captchaLoader.fadeOut(500);
}
</script>
</body>
</html>
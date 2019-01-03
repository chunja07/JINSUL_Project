<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
  response.setHeader("Pragma-directive", "no-cache");
  response.setHeader("Cache-directive", "no-cache");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires",0); 
  
%>
<!DOCTYPE  html>
<html>
<head>
<title>aaa</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Imagetoolbar" content="no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<%-- 부트스트랩 --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<LINK REL="StyleSheet"
	HREF="<%=request.getContextPath()%>/resources/css/style.css" TYPE="text/css">

<% 

//
double math = Math.random();


%> 
<script type="text/javascript">

 /* 
  * Captcha Image 요청
  * [주의] IE의 경우 CaptChaImg.jsp 호출시 매번 변하는 임의의 값(의미없는 값)을 파라미터로 전달하지 않으면
  * '새로고침'버튼을 클릭해도 CaptChaImg.jsp가 호출되지 않는다. 즉, 이미지가 변경되지 않는 문제가 발생한다. 
  *  그러나 크롭의 경우에는 파라미터 전달 없이도 정상 호출된다.
  */
 function changeCaptcha() {
  //IE에서 '새로고침'버튼을 클릭시 CaptChaImg.jsp가 호출되지 않는 문제를 해결하기 위해 "?rand='+ Math.random()" 추가 
  $('#catpcha').html('<img src="<%=ctx%>/captcha_mod/CaptChaImg.jsp?rand=<%=math%>"/>');
 }



 function winPlayer(objUrl) {
  $('#audiocatpch').html(' <bgsound src="' + objUrl + '">');
 }
 
 /* 
  * Captcha Audio 요청
  * [주의] IE의 경우 CaptChaAudio.jsp 호출시 매번 매번 변하는 임의의 값(의미없는 값)을 파라미터로 전달하지 않으면
  * '새로고침'된 이미지의 문자열을 읽지 못하고 최초 화면 로드시 로딩된 이미지의 문자열만 읽는 문제가 발생한다. 
  * 이 문제의 원인도 결국 매번 변하는 파라미터 없이는 CaptChaAudio.jsp가 호출되지 않기 때문이다. 
  * 그러나 크롭의 경우에는 파라미터 전달 없이도 정상 호출된다.  
  */
 function audioCaptcha() {

   var uAgent = navigator.userAgent;
   var soundUrl = 'CaptChaAudio.jsp';
   if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
       //IE일 경우 호출
       winPlayer(soundUrl+'?agent=msie&rand='+ Math.random());
   } else if (!!document.createElement('audio').canPlayType) {
       //Chrome일 경우 호출
       try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }
   } else window.open(soundUrl, '', 'width=1,height=1');
 }
 
 //화면 호출시 가장 먼저 호출되는 부분 
 $(document).ready(function() {
  
  changeCaptcha(); //Captcha Image 요청
  
  $('#reLoad').click(function(){ changeCaptcha(); }); //'새로고침'버튼의 Click 이벤트 발생시 'changeCaptcha()'호출
  $('#soundOn').click(function(){ audioCaptcha(); }); //'음성듣기'버튼의 Click 이벤트 발생시 'audioCaptcha()'호출
  
  <%--
  //'확인' 버튼 클릭시
  $('#frmSubmit').click(function(){
      if ( !$('#answer').val() ) {
           alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
      } else {
           $.ajax({
               url: 'CaptchaSubmit.jsp',
               type: 'POST',
               dataType: 'text',
               data: 'answer=' + $('#answer').val(),
               async: false,  
               success: function(resp) {
                    alert(resp);
                    $('#reLoad').click();
                    $('#answer').val('');
              }
         });
      }
  });
  --%>
 });
</script>
</head>
<body>
<div id="loginUp">
	<form action="${pageContext.request.contextPath }/loginUp" method="post" id="form" >
	<%-- 로그인 실패 시 --%>
		<c:if test="${loginF }">
		<span style="color: red">아이디와 비밀번호를 확인해주세요</span>
		</c:if>
		
		<%-- 로그인 5회 입력 실패해 출력되는문구 --%>
		<c:if test="${loginUp }"><span style="color: red">로그인 5회 입력 실패</span></c:if>
		
		<%-- 자동입력방지문자 // http://www.gnujava.com/board/article_view.jsp?article_no=7121&menu_cd=16&board_no=3&table_cd=EPAR01&table_no=01 --%>					
		
		<div class="id_input div_line">
			<input type="text" class="form-control FC_B" name="member_id" id="member_id" placeholder="ID" required="required">
		</div>  																<%-- 칸에 입력하지않으면 전송안되도록 --%>
		<div class="pw_input div_line">
			<input type="password" class="form-control FC_B" name="member_password" placeholder="Password" required="required"	id="member_password">
		</div>  
		 		  
		<div class="wait div_line">
			<div id="catpcha">Wait...</div>
			<div id="audiocatpch" style="display: none;"></div>
		</div>
		
		<div class="btn div_line">
			<input id="reLoad" type="button" value="새로고침" />
			<input id="soundOn" type="button" value="음성듣기" />
		</div>
		<div class="wait_input div_line">
			<input type="text" id="answer" class="form-control FC_B" name="answer" value="" placeholder="위에 문자를 적어주세요" required="required" />
		</div>
		
		<div class="login_btn div_line">
			<%-- <input type="submit" value="로그인" id="submit"> --%>
			<input type="submit" id="submit" class="l_btn" value="로그인"><br>
			<a href="${pageContext.request.contextPath }/MyPassword">Forgot password?</a> <br>
			<a href="${pageContext.request.contextPath }/regist">New member?<br> Create an Account</a> 
		</div>
	</form>

</div>
</body>
</html>
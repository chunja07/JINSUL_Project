<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- 부트스트랩 --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<LINK REL="StyleSheet"
	HREF="<%=request.getContextPath()%>/resources/css/style.css" TYPE="text/css">

</head>
<body>
<div id="loginUp">
	<form action="${pageContext.request.contextPath }/newPassword" id="form1" method="post">
	
	<fieldset>
	<legend>비밀번호 찾기</legend>
	<%-- ajax 에서 error 될 경우(입력안하거나 해당되는 정보가 없을때) 메시지 출력될 공간 --%>
	<span id="ajaxError" style="color: red"></span>
	
	<%-- 입력한 아이디와 이메일에 대한 회원정보가 없는경우 --%>
	<c:if test="${ IdEmailNotMatch}"><span style="color: red">아이디와 이메일을 다시 확인해주세요</span></c:if>
	
	
	<div class="div_line">
		<input type="text" class="form-control FC_B " id="member_id" name="member_id" placeholder="ID" required="required"> 
	</div>
	<div class="div_line">
		<input type="email" class="form-control FC_B" id="member_email" name ="member_email" placeholder="Email" required="required">
				<%-- 유저 정보 검색 버튼 (ajax) --%>		<%-- 전송 성공 시 출력될 공간 --%>
		<button type="button" id="btn">전송</button><span id="sendSuc"></span>
	</div>
	
	<div class="div_line">
		<input type="text" class="form-control FC_B" name = "Certification_Number" id="Certification_Number" placeholder="인증번호입력">
		<button id="mailChkBtn" type="button">확인</button>
	</div>
	
		<%-- 메일 발송 될때 제목과 내용 type="hidden" 으로 사용자 입장에서 보여지지 않도록 -->
		<%-- 제목 --%>
	<div class="div_line">
		<input type="hidden" id="title" value="인증번호 발송">
	</div>
		
		<%-- 내용에 들어갈 난수값 처리 --%>
		<%
		char ch1 = (char)((Math.random()*25)+65);
		int ch2 = (int)((Math.random()*25)+65);
		char ch3 = (char)((Math.random()*25)+65);
		int ch4 = (int)((Math.random()*25)+65);
		char ch5 = (char)((Math.random()*25)+65);
		
		%>
		<%-- 메일 내용 --%>
		<input type="hidden" id="content" value="<%=ch1 %><%=ch2 %><%=ch3 %><%=ch4 %><%=ch5 %>" >
		
		
		<%-- 인증메일내용과 인증메일입력이 일치하거나 일치하지 않을 시 그에 해당하는 문구 출력될 공간 --%>		
		<span id="MatchOrNotMatch"></span><br>
		
		
		
		<input type="password" class="form-control FC_B" id="new_member_password" value=""  name="new_member_password" placeholder="새로운 비밀번호 입력" pattern="[a-zA-Z0-9]{7,11}" title="공백,특수문자 제외 비밀번호를 7~11글자로 작성해주세요" style="display: none"><br>
		<input type="password" class="form-control FC_B" id="newPasswordChk"  value=""  name="newPasswordChk" placeholder="새로운 비밀번호 확인" style="display: none"><span id="misPW"></span><br>
		<input type="submit" value="변경" id="submit" name="submit" style="display: none">
		</fieldset>

				
	</form>
</div>
	<script>
	
	// 엔터키 누를 시 submit 되는거 방지
	document.addEventListener('keydown', function(event) {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	}, true);
	
	
	// ajax 이용해 입력한 id,이메일 정보를 controller 로 전달
		$("#btn").click(function() {
			$("#sendSuc").text("wait");
			
			var member_id = $("#member_id").val();
			var email = $("#member_email").val();
			var title = $("#title").val();
			var content = $("#content").val();
				$.ajax({
					
					type : "POST",													
					url : "${pageContext.request.contextPath}/findMyPw/"+member_id+"/"+email+"/"+title+"/"+content,
					dataType : "json",

					
					// 입력한 정보의 회원을 찾은경우
					success : function(find) {
							// 만약 한번이상 틀려 error 가 발생한경우 success 해도 기존의 error 에서 정의된 text가 남아있는것을 지워준다
							$("#ajaxError").text("");
							
							
							$("#sendSuc").text(find.msg);
							
							

						},
					// 입력한 정보의 회원을 찾지 못한경우
						error : function() {
							$("#ajaxError").text("회원정보를 다시 확인해주세요");
						}

					});

				});
		
	// 인증번호 일치하는지  확인 버튼
$("#mailChkBtn").click(function(){
		var Certification_Number = $("#Certification_Number").val();
		var content = $("#content").val();
		f1 = document.forms.form1;
		// 인증메일의 인증문자와 입력한 인증문자가 일치하는지 확인
		if(content == Certification_Number){ 
			$("#MatchOrNotMatch").text("인증성공");
			// 인증 성공 시 새로운 비밀번호 입력할 수 있는 창 생성
			f1.new_member_password.style.display="";
			f1.newPasswordChk.style.display="";
			f1.submit.style.display="";
		} else{
			// 인증 실패 시
			$("#MatchOrNotMatch").text("인증문자를 다시 확인해주세요");
		}
	});
	
	// 새로운비밀번호와 새로운비밀번호확인이 일치하는지 확인
	$("#newPasswordChk").keyup(function(){
		var newPassword = $("#new_member_password").val();
		var newPasswordChk = $("#newPasswordChk").val();
		if(newPassword == newPasswordChk){
			$("#misPW").text("비밀번호 일치")
		}else {
			$("#misPW").text("비밀번호 불일치")
		}
		
	});
	
	
	// 새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않으면 submit 되지 않도록
	$("#submit").click(function(){
		var newPassword = $("#new_member_password").val();
		var newPasswordChk = $("#newPasswordChk").val();
		if(newPassword == newPasswordChk){
			
		}else {
			
			return false;
		}
		
	});
	</script>
</body>
</html>
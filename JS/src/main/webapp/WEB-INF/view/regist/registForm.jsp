<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<LINK REL="StyleSheet"
	HREF="<%=request.getContextPath()%>/resources/css/style.css" TYPE="text/css">
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</head>
<body> 
<div id="regist">
<form action="${pageContext.request.contextPath }/regist" method="post" class="form-inline" enctype="multipart/form-data" id="form">
<fieldset>
<legend>회원가입</legend>

<c:if test="${registF }"><span style="color: red">동일한 아이디가 이미 존재합니다.</span></c:if><br>

<%-- 부트스트랩 아이디 체크 --%>
<div class="form-group  has-feedback" id="formId">
    <label class="control-label" for="inputSuccess4">아이디</label>
    <input type="text" class="form-control onlyAlphabetAndNumber" name="member_id" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required" title="영문자와 숫자로 3~11" pattern="[a-zA-Z0-9]{3,11}" placeholder="영문자와 숫자로 3~11">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="checkId_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>


<%-- 부트스트랩 비밀번호 체크 --%>
<div class="form-group  has-feedback" id="formPassword">
    <label class="control-label" for="inputSuccess4">비밀번호</label>																																			<%-- 비밀번호와 비밀번호 확인이 일치하는지 --%>
    <input type="password" class="form-control onlyAlphabetAndNumber" name="member_password" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required" title="영문자와 숫자 7~11" pattern="[a-zA-Z0-9]{7,11}" placeholder="영문자와 숫자 7~11" onkeyup="chkPw()">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="checkPassword_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 비밀번호 확인 체크 --%>
<div class="form-group  has-feedback" id="formPassword_chk">
    <label class="control-label" for="inputSuccess4" >비밀번호 확인</label>																																															<%-- 비밀번호와 비밀번호 확인이 일치하는지 --%>
    <input type="password" class="form-control onlyAlphabetAndNumber" name="member_password_chk" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required" title="영문자와 숫자 7~11" pattern="[a-zA-Z0-9]{7,11}" placeholder="영문자와 숫자 7~11" onkeyup="chkPw()">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="checkPassword_chk_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 이름 체크 --%>
<div class="form-group  has-feedback" id="formMemberName">
    <label class="control-label" for="inputSuccess4" >회원 이름</label>
    <input type="text" class="form-control onlyAlphabetAndHangul" name="member_name" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required" title="공백,숫자,특수문자제외 1~10"  pattern="[a-zA-Z가-힣]{1,10}">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formMemberName_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 생일 체크 --%>
<div class="form-group  has-feedback" id="formMemberBirthDay" >
    <label class="control-label" for="inputSuccess4">회원 생일</label>	
    <input type="date" class="form-control" name="member_birthday" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id = "formMemberBirthDay_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 성별 체크 --%>
<div class="form-group has-feedback" id="formGender">
    <label class="control-label" for="inputSuccess4" >회원 성별</label>
    남 <input type="radio" class="form-control" name="member_gender" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required" value="M"> 여 <input type="radio" class="form-control" name="member_gender" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required" value="F">
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="glyphicon  form-control-feedback" aria-hidden="true" id="formGender_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>


<%-- 부트스트랩 회원 연락처 체크 --%>
<div class="row form-group has-feedback" id="formPhone">
  <span class="col-xs-2"  style=" padding-right:0; width:auto" id="phone1">
  <label class="control-label" for="inputSuccess4" >연락처</label>																						<%-- 0으로 시작 // 숫자사용해 1~2 자릿수 --%>
    <input type="text" class="form-control onlyNumber" id="inputSuccess4" name="member_phone" placeholder="000" size="1" maxlength="3" required="required" pattern="0[0-9]{1,2}" title="전화번호를 다시 확인해주세요" onkeyup="chkPhone()">-
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
  </span>
  <span class="col-xs-2" style="margin:0; padding:0 ; width:auto" id="phone2">
    <input type="text" class="form-control" id="inputSuccess4" name="member_phone" placeholder="0000" size="1" maxlength="4" required="required" pattern="[0-9]{3,4}" onkeyup="chkPhone()">-
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
  </span>
  <span class="col-xs-2" style="margin:0; padding:0 ; width:auto" id="phone3">
    <input type="text" class="form-control" id="inputSuccess4" name="member_phone" placeholder="0000" size="1" maxlength="4" required="required" pattern="[0-9]{4}" onkeyup="chkPhone()">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formPhone_Img"></span>
  </span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 이메일 체크 --%>
<div class="row form-group has-feedback" id="formEmail">
  <span class="col-xs-2"  style=" padding-right:0; width:auto" id="Email1">
  <label class="control-label" for="inputSuccess4" >이메일</label>																			
    <input type="text" class="form-control onlyAlphabetAndNumber" id="inputSuccess4" name="member_email0" size="5" required="required" pattern="[a-zA-Z0-9]{3,20}" title="이메일을 다시 확인해주세요" onkeyup="chkEmail()">
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
  </span>
  <span class="col-xs-2" style="margin:0; padding:0 ; width:auto" id="Email2">
    @<select name="member_email1" class="form-control onlyAlphabetAndNumber" id="email" onchange="onChange()"><option value="naver.com">naver.com</option><option value="gmail.com">gmail.com</option><option value="">직접입력</option></select>
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>	
  </span>
  <span class="col-xs-2" style="margin:0; padding:0 ; width:auto" id="Email3">
    <input type="text" name="member_email2" class="form-control onlyAlphabetAndDot" id="inputSuccess4" style="display: none"  pattern="[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$" title="이메일을 다시 확인해주세요" onkeyup="chkEmail()">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formEmail_Img"></span>
  </span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 우편 번호 체크 --%>
<div class="form-group  has-feedback" id="formMemberZip_Code">
    <label class="control-label" for="inputSuccess4" >우편 번호</label>
    <input type="text" class="form-control postcodify_postcode5 onlyNone" name="member_Zip_code" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" readonly="readonly">
    <br><button id="postcodify_search_button" type="button" >검색</button>
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formMemberZip_Code_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 도로명주소 체크 --%>
<div class="form-group  has-feedback" id="formMemberStreet_Name">
    <label class="control-label" for="inputSuccess4" >도로명주소</label>
    <input type="text" class="form-control postcodify_address" name="member_Street_name_address" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" readonly="readonly" size="30">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formMemberStreet_Name_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 상세주소 체크 --%>
<div class="form-group  has-feedback" >
    <label class="control-label" for="inputSuccess4" >상세주소</label>
    <input type="text" class="form-control postcodify_details" name="member_Detailed_Address" autofocus="autofocus"  aria-describedby="inputSuccess4Status">
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<%-- 부트스트랩 회원 사진 체크 --%>
<div class="form-group  has-feedback" >
    <label class="control-label" for="inputSuccess4" >사진</label>
    <%--member_trip_exp은 게시글에서 --%>
<input type="file" name="file" id="member_profile_pic" ><br>
<%-- 이미지 넣을 공간 --%>
<img id="img" src="#" alt="이미지" width="100px" height="100px" border="1px"/><br>
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<%-- type hidden 속성을 이용해 처리 // hidden 이므로 form에서 작성란은 안보인다 value 값으로 초기화만 해준다 // 일반회원일 경우 항상 member_type=0 이고 member_trip_exp 도 0이므로 --%>
<input type="hidden" value="0" name="member_type">
<input type="hidden" value="0" name="member_trip_exp">
<input type="submit" value="가입" id="submit" > 

</fieldset>

</form>

<a href="${pageContext.request.contextPath }/">[회원가입 취소]</a>
</div>

<script type="text/javascript">

   
   
   
<%--부트스트랩 사용 --%>


   
   // 영어와 숫자만
   $('.onlyAlphabetAndNumber').keyup(function(event){
       if (!(event.keyCode >=37 && event.keyCode<=40)) {
           var inputVal = $(this).val();
           $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); 
       }
   });
   
	// 영어와 점 (email 에서 사용)
   $('.onlyAlphabetAndDot').keyup(function(event){
       if (!(event.keyCode >=37 && event.keyCode<=40)) {
           var inputVal = $(this).val();
           $(this).val($(this).val().replace(/[^_a-z.]/gi,'')); 
       }
   });
   
   // 숫자만
   $(".onlyNumber").keydown(function(event){
	   
       if (!(event.keyCode >=37 && event.keyCode<=40)) {
    	  
           var inputVal = $(this).val();
           $(this).val(inputVal.replace(/[^_0-9]/,''));
       }
   });
   
   // 한글만 입력되도록
   $(".onlyHangul").keyup(function(event){
       if (!(event.keyCode >=37 && event.keyCode<=40)) {
           var inputVal = $(this).val();
           $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
       }
   });
   
   // 영어와 한글만
   $('.onlyAlphabetAndHangul').keyup(function(event){
       if (!(event.keyCode >=37 && event.keyCode<=40)) {
           var inputVal = $(this).val();
           $(this).val($(this).val().replace(/[^_a-z가-힣]/gi,'')); 
       }
   });
   
   // 아무것도 입력 못하도록 (우편번호 // 검색을 통해서만 입력되도록)
$('.onlyNone').keyup(function(event){
       if (!(event.keyCode >=37 && event.keyCode<=40)) {
           var inputVal = $(this).val();
           $(this).val($(this).val().replace(/[^_]/gi,'')); 
       }
   });
   
   
   <%-- 페이지 로딩되면 필수입력칸 표시 input 옆에 검은삼각형 --%>
   window.onload = function(){
	   $("#checkId_Img").addClass("glyphicon-warning-sign");
	   $("#checkPassword_Img").addClass("glyphicon-warning-sign");
	   $("#checkPassword_chk_Img").addClass("glyphicon-warning-sign");
	   $("#formMemberName_Img").addClass("glyphicon-warning-sign");
	   $("#formMemberBirthDay_Img").addClass("glyphicon-warning-sign");
	   $("#formGender_Img").addClass("glyphicon-warning-sign");
	   $("#formPhone_Img").addClass("glyphicon-warning-sign");
	   $("#formEmail_Img").addClass("glyphicon-warning-sign");
	   $("#formMemberZip_Code_Img").addClass("glyphicon-warning-sign"); 
	   $("#formGender_Img").addClass("glyphicon-warning-sign");
	   
   }
   
   
   <%-- 아이디 --%>
// 조건이 만족할 시 input 안에 체크와 초록색 , 불만족 경고표시와 빨강색
// 아이디,비밀번호,연락처 등등 input 안에 id="inputSuccess" 여러개 사용해야하므로 상속관계로 표현  (중복안되도록)
   $("#formId > #inputSuccess4").keyup(function(){
	   
	  
	   
	   var id = $("#formId > #inputSuccess4").val();
	   // 정규표현식
	   var check1 = /^[a-zA-Z0-9]{3,11}$/;
	  if(id.match(check1)){
		  
		  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
		  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
		  $("#formId").removeClass("has-error");
		  $("#checkId_Img").removeClass("glyphicon-warning-sign");
		  
		  // class 추가시켜주는 작업
		  $("#formId").addClass("has-success");
		  $("#checkId_Img").addClass("glyphicon-ok");
		  
	  }else{ 
		// 초기화 시켜주는 작업
		  $("#formId").removeClass("has-success");
		  $("#checkId_Img").removeClass("glyphicon-ok");
		  
		// class 추가시켜주는 작업
		  $("#formId").addClass("has-error"); 
		  $("#checkId_Img").addClass("glyphicon-warning-sign");
		  
	  }
	   
	   // input 에서 입력한 아이디 값 ( 아이디 중복 검사 )
	  var member_id = $("#formId > #inputSuccess4").val();
	  $.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/idChk/"+member_id,
			// dataType : "json" 선언하지 않을경우 ??? ???? 형식으로 한글 깨져서 나오고 , {"키값":"value"}을 json형식으로 읽어오지 못한다 //
			dataType : "json",
			success : function(chkId){
				// 사용 가능한 아이디입니다 or 이미 사용중인 아이디입니다 
				if(chkId.value == "사용 가능한 아이디입니다"){
					
					// class 추가시켜주는 작업
					$("#formId").addClass("has-success");
					$("#checkId_Img").addClass("glyphicon-ok");
				} else{
					
					// class 추가시켜주는 작업
					$("#formId").addClass("has-error"); 
					  $("#checkId_Img").addClass("glyphicon-warning-sign");
				}
				$("#chk").text(chkId.value);
				
			},
			error : function(){
				// 아이디칸에 아무 입력도 하지않거나, 서버쪽에 문제가 생긴경우
				$("#chk").text("아이디를 입력해주세요");
			}
			
		});
   });
   
   
   <%-- 비밀번호 --%> <%-- 비밀번호 확인 --%> <%-- 둘다 onkeyup 이벤트 이므로 onkeyup="chkPw()" 으로 처리해 같은 함수안에 넣어주었다 --%>
   
   function chkPw(){
	   var password = $("#formPassword > #inputSuccess4").val();
	   // 정규표현식
	   var check2 = /^[a-zA-Z0-9]{7,11}$/;
	   if(password.match(check2)){
			  
			  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
			  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
			  $("#formPassword").removeClass("has-error");
			  $("#checkPassword_Img").removeClass("glyphicon-warning-sign");
			  
			  // class 추가시켜주는 작업
			  $("#formPassword").addClass("has-success");
			  $("#checkPassword_Img").addClass("glyphicon-ok");
			  
		  }else{ 
			  
			// 초기화 시켜주는 작업
			  $("#formPassword").removeClass("has-success");
			  $("#checkPassword_Img").removeClass("glyphicon-ok");
			  
			// class 추가시켜주는 작업
			  $("#formPassword").addClass("has-error"); 
			  $("#checkPassword_Img").addClass("glyphicon-warning-sign");
			  
		  }
	   
	   	  var member_password = $("#formPassword > #inputSuccess4").val();
	  	  var member_password_chk = $("#formPassword_chk > #inputSuccess4").val();
	  	  // 정규표현식
		  var check2 = /^[a-zA-Z0-9]{7,11}$/;
	  	
		  // 비밀번호와 비밀번호 체크가 일치하면서 조건식이 맞아야 ok
	  	  if(member_password == member_password_chk&& member_password_chk.match(check2) ){
	  		
	  	  
		  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
		  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
		  $("#formPassword_chk").removeClass("has-error");
		  $("#checkPassword_chk_Img").removeClass("glyphicon-warning-sign");
		  
		  // 비밀번호와 비밀번호 확인란이 일치하지 않는데 submit 한 경우 glyphicon-remove 라는 이미지가 출력 // 다시 수정해 비밀번호와 비밀번호 확인란이 일치했을 때 해당 이미지 지워주기 위함 // 어차피 한번뜨고 안뜰애들
		  $("#checkPassword_chk_Img").removeClass("glyphicon-remove");
		  $("#formPassword_chk").removeClass("has-warning");
		  
		  // class 추가시켜주는 작업
		  $("#formPassword_chk").addClass("has-success");
		  $("#checkPassword_chk_Img").addClass("glyphicon-ok");
		  
	  	  }else{ 
		  
		  // 초기화 시켜주는 작업
		  $("#formPassword_chk").removeClass("has-success");
		  $("#checkPassword_chk_Img").removeClass("glyphicon-ok");
		  
		  // class 추가시켜주는 작업
		  $("#formPassword_chk").addClass("has-error"); 
		  $("#checkPassword_chk_Img").addClass("glyphicon-warning-sign");
		  
		  
		  
	  }
	   
   }
   

   $("#formMemberZip_Code > inputSuccess4").change(function(){
	alert("ㅁ");
	 var formMemberZip_Code = $("#formMemberZip_Code > #inputSuccess4").val().length;
	 if(formMemberZip_Code == 5){
		 
			// 초기화 시켜주는 작업
			  $("#formMemberZip_Code").removeClass("has-error");
			  $("#formMemberZip_Code_Img").removeClass("glyphicon-warning-sign");
			  
			// class 추가시켜주는 작업
			  $("#formMemberZip_Code").addClass("has-success"); 
			  $("#formMemberZip_Code_Img").addClass("glyphicon-ok");
			  
	 }else{
		 
		 
			// 초기화 시켜주는 작업
			  $("#formMemberZip_Code").removeClass("has-success");
			  $("#formMemberZip_Code_Img").removeClass("glyphicon-ok");

			  
			// class 추가시켜주는 작업
			  $("#formMemberZip_Code").addClass("has-error"); 
			  $("#formMemberZip_Code_Img").addClass("glyphicon-warning-sign");
			
			  
	 }
	 
	
	
   });
	  // 비밀번호 , 비밀번호 확인칸의 내용이 일치하지 않을때 submit false 설정
	  $("#submit").click (function(){
		  
		  
		  // 우편번호 미기입 시 submit 되지않도록
		  var formMemberZip_Code = $("#formMemberZip_Code > #inputSuccess4").val();
		  if(formMemberZip_Code == ""){
			  $("#formMemberZip_Code").addClass("has-error");
		  		$("#formMemberZip_Code_Img").addClass("glyphicon-remove");
			  return false;
		  }
		  
		  
	  	// 비밀번호 불일치 텍스트 계속 남아있는것을 지우기위해
	  	$("#chkPw").text("");
	  	var member_password = $("#formPassword > #inputSuccess4").val();
	  	var member_password_chk = $("#formPassword_chk > #inputSuccess4").val();
	  	var idCheck = $("#chk").val();
	  	
	  	
	  	if(member_password!=member_password_chk ){
	  		$("#checkPassword_chk_Img").removeClass("glyphicon-warning-sign");
	  		$("#formPassword_chk").removeClass("has-error");
	  		
	  		// 갈색배경과 x 이미지 출력
	  		$("#formPassword_chk").addClass("has-warning");
	  		$("#checkPassword_chk_Img").addClass("glyphicon-remove");
	  		$("#chkPw").text("비밀번호 불일치");
	  		// false 이면 submit 자체가 안된다
	  		return false;
	  	}
	  	
	  	return true;
	  });


	
	
	  <%-- 회원이름 --%>
	// 조건이 만족할 시 input 안에 체크와 초록색 , 불만족 경고표시와 빨강색
	// 아이디,비밀번호,연락처 등등 input 안에 id="inputSuccess" 여러개 사용해야하므로 상속관계로 표현  (중복안되도록)
	   $("#formMemberName > #inputSuccess4").keyup(function(){
		   
		   var MemberName = $("#formMemberName > #inputSuccess4").val();
		   var check4 = /^[a-zA-Z가-힣]{1,10}$/;
		   // 1~10 글자 사이로 입력
		  if(MemberName.match(check4)){
			  
			  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
			  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
			  $("#formMemberName").removeClass("has-error");
			  $("#formMemberName_Img").removeClass("glyphicon-warning-sign");
			  
			  // class 추가시켜주는 작업
			  $("#formMemberName").addClass("has-success");
			  $("#formMemberName_Img").addClass("glyphicon-ok");
			  
		  }else{ 
			  
			// 초기화 시켜주는 작업
			  $("#formMemberName").removeClass("has-success");
			  $("#formMemberName_Img").removeClass("glyphicon-ok");
			  
			// class 추가시켜주는 작업
			  $("#formMemberName").addClass("has-error"); 
			  $("#formMemberName_Img").addClass("glyphicon-warning-sign");
			  
			  
			  
		  }
		   
		
	   });
	   
	   <%--회원 생일--%>
	   $("#formMemberBirthDay > #inputSuccess4").change(function(){
		   $("#formMemberBirthDay_Img").removeClass("glyphicon-warning-sign");
		   $("#formMemberBirthDay_Img").addClass("glyphicon-ok");
			  $("#formMemberBirthDay").addClass("has-success");
			   
		   });
	   
	   
	   <%-- 회원 성별 --%>
	   $("#formGender > #inputSuccess4").click(function(){
		   $("#formGender_Img").removeClass("glyphicon-warning-sign");
		   $("#formGender_Img").addClass("glyphicon-ok");
		   $("#formGender").addClass("has-success");
		  r
	   });
	   
	   <%-- 회원 연락처 --%> <%-- phone input들은 서로 밀접한 관련(ex)) 첫번째 input 에 오류가 있을 경우 두,세번째 올바르게 입력해도 오류 남아있도록 )이 있어 모두 onkeyup="chkPhone()" 함수에 넣어주었다 --%>
		   function chkPhone(){
		
			   var Phone1 = $("#formPhone > #phone1 > #inputSuccess4").val();
			   // 정규표현식
			   var check5 = /^0[0-9]{1,2}$/;
			   // 첫번째 넘버 ex)) 010 , 016 , 02 ...
			   //  2~3글자 사이로 입력
			  if(Phone1.match(check5)){
				  
				  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
				  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
				  $("#formPhone").removeClass("has-error");
				  $("#formPhone_Img").removeClass("glyphicon-warning-sign");
				  
				  // class 추가시켜주는 작업
				  $("#formPhone").addClass("has-success");
				  $("#formPhone_Img").addClass("glyphicon-ok");
				  
			  }else{ 
				  
				// 초기화 시켜주는 작업
				  $("#formPhone").removeClass("has-success");
				  $("#formPhone_Img").removeClass("glyphicon-ok");
				  
				// class 추가시켜주는 작업
				  $("#formPhone").addClass("has-error"); 
				  $("#formPhone_Img").addClass("glyphicon-warning-sign");
				  
				  
				  
			  }
			   
			  var Phone2 = $("#formPhone > #phone2 > #inputSuccess4").val();
			   // 정규표현식
			   var check6 = /^[0-9]{3,4}$/;
			   // 두번째 넘버 ex)) 000 , 0000
			   //  3~4글자 사이로 입력
			  if(Phone2.match(check6)){
				  
				  /*
				  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
				  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
				  // 주석처리 이유 >> 첫번째 input phone 에서 오류 발생해도 두번째 input 이 조건이 만족할 경우 기존 input phone 에 출력된 오류표시가 삭제되므로
				  $("#formPhone").removeClass("has-error");
				  $("#formPhone_Img").removeClass("glyphicon-warning-sign");
				  */ 
				  
				  
				  // class 추가시켜주는 작업
				  $("#formPhone").addClass("has-success");
				  $("#formPhone_Img").addClass("glyphicon-ok");
				  
				  
			  }else{ 
				  
				// 초기화 시켜주는 작업
				  $("#formPhone").removeClass("has-success");
				  $("#formPhone_Img").removeClass("glyphicon-ok");
				  
				// class 추가시켜주는 작업
				  $("#formPhone").addClass("has-error"); 
				  $("#formPhone_Img").addClass("glyphicon-warning-sign");
				  
				  
			  
			  }
			  
			  var Phone3 = $("#formPhone > #phone3 > #inputSuccess4").val();
			  // 정규표현식
			  var check7 = /^[0-9]{4}$/;
			  // 마지막 넘버 ex)) 0000
			  //  4글자 사이로 입력
			  if(Phone3.match(check7)){
				  
				  /*
				  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
				  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
				  // 주석처리 이유 >> 첫번째,두번째 input phone 에서 오류 발생해도 세번째 input 이 조건이 만족할 경우 기존 input phone 에 출력된 오류표시가 삭제되므로
				  $("#formPhone").removeClass("has-error");
				  $("#formPhone_Img").removeClass("glyphicon-warning-sign");
				  */ 
				  
				  // class 추가시켜주는 작업
				  $("#formPhone").addClass("has-success");
				  $("#formPhone_Img").addClass("glyphicon-ok");
				  
				  
			  }else{ 
				  
				// 초기화 시켜주는 작업
				  $("#formPhone").removeClass("has-success");
				  $("#formPhone_Img").removeClass("glyphicon-ok");
				  
				// class 추가시켜주는 작업
				  $("#formPhone").addClass("has-error"); 
				  $("#formPhone_Img").addClass("glyphicon-warning-sign");
				  
				  
				  
			  }
			   
		   }
			   

			   
			   
		
				   
		<%-- 회원 이메일 --%>
		function chkEmail(){
			
			 
			   var Email = $("#formEmail > #Email1 > #inputSuccess4").val();
			   
			   // 정규표현식 
			   var check8 = /^[a-zA-Z0-9]{3,20}$/;
			   
			  if(Email.match(check8)){
				 
				  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
				  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
				  $("#formEmail").removeClass("has-error");
				  $("#formEmail_Img").removeClass("glyphicon-warning-sign");
				  
				  // class 추가시켜주는 작업
				  $("#formEmail").addClass("has-success");
				  $("#formEmail_Img").addClass("glyphicon-ok");
				  
			  }else{ 
				   
				// 초기화 시켜주는 작업
				  $("#formEmail").removeClass("has-success");
				  $("#formEmail_Img").removeClass("glyphicon-ok");
				  
				// class 추가시켜주는 작업
				  $("#formEmail").addClass("has-error"); 
				  $("#formEmail_Img").addClass("glyphicon-warning-sign");
				  
				  
				  
			  }
			  
			
				
			  
			
		}
		
		// 이메일 onchange이벤트  (직접입력 선택 시 input 창 생기도록)
		function onChange(){
			
			
			// 직접입력 후 다시 naver.com 이나 gmail.com 으로 변경 할 시 기존 에러문구 없애주는것
			$("#formEmail").removeClass("has-error");
			$("#formEmail_Img").removeClass("glyphicon-warning-sign");
			// naver.com 이나 gmail.com 이 선택되었을때는 success 뜨도록
			$("#formEmail").addClass("has-success");
			$("#formEmail_Img").addClass("glyphicon-ok");
			
			f = document.forms.form;
			var email = document.getElementById("email");
			// select 에서 몇번째 index 선택했는지 알려주는 코드
			var selectedIndex = email.options[email.selectedIndex].value;
			// 직접입력 선택안해도 계속 남아있느것을 없애주기위한 코드
			f.member_email2.style.display="none";
			// 직접입력에 값넣고 naver.com 이나 gmail.com 으로 변경시 남아있는 직접입력칸 값 지워주기
			f.member_email2.value="";
			
			// 직접입력 선택하고 , 다시 naver.com 이나 gmail.com 선택 시 남아있는 required(필수 입력란) 지워주는 역할
			f.member_email2.required="";
		
			
			// 직접입력 선택시 실행될 메소드
			if(selectedIndex==""){
				// 직접입력 선택 시 member_email2 input 창 보이도록
				f.member_email2.style.display="";
				
				// 직접입력 선택 시 member_email2 input 창 입력 필수로 설정
				f.member_email2.required="required";
				
				// 직접입력 선택 시 처음에는 아무것도 없으므로 바로 에러경고문 출력되도록 선언
				  $("#formEmail").addClass("has-error"); 
				  $("#formEmail_Img").addClass("glyphicon-warning-sign");
				  
				  
				  
				$("#formEmail > #Email3 > #inputSuccess4").keyup(function(){
				var Email3 = $("#formEmail > #Email3 > #inputSuccess4").val();
				 
				   // 정규표현식 
				   var check9 = /^[a-zA-Z]{3,10}*.[a-zA-Z]{2,7}$/;
				   
				  if(Email3.match(check9)){
					  $("#formEmail").removeClass("has-error");
					  $("#formEmail_Img").removeClass("glyphicon-warning-sign");
					
					  
					  // class 추가시켜주는 작업
					  $("#formEmail").addClass("has-success");
					  $("#formEmail_Img").addClass("glyphicon-ok");
					  
				  }else{ 
					  $("#formEmail").removeClass("has-success");
					  $("#formEmail_Img").removeClass("glyphicon-ok");
					  
					  
					// class 추가시켜주는 작업
					  $("#formEmail").addClass("has-error"); 
					  $("#formEmail_Img").addClass("glyphicon-warning-sign");
					  
					  
					  
				  }
				});
				
			} 
			
		}
		
		
		
		<%-- 우편번호 --%>
		
		// 버튼 클릭되는 순간 초록색으로 변하도록
		$("#postcodify_search_button").click(function(){
			
			var Member_Zip_Code = $("#formMemberZip_Code > #inputSuccess4").val().length;	
			  
			  if(Member_Zip_Code == 0){
				 
				 

				  // has-success = input 테두리 초록색 // has-error = input 테두리 빨강색 // glyphicon-ok = input 끝에 체크 표시 // glyphicon-warning-sign = input 끝에 경고문 표시
				  // 초기화 시켜주는 작업 (ex)) 에러 후 성공해도 remove 해주지 않으면 계속 error 클래스는 남아있으므로 )
				  $("#formMemberZip_Code").removeClass("has-error");
				  $("#formMemberZip_Code_Img").removeClass("glyphicon-warning-sign");
				  $("#formMemberZip_Code_Img").removeClass("glyphicon-remove");
				  
				  // class 추가시켜주는 작업
				  $("#formMemberZip_Code").addClass("has-success");
				  $("#formMemberZip_Code_Img").addClass("glyphicon-ok");
				
				
			  }else{ 
				  
				  
				 
				  
			  }
			  
			
			
			
		});
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->

		$(function() {
		    $("#postcodify_search_button").postcodifyPopUp();
		});
		
		
		
		
		
		
		
		<%-- 도로명주소 --%>
		
		
		
		<%-- 상세주소 --%>
		
		
		
		
		
		
		<%-- 사진 --%>
		<!-- 이미지 파일 업로드시 미리 볼 수 있게 화면에 출력 -->
		function readURL(input) {
			 
		    if (input.files && input.files[0]) {
		        var reader = new FileReader();
		 
		        reader.onload = function (e) {
		            $('#img').attr('src', e.target.result);
		        }
		 
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		 
		$("#member_profile_pic").change(function(){
		    readURL(this);
		});
		
				   
</script>



</body>
</html>
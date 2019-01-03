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
	<form action="${pageContext.request.contextPath }/update/phoneNum" method="post" class="form-inline">
	<fieldset>
<legend>연락처 수정</legend>
<div class="row form-group has-feedback" id="formPhone">
<p class="text-danger">최근 수정일 : ${Member.member_updatePhoneNum_date }</p> 기존 연락처 : <span>${Member.member_phone }</span><br>
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
  <input type="submit" class="btn btn-default" value="수정">
</div>
<br>
<br>
</fieldset>
</form>

<form action="${pageContext.request.contextPath }/update/email" method="post" class="form-inline" id="form">
<fieldset>
<legend>이메일 수정</legend>
<div class="row form-group has-feedback" id="formEmail">

<p class="text-danger">최근 수정일 : ${Member.member_updateEmail_date }</p> 기존 이메일 : <span>${Member.member_email }</span><br>
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
  <input type="submit" class="btn btn-default" value="수정">
</div>
</fieldset>
</form>

<br>
<br>


<form action="${pageContext.request.contextPath }/update/address" method="post" class="form-inline">
<fieldset>
<legend>주소 수정</legend>
<div class="form-group  has-feedback" id="formMemberZip_Code">
<p class="text-danger">최근 수정일 : ${Member.member_updateAddress_date }</p>
					<table border="1" class="table-condensed">
						<tr>
							<th></th>
							<th>우편번호</th>
							<th colspan="1">주소</th>
							<th>상세주소</th>
						</tr>
						<tr>
							<td>기존 주소</td>
							<td>${Member.member_Zip_code}</td>
							<td>${Member.member_Street_name_address}</td>
							<td>${Member.member_Detailed_Address }</td>
						</tr>
					</table>
					<br>
    <label class="control-label" for="inputSuccess4" >우편 번호</label>
    <input type="text" class="form-control postcodify_postcode5 onlyNone" name="member_Zip_code" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" required="required"  pattern="\d{5}" title="필수 입력란 입니다">
    <button id="postcodify_search_button" type="button" class="btn btn-primary" >검색</button>
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formMemberZip_Code_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
    
</div>
<br>
<br>

<div class="form-group  has-feedback" id="formMemberStreet_Name">
    <label class="control-label" for="inputSuccess4" >도로명주소</label>
    <input type="text" class="form-control postcodify_address" name="member_Street_name_address" autofocus="autofocus" id="inputSuccess4" aria-describedby="inputSuccess4Status" readonly="readonly" size="30">
    <span class="glyphicon  form-control-feedback" aria-hidden="true" id="formMemberStreet_Name_Img"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<br>

<div class="form-group  has-feedback" >
    <label class="control-label" for="inputSuccess4" >상세주소</label>
    <input type="text" class="form-control postcodify_details" name="member_Detailed_Address" autofocus="autofocus"  aria-describedby="inputSuccess4Status">
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
    <input type="submit" class="btn btn-default" value="수정">
</div>

</fieldset>
</form>
<br>
<br>

<form action="${pageContext.request.contextPath }/update/profile" method="post"  enctype="multipart/form-data"  class="form-inline">
<fieldset>
<legend>프로필 수정</legend>
<div class="form-group  has-feedback" >
<p class="text-danger">최근 수정일 : ${Member.member_updateProfile_date }<p>
기존 프로필 <span><img src="${Member.member_profile_pic}" alt="이미지" width="50px" height="50px" border="1px" style="border-radius: 100px;"></span><br>
<input type="file" name="file" id="member_profile_pic"><br>
<%-- 이미지 넣을 공간 --%>
<img id="img" src="#" alt="이미지" width="100px" height="100px" border="1px"/><br>
    <span class="glyphicon  form-control-feedback" aria-hidden="true"></span>
    <span id="inputSuccess4Status" class="sr-only">(success)</span>
</div>
<br>
<input type="submit" class="btn btn-default" value="수정">

</fieldset>

</form>

<a href="${pageContext.request.contextPath }/">[메인 페이지]</a>
</div>

<script type="text/javascript">


//영어와 숫자만
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


$("#submit").click (function(){
	  // 우편번호 미기입 시 submit 되지않도록
	  var formMemberZip_Code = $("#formMemberZip_Code > #inputSuccess4").val();
	  if(formMemberZip_Code == ""){
		  $("#formMemberZip_Code").addClass("has-error");
	  		$("#formMemberZip_Code_Img").addClass("glyphicon-remove");
		  return false;
	  }
	  return true;
}


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

//이메일 onchange이벤트  (직접입력 선택 시 input 창 생기도록)
function onChange(){
	
	
	
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
	}
}

// 우편번호 미기입시 submit 되지않도록
$("#submit").click(function(){
var member_Zip_code = $("#member_Zip_code").val();
	
	if((member_Zip_code)==""){
		return false;
	}
});


<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->

$(function() {
   $("#postcodify_search_button").postcodifyPopUp();
});

</script>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
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
<%--
private String member_id;
	private String member_password;
	private String member_name;
	private String member_birthday;
	private String member_gender;
	private String member_phone;
	private String member_address;
	private int member_trip_exp;
	private String member_register_date;
	private String member_profile_pic;
	// 0 이면 사용자 1이면 어드민
	private int member_type;
 --%>
<body>
<form action="${pageContext.request.contextPath }/update/password" method="post">

<div id="loginUp">
<fieldset>
<legend>비밀번호 변경</legend>
<input type="password" class="form-control FC_B" name="current_member_password" id="current_member_password" placeholder="현재 비밀번호"><c:if test="${notMatch }"><span style="color: red">비밀번호를 다시 확인해주세요</span></c:if><br>
<input type="password" class="form-control FC_B" name="new_member_password" id="new_member_password" pattern="\d{7,11}" title="비밀번호를 7~11글자로 작성해주세요" placeholder="새로운 비밀번호"><br>
<input type="password" class="form-control FC_B" name="new_member_password_chk" id="new_member_password_chk" placeholder="새로운 비밀번호 확인"> <span id="passwordText" style="color: red"></span><br>
<input type="submit" value="수정완료" id="submit"><br><br>
<a href="${pageContext.request.contextPath }/">[메인 페이지]</a>
</fieldset>
</div>
</form>

<script type="text/javascript">
<%-- 새로운 비밀번호, 새로운 비밀번호 확인 ajax
$("#match").click(function(){
	var current_member_password = $("#current_member_password").val();
	var new_member_password = $("#new_member_password").val();
	var new_member_password_chk = $("#new_member_password_chk").val();
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/updatePwChk/"+current_member_password+"/"+new_member_password_chk,
		dataType:"json",
		success : function(check){
			$("#passwordText").text(check.msg);

		},
		error : function(){
			$("#passwordText").text("입력해주세요");
		}
	});
	
});
--%>

$("#submit").click (function(){
	$("#passwordText").text("");
	var member_password = $("#new_member_password").val();
	var member_password_chk = $("#new_member_password_chk").val();
	if(member_password != member_password_chk){
		$("#passwordText").text("비밀번호 불일치");
		return false;
	}
	if(member_password == "" || member_password_chk == ""){
		$("#passwordText").text("입력해주세요");
		return false;
	}
	
	$("#inputsearch").on('keyup', function() {
        $('#memberListTable').html('');
        var   search =  $("#inputsearch").val();         

           $.ajax({
                 type : "POST",
                 url : "${pageContext.request.contextPath}/"+search,
                 dataType : "json",               
                 success : function(result) {                  
                    $.each(result, function(index, i){
                       
                       var contents = "<tr class = 'memberContens'>";
                       contents +="<td><div class=\"user_profile_picture col-md-4\"><img src = \""+ i.member_profile_pic + "\"  style = \"width:100px; height:100px;\"/></div></td>";
                       contents +="<td>" + i.member_id + "<td>";
                       contents +-"</tr>";                              
                       
                       $("#memberListTable").append(contents);                        
                    });                        
                 },
                 error : function() {
                    alert("ajax 실패");
                 }
              });
                 //end
           });
});

</script>
</body>
</html>
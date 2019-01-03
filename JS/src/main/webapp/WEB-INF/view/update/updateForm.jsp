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
<form action="${pageContext.request.contextPath }/update" method="post">
<p>아이디 : ${Member.member_id }</p>
현재 비밀번호 : <input type="password" name="current_member_password" id="current_member_password"><c:if test="${notMatch }"><span style="color: red">비밀번호를 다시 확인해주세요</span></c:if><br>
새로운 비밀번호 : <input type="password" name="new_member_password" id="new_member_password"><br>
새로운 비밀번호 확인 : <input type="password" name="new_member_password_chk" id="new_member_password_chk"> <span id="passwordText" style="color: red"></span><br>

<input type="submit" value="수정완료" id="submit">

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
});

</script>
</body>
</html>
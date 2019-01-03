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
</head>
<body>

<div id="message" class="form-inline" >

<form action="${pageContext.request.contextPath }/message/send" method="post" id="form" enctype="multipart/form-data">
<fieldset>
<legend>메시지 보내기</legend>
<c:if test="${MessageError }"><span style="color: red">해당하는 회원정보가 없습니다</span></c:if><br>

																		<%-- 수정 못하도록 흑백 --%>
보내는 이 : <input class="form-control FC_B" type="text" name="member_id" value="${Member.member_id }" disabled="disabled"><span><img src="${Member.member_profile_pic }" width="50px" height="50px" border="1px" style="border-radius: 100px;"></span><br>
																	<%-- 멤버 정보가 있는지 확인 후 출력될 공간 --%>
받는 이 : <input type="text" class="form-control FC_B" name="member_receiver" id="member_receiver"><span id="chkMember" style="color: red"></span> <button id="btn" type="button" class="btn btn-default" style="padding: 5px">Search</button><br>				
메시지 내용<br><textarea class="form-control FC_B" rows="10" style="width: 300px" name="message_content" id="message_content" onkeyup="writeMsg()" placeholder="메시지 내용을 입력해주세요"  title="ㅁㄴㅇ" ></textarea><br><span id="countMsg">0/300</span><span id="Max50" style="color: red"></span><br>
<input type="file" name="file" id="member_profile_pic" multiple="multiple"><br>
<img id="img" src="#" alt="이미지" style="width: 50px; height: 50px; border: 1px"><br>
<input type="submit" value="전송" id="submit" class="btn btn-default" style="padding: 5px">
</fieldset>
</form>
</div>
<script type="text/javascript">
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

<%-- input 의 placeholder 명령어로 해결

// 메시지 content 클릭 시 메시지 내용을 입력해주세요 사라지도록
$("#message_content").focus(function(){
	
	
	$("#message_content").text("");
	
	
});

// 메시지 content 외부 영역 클릭시 다시 메시지 내용을 입력해주세요 출력되도록
$("#message_content").focusout(function(){
	$("#message_content").text("메시지 내용을 입력해주세요");
	
});
--%>
// ajax 이용해 멤버정보가 있는지 확인
$("#btn").click (function(){
	var member_id = $("#member_receiver").val();
	var abc = "" ;
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/memberChk/"+member_id,
		dataType:"json",
		
		success : function(check){
			$("#chkMember").text("");
			$("#chkMember").text(check.msg);
			
			abc = check.msg;
			
		},
		error : function(){
			$("#chkMember").text("메시지 보낼 대상을 입력해주세요");
		}
		
		
	});
	
	<%-- try catch 문으로 처리 해당 아이디가 있을경우 메시지 보내기성공 없을경우 catch문으로 넘어가 보내기 실패
	$("#submit").click (function(){
		alert(abc);
		var def = "해당 아이디 정보가 없습니다.";
		var def1 = "체크완료";
			if(abc == def){	
					$("#chkMember").text("");
					return false;	
			}
			if(abc == def1){
					return true;
			}
	});
	--%>
});

// 메시지 박스안 보낼 데이터 제한  ?/300 형태
function writeMsg(){
	// 현재 textArea 의 내용 length
	var countMsgLength = $("#message_content").val().length;
	
	
	// count 가 300 초과할 때
	if(countMsgLength > 300){
		$("#Max50").text("텍스트 내용이 너무 많습니다");
	}
	// count 가 300 이하일 때
	if(countMsgLength <= 300){
		$("#Max50").text("");
	}
	
	
	$("#countMsg").text(countMsgLength+"/300");
	
	
}

// 메시지 내용이 300이 넘어가면 submit 자체가 안되도록
$("#submit").click(function(){
	var countMsgLength = $("#message_content").val().length;
	if(countMsgLength > 300){
		
		
		return false;
	}
	
});



</script>
</body>
</html>
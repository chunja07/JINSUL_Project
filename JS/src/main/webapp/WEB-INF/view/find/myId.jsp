<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/javascript.js"></script>
<LINK REL="StyleSheet"
   HREF="<%=request.getContextPath()%>/resources/css/style.css"
   TYPE="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
</head>
<body>
<section id="logins" class="user_input" style="background: url('${pageContext.request.contextPath }/resources/img/bg.gif') no-repeat center center fixed ; background-size: cover;" >
	<form action="${pageContext.request.contextPath }/MyId" method="post" id="form">
	<div id="wrap">
		<div class="bg">
			<div class="a">
				<div class="input_container row">
					<div class="title">
						<div> ID Search </div>  
					</div>
					<div class="login_div">
						<div class="inputmember">
							<div class="div_center" style="width: 190px;">
								<div>
									<%-- ajax success 될 경우 해당되는 정보 출력될 공간 --%>
									<p id="findMyId" style="color: red"></p>
								</div>
								<div class="id_pw_input">
									핸드폰 번호 :  <input type="text" name="member_phone" size="10" maxlength="13" id="member_phone" placeholder="하이픈(-) 입력" style="width: 160px;">
								</div>
								<div class="id_pw_input" style="margin-bottom: 20px">
									이메일 : <input type="email" name="member_email" id="member_email" style="width: 160px;">
								</div>
								<div class="login_btn" style="width: 180px;">
										<%-- 정보 검색 찾기 버튼 --%> 
		                       	    	<button type="button" id="btn" style="background: #ffbdcb; padding: 5px; width: 180px; border: 0px; color: white; background: none;">찾기</button><br>
		                          	</div>
							
							</div>
						
							
							
								
							
							
							
							
							
							
							
							
						</div>
					</div>
				</div> 
			</div>
		</div>
	</div>
	</form>
</section>

</body>




<script>

// 찾기 누르지않고 엔터눌러도 찾기가 실행되도록 해주는 코드
$("#member_email").keypress(function(event){
	if(event.keyCode==13){
		$("#btn").click();
		return false;
	}
	
});
	


// 같은 name 값 3개 가져오기
$("#btn").click(function(){
	
	var member_phone = $("#member_phone").val();
	var member_email = $("#member_email").val();
	$.ajax({
		type:"POST",							// member_email 을 마지막에 넣으면 .com 이 출력이 안된다 ( 주소로 인식 )
		url:"${pageContext.request.contextPath}/findMyId/"+member_email+"/"+member_phone,
		dataType:"json",
		
		success : function(find){
			$("#findMyId").text("아이디:"+find.msg);
		},
		
		error : function(){
			$("#findMyId").text("에러");
		}
		
		
		
	});
	
});





</script>
</html>
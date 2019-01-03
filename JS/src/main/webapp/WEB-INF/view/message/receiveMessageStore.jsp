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
<LINK REL="StyleSheet"
	HREF="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.css" TYPE="text/css">
<LINK REL="StyleSheet"
	HREF="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.js" >

	
</head>
<body>
<div style="width: 50% ; margin: 0 auto">
<fieldset>
<legend>받은 메시지 보관함</legend>


<%-- 메시지가 한개가 아니라 여러개일 경우 구별해주기위해 for 반복문 이전에 변수선언--%>
<%
int i = 0;
%>

<c:forEach items="${receiveMessage }" var="receiveMessage" varStatus="status">
보낸사람 : ${receiveMessage.member_id }<img src="${receiveMessage.message_profil_pic }" width="50px" height="50px" border="1px" style="border-radius: 100px;"/><br><br>


									<%-- 받은 내용 수정못하고 읽을수만 있도록 --%>
내용<br><textarea class="form-control" id="content" rows="10" cols="10" readonly="readonly" style="overflow: scroll; width: 200px; height: 200px; ">${receiveMessage.message_content }</textarea>
<form id="form">




<c:forTokens items="${receiveMessage.message_picture }" delims="|"  var="messagePicture">

<a href="${messagePicture }" download><img src=<%=request.getContextPath()%>/resources/img/download.jpg width="30" height="30" class="image${status.index }" style="display: none"></a>
<img src="${messagePicture }"  id="messageImg"  class="image${status.index }" alt="받으신 사진이 없습니다" width="50px" height="50px"  name="image" style="display:none">

</c:forTokens>
<br>
<button id="image${status.index }" type="button" class="btn btn-default">이미지 보기</button><br>
<a href="${pageContext.request.contextPath }/message/delete/receiveMessage/${receiveMessage.message_id}">[삭제하기]</a>
</form>
<br>
<hr>
</c:forEach>
</fieldset>
</div>
<script>


//   요소[속성^=값] 
//      속성 안의 값이 특정 값으로 시작하는 문서 객체를 선택 (like 처럼 검색)
// id값이 image 로 시작하는 버튼을 누를 시 작동되는 메소드
// id값이 form 안에 input 태그가 hide 되어있다가 버튼 누를 시 show 되도록
// '.'+this.id 는 첫 문단에서 실행한 id^=image 의 id 를 클래스형태로 변형 (이를 실행시키기위해 input class명과 button id 명을 일치시켰다)

$('[id^="image"]').on('click', function(e) {
   
    
    $('.'+ this.id).show();
    
});

// 첨부 파일에 마우스 올라갈 경우 
// 해당 올라간 파일의 크기가 0.5초에 걸쳐 width 200 height 200 만큼 커진다
$(messageImg ).click(function(){

        $( this ).animate( {
          width: '200px',
          height: '200px'
        }, 500 );
});

// 첨부 파일에서 마우스가 벗어난경우
// 다시 원상탤
$(messageImg).mouseleave(function(){
	 $( this ).animate( {
         width: '50px',
         height: '50px'
       }, 500 );
	
});


$("#content").mCustomScrollbar({
    theme:"dark"
  });






</script>
</body>
</html>
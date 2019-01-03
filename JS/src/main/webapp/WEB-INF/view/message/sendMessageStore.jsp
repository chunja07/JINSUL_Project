<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<style>

</style>
</head>
<body>
<h3>내가 보낸 메시지함</h3>

<c:forEach items="${sendMessage }" var="sendMessage" varStatus="status">
보낸사람 : ${sendMessage.member_receiver }<img src="${sendMessage.message_profil_pic }" id="abcasd" width="50px" height="50px" border="1px" style="border-radius: 100px;"/><br><br>

									<%-- 보낸 내용 수정못하고 읽을수만 있도록 --%>
내용<br><textarea rows="10" cols="10" readonly="readonly" style="overflow: scroll ">${sendMessage.message_content }</textarea>
<form id="form">


<c:forTokens items="${sendMessage.message_picture }" delims="|"  var="messagePicture">

<a href="${messagePicture }" download><img src=<%=request.getContextPath()%>/resources/img/download.jpg width="30" height="30" class="image${status.index }" style="display: none"></a>
<img src="${messagePicture }"  id="messageImg"  class="image${status.index }" alt="보내신 사진이 없습니다" width="50px" height="50px"  name="image" style="display:none">
</c:forTokens>
<button id="image${status.index }" type="button">이미지 보기</button><br>
<a href="${pageContext.request.contextPath }/message/delete/sendMessage/${sendMessage.message_id}">[삭제하기]</a>

</form>
${status.index }
${sendMessage.message_send_date }<br>
<hr>


</c:forEach>

<script>


//   요소[속성^=값] 
//      속성 안의 값이 특정 값으로 시작하는 문서 객체를 선택 (like 처럼 검색)
// id값이 image 로 시작하는 버튼을 누를 시 작동되는 메소드
// id값이 form 안에 input 태그가 hide 되어있다가 버튼 누를 시 show 되도록
// '.'+this.id 는 첫 문단에서 실행한 id^=image 의 id 를 클래스형태로 변형 (이를 실행시키기위해 input class명과 button id 명을 일치시켰다)

$('[id^="image"]').on('click', function(e) {
    $('#form > input').hide();
    
    $('.'+ this.id).show();
    
});



</script>
</body>
</html>

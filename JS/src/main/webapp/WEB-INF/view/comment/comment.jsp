<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#d{
position: relative;
width:500px;
height:100px;
margin: 10px;
overflow: auto;

}
</style>

<body>
<h3>정렬</h3>


${commentIfNull }
${commentIfNull }${commentIfNull }${commentIfNull }${commentIfNull }${commentIfNull }
<c:forEach items="${commentIfNull }" var="b">

<fieldset id="d">
<div id="a" onload="showSub()">
<p id="b">comment_id: ${b.comment_id } </p>
<p>content_id: ${b.content_id }</p>
<p>comment_parents_id: ${b.comment_parents_id }</p>
<p>comment_seq: ${b.comment_seq }</p>
<p id="c">${b.comment_depth }</p>
<p>comment_content: ${b.comment_content }</p>
</div>
</fieldset>
</c:forEach>
<script>
window.onload = function(){
	var abc = $("#c").text();
	alert(abc);
	
}

</script>
</body>
</html>

<%@page import="js.user.model.CaptCha"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="js.user.model.CaptCha"%>
<%
  new CaptCha().getCaptCha(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>
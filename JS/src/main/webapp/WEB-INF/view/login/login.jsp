<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/javascript.js"></script>
<LINK REL="StyleSheet"
   HREF="<%=request.getContextPath()%>/resources/css/style.css"
   TYPE="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
   <section id="login" style="background: url('${pageContext.request.contextPath }/resources/img/bg.gif') no-repeat center center fixed ; background-size: cover;" >
      <div id="wrap">
         <div class="bg">
            <div class="input_container row">
               <div class="title">
                  MEMBER LOGIN
               </div>   
               <div class="login_div">
               <form action="${pageContext.request.contextPath }/login" method="post">
                  <div class="inputmember">
                     <div class="div_center">
                        <div class="id_pw_input">
                           <input type="text" name="member_id" onfocus="this.value=''" value="ID">   
                        </div>   
                        <div>
                           <c:if test="${pwNotM }">
                              <span style="color: red">아이디와 비밀번호를 확인해주세요</span>
                           </c:if>
                        </div>
                        <div>
                           <c:if test="${noId }"></c:if>
                        </div>
                        <div class="id_pw_input"> 
                           <input type="password" name="member_password" onfocus="this.value=''" value="******">
                        </div>
                        <div class="login_footer">
                           <div class="id_pw_search row">
                              <div class="id_search searchs">
                                 <a href="${pageContext.request.contextPath }/MyId">id search</a>
                              </div>
                              <div class="pw_search searchs">
                                 <a href="${pageContext.request.contextPath }/MyPassword">Forgot password?</a>
                              </div>
                           </div>
                           <div class="login_btn">
                              <input type="submit" value="Login">
                           </div>
                           <div class="regist">
                              <a href="${pageContext.request.contextPath }/regist">New member?<br> Create an Account</a> 
                           </div>
                        </div>
                     </div>
                  </div>
               
               </form>
               </div>
   
            </div>
         </div>
      </div>
   </section>



</body>
</html>
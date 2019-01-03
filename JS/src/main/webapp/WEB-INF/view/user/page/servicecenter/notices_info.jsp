<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lz0e8vpjrz5ApswJPUqL&submodules=geocoder"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/view/user/include/mainheader.jsp" />
<style>
	    body{ background-color: #fafafa; }
		header{ padding-top: 0px; border: 0px solid #fafafa; }
		ul{ list-style:none; }
		
</style>

<section id="servicecenter" style= margin-top: 170px; "> 
	<div id="wrap" style="color: #272829;">
		<div class="container row">
		  <div class="login_div">
		<div class="main_left col-md-3" 
		style="margin-bottom: -83px;
    	position: relative;
    	background: #fff;
    	border: 0.1px solid white;
    	box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    	margin-left: 0px;
    	margin-top: 25px; 
    	border-radius: 15px;">
    
    
		<div class="login_div" >
		<ul style=" margin-bottom: -72px;">
		<h2 style="color: #387cb8; font-size: 20px; ">정보</h2>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/company_info">회사소개</a></li>
		<h2 style="color: #387cb8; font-size: 20px; ">법무</h2>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/policy">개인정보정책</a></li>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/tos">이용약관</a></li>
		<h2 style="color: #387cb8; font-size: 20px; ">고객센터</h2>	
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/notice">공지·건의사항</a>
		
		</li><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</ul>
		</div>
	</div>





			
			
		 
			<div class="main_right col-md-9">
<div class="items" style="margin-top: 25px; ">
				
			<div class="item" style="padding: 85px;
				    margin-bottom: 22px;
				    position: relative;
				    background: #fff;
				    border: 0.1px solid white;
				    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
				    margin-left: 11px;
				    margin-top: 19px;
				    border-radius: 15px;">
			    	
			   <div class="noti_section" style="font-size: 25px; color: #3f80ba; ">
	    	       <div>
	    	       		공지사항
	    	       </div>
	    	       <div>
	    	       	<legend class="screen_out"></legend>
	    	       </div>
	    	       <div class="content">
	    	       		<img src="${notices_info.notice_img}" style="width: 200px;">
											<br>
											${notices_info.notice_content}
	    	       </div>
    	      
    	           
    	        </div>
			    	
			</div>


			</div>	
		
	</div>
	</div>
			</div>
</section>
<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp"/>




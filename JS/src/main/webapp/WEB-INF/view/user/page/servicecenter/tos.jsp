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
		<div class="main_left col-md-3" style="    margin-bottom: -83px;
    position: relative;
    background: #fff;
    border: 0.1px solid white;
    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    margin-left: 0px;
    margin-top: 25px; 
    border-radius: 15px;">
		
		
		<div class="login_div" >
		<ul style="margin-bottom: 291px;">
		<h2 style="color: #387cb8; font-size: 20px; ">정보</h2>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/company_info">회사소개</a></li>
		<h2 style="color: #387cb8; font-size: 20px; ">법무</h2>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/policy">개인정보정책</a></li>
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/tos">이용약관</a></li>
		<h2 style="color: #387cb8; font-size: 20px; ">고객센터</h2>	
		<li><a target="asd" style="font-size: 20px; background-color: ; color: black; " href="${pageContext.request.contextPath}/notice">공지·건의사항</a>
		</li><br><br><br><br><br><br><br><br><br>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</ul>
		</div>
	</div>





			
			
		 
			<div class="main_right col-md-9">
<div class="item" style="    padding: 85px;
    margin-bottom: 22px;
    position: relative;
    background: #fff;
    border: 0.1px solid white;
    box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15);
    margin-left: 11px;
    margin-top: 25px;
    border-radius: 15px; ">
    
    
    
    <div class="etcNotice">
    <ul style="margin-bottom: 0px;">
    <h1 id="about-us" style="font-size: 30px; color: #3f80ba;">이용약관</h1><br>
				<strong>약관의 동의</strong>
				<em><b>진설 서비스 약관에 동의하신 이용자에게 서비스를 유,무료로 제공합니다.</b>
				이용자가 등록 절차를 거쳐 등록 버튼을 누름으로서 이 서비스 약관에 동의한 것으로 간주합니다.</em>
				<legend class="screen_out"></legend>

				<strong>회원이 지켜야 할 사항</strong>
				<em><b>이용자는 회원 가입시에 필요한 정보를 진실하고 정확하게 진설에 제공하여야 합니다. 
				또한 이미 제공한 정보 역시 정확한 정보가 되도록 유지하고 새로운 사실을 적용하여 바꾸어야 합니다. 
				만약 이용자가 제공한 정보가 허위로 밝혀지거나 그러하다고 의심할 만한 합리적인 이유가 발생할 경우에 더조은컴퓨터아카데미는 허위정보를 기재한 이용자의 서비스 사용을 일부 또는 전부 중지할 수 있습니다.</b>
				</em>
				<legend class="screen_out"></legend>

				<strong>이용자행동규범</strong>
				<em><b>1. 타인의 아이디(ID)와 비밀번호(PASSWORD)를 사용하는 경우<br>
				2. 타인의 프라이버시를 침해하는 음란, 저속, 위협적인 내용이나 광고성 정보, 전자우편 등을지속적으로 전송 하는 경우<br>
				3. 타인의 지적재산권을 침해하는 내용을 게시,게재, 전자메일 또는 기타의 방법으로 전송하는 경우<br>
				4. 다른 사용자의 개인정보를 수집 또는 저장하는 경우<br>
				5. 서비스를 통해 전송된 내용의 출처를 위장하는 경우</b></em>
				<legend class="screen_out"></legend>

				<strong>진설의 약속</strong>
				<em><b>진설은 이용자가 진설서비스를 이용함과 동시에 이용자의 개인정보를 보호받을 수 있도록 최선을 다하겠습니다.</b>
				진설은 이용자의 개인정보보호를 위해 다음의 5가지 원칙을 따릅니다.<br><br>
				(1) 진설은 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않습니다. <br>
				(2) 진설은 이용자의 개인정보를 공개하지 않음을 원칙으로 하나 이용자가 제공한 정보를 더 좋은 서비스의 개발과 운영을 위하여 사용할 수 있습니다. <br>
				(3) 진설은 별도의 사용자 등록이 없이 언제나 사용할 수 있습니다. <br>
				그러나 진설의 회원제 서비스를 이용할 경우 이용자의 개인정보를 등록해야 하는 절차가 필요합니다.<br>
				(4) 등록한 개인정보의 수정이 필요할 경우나 이용자의 개인보호정책에 관련한 요청이 있을 경우 즉시 반영하여 고쳐나가겠습니다.</em>
				<legend class="screen_out"></legend>

				<strong>약관의 수정</strong>
				<em><b>진설은 합리적 사유가 발생했을 경우 서비스 약관의 내용을 변경할 수 있습니다.</b>
				다만 변경된 내용은 이용자에게 공지함으로써 효력을 발생합니다. 진설은 변경된 약관을 초기화면에 공지함으로써 이용자는 직접 확인할 수 있습니다.<br>
				이용자는 변경된 약관에 동의하지 않을 경우 등록을 취소할 수 있으며, 서비스를 계속 이용할 경우 약관 변경에 대한 동의로 간주합니다.</em>
				<legend class="screen_out"></legend>

				<strong>진설 서비스의 수정</strong>
				<em><b>진설 서비스는 불가피한 사정으로 인하여 서비스를 중단할 수 있습니다.</b>
				본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당사의 관리범위 외의 서비스 설비 장애 및 기타 불가항력에 의해 보관되지 못하거나 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있는 경우에 대해 진설은 책임을 지지 않습니다. <br>
				회사는 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 회원에게 있습니다.</em>
			</ul>
			</div>
			
			</div>	
		
	</div>
	</div>
			</div>
</section>
<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp"/>




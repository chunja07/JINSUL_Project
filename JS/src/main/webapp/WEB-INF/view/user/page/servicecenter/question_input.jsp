<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lz0e8vpjrz5ApswJPUqL&submodules=geocoder"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/view/user/include/mainheader.jsp" />
<style>
body {
	background-color: #fafafa;
}

header {
	padding-top: 0px;
	border: 0px solid #fafafa;
}

ul {
	list-style: none;
}
</style>

<section id="servicecenter" style="margin-top: 170px;"">
	<div id="wrap" style="color: #272829;">

		<div class="container row">
			<div class="login_div">
				<div class="main_left col-md-3"
					style="margin-bottom: -83px; position: relative; background: #fff; border: 0.1px solid white; box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15); margin-left: 0px; margin-top: 25px; border-radius: 15px;">


					<div class="login_div">
						<ul style="margin-bottom: -72px;">
							<h2 style="color: #387cb8; font-size: 20px;">정보</h2>
							<li><a target="asd"
								style="font-size: 20px; background-color:; color: black;"
								href="${pageContext.request.contextPath}/company_info">회사소개</a></li>
							<h2 style="color: #387cb8; font-size: 20px;">법무</h2>
							<li><a target="asd"
								style="font-size: 20px; background-color:; color: black;"
								href="${pageContext.request.contextPath}/policy">개인정보정책</a></li>
							<li><a target="asd"
								style="font-size: 20px; background-color:; color: black;"
								href="${pageContext.request.contextPath}/tos">이용약관</a></li>
							<h2 style="color: #387cb8; font-size: 20px;">고객센터</h2>
							<li><a target="asd"
								style="font-size: 20px; background-color:; color: black;"
								href="${pageContext.request.contextPath}/notice">공지·건의사항</a></li>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br>
						</ul>
					</div>
				</div>

				<div class="main_right col-md-9"
					style="margin-left: -40px; margin-top: -2px;">

					<ul>
						<div class="item"
							style="padding: 85px; margin-bottom: 22px; position: relative; background: #fff; border: 0.1px solid white; box-shadow: 0 12px 15px 0 rgba(0, 0, 5, 0.15); margin-left: 11px; margin-top: 28px; border-radius: 15px;">

							<fieldset style="margin-bottom: 3px;">
								<a class="asd" style="font-size: 25px; color: #3f80ba;">건의사항</a><br>
								<br>
								<br>

								<div class="clear"></div>
								<div class="input-wrap">
									<div class="input-content">
										<form action="${pageContext.request.contextPath }/question_input" method="post">
											<div>제목</div>
											<div class="subject">
												<label for="Title" title="제목을 입력해주세요">
												<input type="text" id="Title" name="title" value="" class="type-txt" onkeydown="goLenCheck();"
													title="제목을 입력해주세요"
													style="width: 389px; height: 24px; border: 1; overflow: visible; text-overflow: ellipsis;">
												</label>
											</div>
											<div>제안내용</div>
											<div>
												<label for="Content" title="제안내용을 입력해주세요"> <textarea
														cols="" rows="" name="content" id="Content"
														title="제안내용을 입력해주세요" onfocus="CheckCate()"
														style="width: 389px; height: 230px; border: 1; overflow: visible; text-overflow: ellipsis; font-size: larger;"></textarea>
												</label>
											</div>
											<a href="${pageContext.request.contextPath}/servicecenter">
												<div class="login_btn">
													<input type="submit" value="글올리기">
												</div>
											</a>
									</form>
									</div>
								</div>
							</fieldset>
						</div>
					</ul>
				</div>

			</div>
</section>
<jsp:include page="/WEB-INF/view/user/include/mainfooter.jsp" />




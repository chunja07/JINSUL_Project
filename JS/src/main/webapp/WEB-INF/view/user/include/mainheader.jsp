<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.10/css/all.css"
	integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
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
<title>진설</title>
</head>
<body>
	<header>
		<div id="wrap">
			<div class="container" style="margin: 0 auto;">
				<div>
					<div class="logo col-md-4">
						<a href="${pageContext.request.contextPath}/"> <img
							src="<%=request.getContextPath()%>/resources/img/title.gif" />
						</a>
					</div>					
					<form action="${pageContext.request.contextPath}/" method="post">
						<div class="search col-md-5" >							
							<input type= "text"  name="search" id = "inputsearch" placeholder="ID 검색하기" autocomplete="off">
							<input type = "hidden"	name = "first" class = "first" id = "first" value = "${first}">								
							<div id = "test"  style = "left: 114px; top : 75px; overflow : scroll; overflow-x : hidden; z-index:100; position : absolute; background : white; width:280px; max-height:200px; background-color: rgba(255, 255, 255, 1); box-shadow : 0px 0px 5px 4px #ced0cf;" >
							<table class = "memberListTable" id = "memberListTable">
							</table>														
							</div>
						</div>															
					</form>							
					<div class="icons row col-md-3">
						<div class="icon">
							<a href="${pageContext.request.contextPath}/update"> <i class="fas fa-user"></i>
							</a>
						</div>
						<div class="icon">
							<a href="#"> <i class="far fa-heart"></i>
							</a>
						</div>
						<div class="icon">
							<a href="#"> <i class="far fa-compass"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<script type="text/javascript">
		  /*
		$(document).ready(function(){	
			
			$("#inputsearch").keyup(function() {	
			$('#test').show();	
			$('#memberListTable').html('');
			var	search =  $("#inputsearch").val();									
				$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/a/"+search,
						dataType : "json",					
						success : function(result) {						
							$.each(result, function(index, i){
																								
								var contents = "<tr class = \"memberContens\" data-href= \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">";								
								contents +="<td style = 'width : 120px;'><div class=\"user_profile_picture col-md-4\"><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\"><img src = \""+ i.member_profile_pic + "\"  style = \"width:70px; height:70px;\"/></div></a></td>";
								contents +="<td><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">"+i.member_id+"</a>";
								contents +="<br><span style = 'font-size:14px;'>"+i.introduction+"</span></td>";
								contents +="</tr>";											
															
								var intro = i.introduction
								console.log(intro);					
								
								
								var tr = document.querySelectorAll('tr');
								if(tr.length<3){
									$('#test').css('overflow', 'hidden');
								} else {
									$('#test').css('overflow', 'hidden scroll');
								}
																
								$("#memberListTable").append(contents);		
								
								$(".memberContens").click(function(){
									window.location = $(this).data("href");
								});
							});								
						},
						error : function() {
							
						}
					});
				
	
				
				if(search==='') {
				$('#test').hide();
				}
				
				});					
		});
		*/
		
		/*
		$(document).ready(function(){
			if($("#inputsearch").keyup == 'on'){
				$("#test").show();
			} else {
				$("#test").hide();
			}
		});
		*/
				
		$('#test').hide();
				
		$('#inputsearch').keydown(function(event){
			switch(event.keyCode){
			case 13:				
				return false;
				break;
			case 40:				
				$('.memberContens').focus();				
				break;
			case 38:				
				return false;
				break;
			}
		});	
		
		$(document).ready(function(){	
			
			$("#inputsearch").keyup(function() {	
			$('#test').show();	
			$('#memberListTable').html('');
			var	search =  $("#inputsearch").val();
			
			var first = $("#first").val();
			console.log(first);
			
			if($('#first').val()=="")	{	
			
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/a/"+search,
				dataType : "json",					
				success : function(result) {
					console.log(result)
					console.log(result.member);
					console.log(result.followed);
					if(result.member.length != 0){
					$.each(result.member, function(index, i){
						var check;
						var member_id = i.member_id;
						console.log(member_id);					
						
						$.each(result.followed, function(index, m){
							var followed_id = m.followed_id
							if(member_id==followed_id)
								check = true;								
						});
						
						if(check){
						var contents = "<tr i class = \"memberContens\" data-href= \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">";								
						contents +="<td style = 'width : 120px;'><div class=\"user_profile_picture col-md-4\"><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\"><img src = \""+ i.member_profile_pic + "\"  style = \"width:70px; height:70px;\"/></div></a></td>";
						contents +="<td><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">"+i.member_id+"</a>";
						contents +="<span>팔로우중</span>";
						contents +="<br><span style = 'font-size:14px;'>"+i.introduction+"</span></td>";
						contents +="</tr>";											
						} else {
							var contents = "<tr i class = \"memberContens\" data-href= \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">";								
							contents +="<td style = 'width : 120px;'><div class=\"user_profile_picture col-md-4\"><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\"><img src = \""+ i.member_profile_pic + "\"  style = \"width:70px; height:70px;\"/></div></a></td>";
							contents +="<td><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">"+i.member_id+"</a>";
							contents +="<br><span style = 'font-size:14px;'>"+i.introduction+"</span></td>";
							contents +="</tr>";	
						}				
						var intro = i.introduction
						console.log(intro);					
												
						var tr = document.querySelectorAll('tr');
						if(tr.length<3){
							$('#test').css('overflow', 'hidden');
						} else {
							$('#test').css('overflow', 'hidden scroll');
						}
														
						$("#memberListTable").append(contents);		
						
						$(".memberContens").click(function(){
							window.location = $(this).data("href");
						});
					});	
					
					} else {						
						var contents = "<tr i class = \"memberContens\">";
						contents += "<td style = 'width : 120px;'>"+'검색결과가 없습니다'+"</td>";
						contents +="</tr>";
						$("#memberListTable").append(contents);
					}			
					
				},
				error : function() {						
				}
			});
			
			} else {
				
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/a/"+search,
					dataType : "json",					
					success : function(result) {							
						if(result.member.length!=0){
						$.each(result.member, function(index, i){
																							
							var contents = "<tr class = \"memberContens\" data-href= \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">";								
							contents +="<td style = 'width : 120px;'><div class=\"user_profile_picture col-md-4\"><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\"><img src = \""+ i.member_profile_pic + "\"  style = \"width:70px; height:70px;\"/></div></a></td>";
							contents +="<td><a href = \"${pageContext.request.contextPath}/userprofile/"+i.member_id+"\">"+i.member_id+"</a>";
							contents +="<br><span style = 'font-size:14px;'>"+i.introduction+"</span></td>";
							contents +="</tr>";											
														
							var intro = i.introduction
							console.log(intro);					
							
							
							var tr = document.querySelectorAll('tr');
							if(tr.length<3){
								$('#test').css('overflow', 'hidden');
							} else {
								$('#test').css('overflow', 'hidden scroll');
							}
															
							$("#memberListTable").append(contents);		
							
							$(".memberContens").click(function(){
								window.location = $(this).data("href");
							});
						});		
						} else { 
							var contents = "<tr i class = \"memberContens\">";
							contents += "<td style = 'width : 120px;'>"+'검색결과가 없습니다'+"</td>";
							contents +="</tr>";
							$("#memberListTable").append(contents);
						}
					},
					error : function() {
						
					}
				});
				
			}
				
		if(search==='') {
		$('#test').hide();
		}
		
		});					
});
	</script>


</body>
</html>
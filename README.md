# "진짜 설레는 여행" Web Application 프로젝트
"Trip!For Real" Web Application Project
--


## 목적 (Purpose)

이 앱의 목적은 한 지역에 사는 로컬 주민이 자신의 지역 혹은 동네와 연관된 여행 정보를 올리는 것이다.

로컬만이 가질 수 있는 여행 정보를 바탕으로 비로컬 여행객들이 로컬의 진수를 느낄 수 있도록 만들어졌다.

이 앱을 통해 진정한 로컬 여행이 무엇인지 많은 이들이 느끼기를 바란다.

그럼 진정한 로컬 여행을 잠재적 여행자들에게 좀 더 각인시키기 위해 어떤 기능이 사용되었는지 알아보도록 하자.

(The purpose of this web application is to provide a potential tourist with genuine inoformation by the people who actually live in the area.

A potential tourist can access genuine information and it makes the tourist feel real based on the information by the locals.

As a prodiver of this service, I wish you to know what it is like to travel places where the only locals know about.

To provide potential tourists with genuine information, what kinds of functions do we use?

Please follow the development introduction below.)

## 개발 환경(Development Environment)

> Front-End

 * HTML 5
 * CSS/CSS3
 * JavaScript
 * Bootstrap 3.3.2
 * Jquery 3.3.1

> Back-End

 * Spring 4.2
 * JDK 1.8
 * Mysql 8.0
 * Mybatis 3.4
 * Tomcat 9
 * Maven 3.8

## 제작 기간 - 2018/11/12 ~ 2018/11/30

> 1st Week(11/12 ~ 11/16) 주제 설정/ DB 모델 구현/ View 페이지 구현 
  (Design/Implement - Main theme/ DB model/ View Page )
 * 11/12 개발환경 설정 및 프로젝트 주제 설정 (Design - configure / Main Theme design)
 * 11/13 HTML 및 Bootstrap을 이용하여 view 페이지 설계 및 생성 시작 (Implement view pages using HTML/Bootstrap)
 * 11/14 Mysql DB Model 설계 및 생성 (Create DB model)
 * 11/15 View Page(Main) 완성 (Create View Page)
 * 11/16 View Page(login, register) 및 MVC 디자인 패턴을 통한 로그인 및 회원가입 기능 구현 시작 (Implement view page(login, register) based on MVC design pattern)
 
> 2nd Week(11/19 ~ 11/23) 기능 구현/ DB 모델 구현/ View 페이지 구현 (Implement - Functions/ DB model/ View pages)
 * 11/19 Controller 로직 구현(로그인/회원가입) (Define/implement controller logic) 
 * 11/20 View(게시판/유저프로필) 구현 (Develop View(board/profile)) 
 * 11/21 Controller(게시판/유저프로필) 구현 (Develop controller(board/profile)) 
 * 11/22 Controller(검색 기능) 구현 (Develop controller(search)) 
 * 11/23 Controller(팔로우 기능) 구현 (Develop controller(follow)) 

> 3rd Week (11/26 ~ 11/30) 기능 구현/ DB 모델 구현/ View 페이지 구현 (Development - Functions / DB model/ View Page)
 * 11/26 관리자 게시판 CRUD 및 페이징 기능 사용 및 구현 (Develop Admin Board with CRUD pattern and Page index function)
 * 11/27 Controller(로그인/회원가입) 버그 수정 및 View(로그인/회원가입) 업데이트 (Refine Controller(login/register) / debug)
 * 11/28 Controller(팔로우/검색) 버그 수정 및 View(팔로우/검색) 업데이트 (Refine Controller(follow/search) / debug)
 * 11/29 구현 기능 보완 및 코드 정리 (Refine / debug / update)
 * 11/30 마무리 (Wrap up)
 
## 데이터 베이스 모델링
 
 ![table_model](https://user-images.githubusercontent.com/35492393/50624717-3f9f5c00-0f66-11e9-95c4-a4703dc8e17f.png)

## 패키지 구조

![package](https://user-images.githubusercontent.com/35492393/50626154-fb18be00-0f6f-11e9-90d2-f44e75bc41d8.png)

## Front-End 주요 기능
> 메인 페이지 검색(JINSUL_Project/JS/src/main/java/js/user/controller/MainPageController.java)
 * 키 입력에 따른 회원 검색(View Page와 연동)
	
		@ResponseBody
		@RequestMapping(value = "/a/{search}", method = RequestMethod.POST)
		public Map<String, List<Object>> search(Model model, HttpServletRequest request, HttpServletResponse response,
			@PathVariable("search") String search, HttpSession session) throws Exception {
		
		Map<String, List<Object>> map = new HashMap<String, List<Object>>();
		
		// 웹페이지 검색에서 검색하는 String 값 
		String searchNew = search + "%";		
		System.out.println(searchNew);
		// 로그인 하지 않았을 경우
		if(session.getAttribute("Member") == null) {
		
		// 소개글 가져오기 위한 리스트 배열
		List<Object> list = new ArrayList<>();
		
		// 문자열을 지닌 아이디값을 지닌 멤버의 정보를 불러옴
		try {
			list = loginservice.memberIntroAll(searchNew);						
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		map.put("member", list);		

		return map; 
		
		// 로그인 했을 경우
		} else {
			
			List<Object> list = new ArrayList<>();
			List<Object> fList = new ArrayList<>();			
			Member member = new Member();			
			member = (Member) session.getAttribute("Member");
			try {
				// 아이디 값에 해당하는 멤버 정보의 소개가 있는 테이블의 리스트
				list = loginservice.memberIntroAll(searchNew);
				// 아이디 값에 해당하는 멤버가 팔로우하는 아이디의 리스트
				fList = loginservice.followedLoginSelect(member);
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
			map.put("member", list);
			map.put("followed", fList);
											
			return map;
		}
		
	}
![image](https://user-images.githubusercontent.com/35492393/50625661-da9b3480-0f6c-11e9-8278-1e6b3987264d.png)
 
> 로그인 접속 화면

	public String login(HttpServletResponse response, Member member, Model model,
			@CookieValue(value = "cookie") String cookieValue, HttpSession session, HttpServletRequest request, 			RedirectAttributes variable) {
		// 입력한 정보의 아이디가 존재하는지 확인
		Member isMember = loginservice.selectById(member);
		// 존재한다면
		if (isMember != null) {
			// 패스워드 일치 로그인 성공
			if (member.getMember_password().equals(isMember.getMember_password())) {
				// main 페이지에서 c:if 로그인,로그아웃문 출력하기위해
				model.addAttribute("LoginMember", true);
				// session에 LGmember 저장
				model.addAttribute("Member", isMember);
				// 웹소켓 아이디값
				session.setAttribute("loginMemberId", member.getMember_id());

				System.out.println("소켓 모델의 session 값 : " + member.getMember_id());
				Map<String, Object> modelMap = model.asMap();
				System.out.println("모델의 session 값 : " + modelMap.get("Member"));

				List<Follow> list = new ArrayList<>();
				list = loginservice.followLoginSelect(isMember);
						
				System.out.println("로그인멤버 아이디: " + isMember.getMember_id());

				return "redirect:/";
			}
			// 로그인 실패 횟수를 누적하기 위한 코드 (model.addAttribute("cookie",cookieValue) 까지)
			int loginCount = Integer.parseInt(cookieValue);
			loginCount++;
			cookieValue = Integer.toString((loginCount));
			System.out.println("cookieValue : " + cookieValue);
			Cookie cookie1 = new Cookie("cookie", cookieValue);
			response.addCookie(cookie1);
			model.addAttribute("cookie", cookieValue);
			// 5번 로그인 실패 시
			if (loginCount >= 5) {
				// loginUp.jsp 에 로그인 5회 입력 실패 입력되도록 model 에 저장 후 loginUp.jsp 파일에 c:if 문으로 출력
				model.addAttribute("loginUp", true);
				// 아이디 , 비밀번호 , 이메일 3가지 입력하는 곳으로 이동
				return "login/loginUp";

			}
			// 패스워드가 틀림
			model.addAttribute("pwNotM", true);
			return "login/login";
![image](https://user-images.githubusercontent.com/35492393/50625725-38c81780-0f6d-11e9-9802-79bc0106affb.png)

> 로그인 완료시 팔로우 회원 출력

	public String mainPage(Member member, Model model, HttpSession session) {
		// 멤버가 로그인 했을 경우
		if (session.getAttribute("Member") != null) {
			Gson gson = new Gson();
			Member loginMember = (Member) session.getAttribute("Member");
			//  스토리에서 사진을 불러오기 위한 배열
			List<FollowPic> list = new ArrayList<>();
			list = loginservice.followedIdPic(loginMember);
			System.out.println("list아이디 픽쳐에 관한 리스트?" + list);
			
			List<Follow> fList = new ArrayList<>();
			fList = loginservice.followLoginSelect(loginMember);
			List<String> sList = new ArrayList<>();
			for (Follow follow : fList) {
				sList.add(follow.getFollowed_id());
			}
			String gList = gson.toJson(fList);
			model.addAttribute("sList", gList);
			model.addAttribute("follow", list);
			return "/user/page/main";
			
		} else {
			model.addAttribute("first","뭐야");
			return "/user/page/main";
		}

![image](https://user-images.githubusercontent.com/35492393/50626250-7e3a1400-0f70-11e9-816f-ff09c3bc9e2c.png)

> 로그인 시 검색화면에 팔로우 회원 표시

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
![image](https://user-images.githubusercontent.com/35492393/50626302-c5c0a000-0f70-11e9-847d-004c20bfaeaa.png)

>유저 프로필 화면

<!-- 만약 로그인 하지 않은 경우 경우 -->
							<c:if test="${Member==null}" var="m">
								<div>
									<span>${userMember.member_id}</span> <span></span>
								</div>

							</c:if>
							<!-- 로그인한 경우 -->
							<c:if test="${not m}">
								<!--현재 로그인유저랑 유저프로필 아이디랑 같은 경우 -->
								<c:if test="${Member.member_id==userMember.member_id}" var="id1">
									<div>
										<span>${userMember.member_id}</span> <span><a
											href="${pageContext.request.contextPath}/update"><button
													type="button" class="btn btn-warning btn-sm">프로필
													편집</button></a></span> <span><a
											href="${pageContext.request.contextPath}/update"><button
													type="button" class="btn btn-danger btn-sm">글 올리기
													</button></a></span>
									</div>
								</c:if>

								<!--현재 로그인유저랑 유저프로필 아이디랑 같지 않은 경우 -->
								<c:if test="${not id1}">
									<!--현재 관계가 yes라고 써져 있는 경우 -->
									<c:if
										test="${follow.relationship eq 'yes' && follow.followed_id==userMember.member_id}"
										var="fl">
										<div>
											<span>${userMember.member_id}</span> <span><button
													type="submit" class="btn btn-warning btn-sm"
													id="followCancel">팔로우 취소</button></span>
										</div>
									</c:if>
									<!--  팔로우 관계가 현재 yes라고 되어있지 않은 경우 -->
									<c:if test="${not fl}">
										<div>
											<span>${userMember.member_id}</span> <span><button
													type="submit" class="btn btn-warning btn-sm"
													id="followRequest">팔로우 신청</button></span>
										</div>
									</c:if>
								</c:if>
							</c:if>
						</form>
						<!-- 유저 프로필 중 게시물, 팔로워 수, 팔로잉 숫자를 보여주는 Div -->
						<div>
						<!-- 게시물 개수를 보여주는 Div -->
							<div class="userprofile-write row a">
								<div class="num">
									게시물<span> 0개</span>
								</div>
								<!-- 팔로워 목록을 보여주는 Div -->
								<div class="num">
									<span><a href="#myModalFollower" data-toggle="modal"
										data-target="#myModalFollower" style="color: black;"
										class="alink">팔로워 ${followed_Count}명</a></span>
								</div>
								<!-- 팔로잉 목록을 보여주는 Div -->
								<div class="num">
									<span><a href="#myModalFollowed" data-toggle="modal"
										data-target="#myModalFollowed" style="color: black;"
										class="alink">팔로잉 ${follower_Count}명</a></span>
								</div>
							</div>
						</div>
![image](https://user-images.githubusercontent.com/35492393/50626346-fc96b600-0f70-11e9-881f-2bf3d16235b5.png)

>팔로워 및 팔로우 숫자 표시
![image](https://user-images.githubusercontent.com/35492393/50626356-159f6700-0f71-11e9-8668-701502986d7b.png)

>프로필 편집 
![image](https://user-images.githubusercontent.com/35492393/50626384-3bc50700-0f71-11e9-9714-609738168e15.png)

> 지도 API 사용
>회원가입화면
![image](https://user-images.githubusercontent.com/35492393/50626432-7e86df00-0f71-11e9-8d5e-75e5ecb24344.png)

## 보완점
* 게시판 좋아요 기능 구현
* 페이스북/카카오 로그인 연동 추가

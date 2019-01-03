package js.user.controller;

import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.gson.Gson;

import ch.qos.logback.core.net.SyslogOutputStream;
import js.user.model.Follow;
import js.user.model.FollowMemberPic;
import js.user.model.FollowPic;
import js.user.model.Introduction;
import js.user.model.Member;
import js.user.service.findService;
import js.user.service.loginService;
import js.user.service.registService;

@SessionAttributes({ "Member", "LoginMember" })
@Controller
public class UserProfileController {

	// 팔로우 관련 서비스
	@Autowired
	private registService registservice;

	// 로그인 관련 서비스
	@Autowired
	private loginService loginservice;

	// 아이디 , 비밀번호 찾기
	@Autowired
	private findService findservice;

	/*
	 * @ModelAttribute("LoginMember") public Member member{
	 * 
	 * return member }
	 */
	@RequestMapping(value = "/userprofile/{userid}", method = RequestMethod.GET)
	public String userprofile(HttpSession session, @PathVariable("userid") String userid, Model model) {
		// 멤버 세션 확인
		session.getAttribute("Member");
		System.out.println("유저프로필 세션 멤버: " + session.getAttribute("Member"));
		// 만약 멤버 세션이 없다면(즉 로그인이 되지 않은 상태라면)
		if (session.getAttribute("Member") == null) {
			// 유저프로필 멤버 정보 받아오기
			Member userMember = new Member();
			userMember = loginservice.selectByUser(userid);
			System.out.println("userMember의 아이디 받아오기 : " + userMember.getMember_id());
			// 유저 프로필 멤버를 파라미터로 jsp파일과 연결(유저프로필에 아이디를 띄우기 위해서)
			model.addAttribute("userMember", userMember);
			// 유저 프로필의 팔로워 목록을 보여주는 리스트
			List<FollowPic> followerList = new ArrayList<>();
			followerList = loginservice.followerIdPic(userMember);
			model.addAttribute("followerList", followerList);	
			// 유저 프로필의 팔로잉 목록을 보여주는 리스트
			List<FollowPic> followedList = new ArrayList<>();
			followedList = loginservice.followedIdPic(userMember);			
			model.addAttribute("followedList", followedList);	
			// 유저 프로필 아이디가 가진 소개문을 불러오는 코드
			Introduction intro = new Introduction();
			intro = registservice.introSelect(userMember);
			System.out.println("로그인 전 인트로 소개문 : " + intro.getIntroduction());
			model.addAttribute("introduction", intro);
			
			List<Follow> FollowedSelect = new ArrayList<>();
			FollowedSelect = loginservice.followedSelect(userMember);
			model.addAttribute("FollowedSelect", FollowedSelect);
			
			int follower_Count;
			int followed_Count;
			try {
				follower_Count = loginservice.follower_Count(userMember);
				System.out.println("팔로잉 숫자: " + follower_Count);
				followed_Count = loginservice.followed_Count(userMember);
				System.out.println("팔로워 하는 숫자: " + followed_Count);
				model.addAttribute("follower_Count", follower_Count);
				model.addAttribute("followed_Count", followed_Count);
				} catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("follower_Count", 0);
					model.addAttribute("followed_Count", 0);
					return "/user/page/userprofile";
				}
					return "/user/page/userprofile"; 
			// 만약 멤버 세션이 있다면(즉 로그인이 된 상태라면)
		} else {
			// 유저프로필 멤버 객체 생성하여 쿼리 이용하여 정보 받아오기(parameter로 jsp에 연결)
			Member userMember = new Member();
			userMember = loginservice.selectByUser(userid);
			System.out.println("userMember의 아이디 받아오기 : " + userMember.getMember_id());
			
			Introduction intro = new Introduction();
			intro = registservice.introSelect(userMember);
			System.out.println("로그인 전 인트로 소개문 : " + intro.getIntroduction());
			model.addAttribute("introduction", intro);
			
			model.addAttribute("userMember", userMember);
			// 로그인 정보 받아오기(로그인 멤버 객체 생성 후 멤버 세션 아이디를 통하여 쿼리를 통해 받아오기)
			Member loginMember = new Member();
			loginMember = (Member) session.getAttribute("Member");
			System.out.println("loginMember 세션값 받아오나?:" + loginMember.getMember_id());
			loginMember.setMember_id(loginMember.getMember_id());
			System.out.println("loginMember의 아이디 받아오기 : " + loginMember.getMember_id());
			// 유저 프로필의 팔로워 목록을 보여주는 리스트
			List<FollowPic> followerList = new ArrayList<>();
			followerList = loginservice.followerIdPic(userMember);
			model.addAttribute("followerList", followerList);	
			// 유저 프로필의 팔로잉 목록을 보여주는 리스트
			List<FollowPic> followedList = new ArrayList<>();
			followedList = loginservice.followedIdPic(userMember);			
			model.addAttribute("followedList", followedList);	
			
			// Follow 클래스의 리스트 객체 하나 만들기
			List<Follow> list = new ArrayList<>();
			// 리스트에 로그인 멤버 클래스의 정보 담아오기
			list = loginservice.followLoginSelect(loginMember);
			// 파이날 팔로우 변수를 하나 만들어 로긴 멤버와 유저 멤버 아이디가 일치하는 팔로우 클래스를 받아오기
			Follow finalFollow = new Follow();
			// 리스트에 있는 것들을 Follow 클래스로 Iterate하여 로긴 멤버랑 유저 멤버랑 비교하기
			for (Follow follow : list) {
				// 만약 로그인 멤버가 팔로워 아이디인 팔로우 객체와 로그인 멤버의 아이디와 동일하고, followed아이디와 유저 프로필 멤버의 아이디가 같을 경우
				if (follow.getFollower_id().equals(loginMember.getMember_id())
						&& follow.getFollowed_id().equals(userMember.getMember_id())) {
					// final Follow 변수에 로긴 아이디와 유저 아이디 멤버가 일치하는 값들을 넣어준다
					finalFollow.setFollowed_id(follow.getFollowed_id());
					finalFollow.setFollower_id(follow.getFollower_id());
					finalFollow.setRelationship(follow.getRelationship());
				}
			}

			System.out.println("현재 followed_ID는 :" + finalFollow.getFollowed_id());
			System.out.println("현재 follower_ID는 :" + finalFollow.getFollower_id());
			System.out.println("현재 Relationship는 :" + finalFollow.getRelationship());
			// follow 이름으로 parameter 연결하기
			model.addAttribute("follow", finalFollow);
			// follower 및 followed 유저를 count 하는 변수 및 메서드
			int follower_Count;
			int followed_Count;
			// 팔로워 카운트와 팔로우드 카운트를 다시한번 불러와 모델 어트리뷰트를 통해 파라미터로 넘겨주어 다시 한번 갱신해준다
			// 팔로우 신청시 바로 연동되도록 하기 위해서
			try {
			follower_Count = loginservice.follower_Count(userMember);
			System.out.println("팔로잉 숫자: " + follower_Count);
			followed_Count = loginservice.followed_Count(userMember);
			System.out.println("팔로워 숫자: " + followed_Count);
			model.addAttribute("follower_Count", follower_Count);
			model.addAttribute("followed_Count", followed_Count);
			} catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("follower_Count", 0);
				model.addAttribute("followed_Count", 0);
				return "/user/page/userprofile";
			}
			// 유저 멤버 역시 다시 한번 갱신하여 바로 버튼이 바뀔 수 있도록 적용
			userMember = loginservice.selectByUser(userid);
			model.addAttribute("userMember", userMember);

			return "/user/page/userprofile";
		}
	}

	@RequestMapping(value = "/userprofile/{userid}", method = RequestMethod.POST)
	public String userprofile(@ModelAttribute("Member") Member member, @PathVariable("userid") String userid,
			Model model, HttpSession session) {

		// 로그인 아이디와 유저 프로필 아이디를 확인
		Member login = new Member();
		Member user = new Member();
		Member ss = new Member();
		
		// 유저 멤버 객체에 user 아이디 값 넣고, 세션을 통해서 가져온 객체를 로그인 멤버 객체에 넣어주기
		user = loginservice.selectByUser(userid);
		ss = (Member) session.getAttribute("Member");
		login.setMember_id(ss.getMember_id());

		System.out.println("user의 멤버 아이디 : " + user.getMember_id());
		System.out.println("login의 멤버 아이디 : " + login.getMember_id());
		
		// 로그인 아이디와 팔로워 아이디를 비교하고 유저 아이디와 팔로우드 아이디를 비교해서 같으면 삭제하면 됌.
		List<Follow> list = new ArrayList<>();
		list = loginservice.followLoginSelect(login);
		System.out.println("로그인 아이디를 통한 follow 클래스의 리스트 : " + list);
		Follow followLast = new Follow();		
		// 우선 followArray라는 객체에 로그인 멤버가 follower아이디로 있는 모든 팔로우 클래스 객체를 iterate하여 하나씩 비교해본다		
		for (Follow followArray : list) {			
			// 유저 프로필 아이디와 followArray의 followed아이디가 같고 로그인 아디이와 followArray객체의 follower 아이디가 같은 경우
			if (followArray.getFollowed_id().equals(user.getMember_id())					
					&& followArray.getFollower_id().equals(login.getMember_id())) {						
			// followLast 객체에 followed_id, follower_id, Relationship 값들을 넣어준다
			followLast.setFollowed_id(followArray.getFollowed_id());
			followLast.setFollower_id(followArray.getFollower_id());
			followLast.setRelationship(followArray.getRelationship());					
			} 
		}
		// 만약 로그인 아이디와 followLast의 follower 아이디가 같고,
		//유저 아이디와 followLast의 followed아이디와 같다는 조건이라면 팔로우 취소 기능을 발동!!
		// (두 개의 아이디가 같으면 이미 둘이 팔로우 관계가 되어있으니, 지워야 한다는 뜻이다)
		if(login.getMember_id().equals(followLast.getFollower_id())&&
				user.getMember_id().equals(followLast.getFollowed_id())) {
			// 로긴 멤버 객체를 하나 생성 및 멤버 세션 객체에서 아이디를 가져온다
			Member loginMember = new Member();
			System.out.println("팔로우 취소가 작동이 되었는가?");
			loginMember.setMember_id(member.getMember_id());
			// 스트링 값으로 로긴 멤버 아이디와 유저 프로필 아이디를 생성
			String loginMemberId = loginMember.getMember_id();
			String userMemberid = userid;

			System.out.println("loginMemberId = " + loginMemberId);
			System.out.println("userMeberId = " + userMemberid);
			// 2개의 스트링 타입을 지니는 해쉬맵에 위에서 스트링 값으로 바꾼 로긴 아이디와 유저 아이디를 
			// param1, param2로 키값을 설정해준다
			HashMap<String, String>hashMap = new HashMap<>();
			hashMap.put("param1", loginMemberId);
			hashMap.put("param2", userMemberid);

			// 팔로우 취소를 실행할 int 변수를 만든 뒤 서비스와 DAO를 연동시켜 지워주도록 하자
			int followDelete;
			followDelete = registservice.followDelete(hashMap);
			// follower 및 followed된 사람의 숫자가 들어갈 변수를 만들어 넣어주도록 한다.
			int follower_Count;
			int followed_Count;

			follower_Count = loginservice.follower_Count(user);
			System.out.println("팔로잉 숫자: " + follower_Count);
			followed_Count = loginservice.followed_Count(user);
			System.out.println("팔로워 하는 숫자: " + followed_Count);
			// 바로 페이지 변동을 시키기 위해서 다시 한번 모델 객체를 이용해 파라미터 재설정을 하여 갱신을 하도록 하자
			model.addAttribute("follower_Count", follower_Count);
			model.addAttribute("followed_Count", followed_Count);
			// 유저 프로필 멤버 또한 다시 한번 갱신 하도록 하자
			Member userMember = new Member();
			userMember = loginservice.selectByUser(userid);
			model.addAttribute("userMember", userMember);			
			
		// 만약 follower, followed 아이디와 로그인 및 유저 아이디가 일치하지 않는 경우
		// 이 둘의 팔로워 관계는 아직 설정이 되어있지 않다고 할 수 있기에 팔로우 신청을 할 수 있는 기능을 발동하도록 한다.
		} else {
					
				System.out.println("팔로우 신청이 작동이 되었는가?");
				// 유저 프로필 멤버 객체 생성 및 유저 프로필 정보 가져오기(유저아이디 세션 객체와 연동)
				Member userMember = new Member();
				userMember = loginservice.selectByUser(userid);
				// 로그인 멤버 가져오기
				Member loginMember = new Member();
				loginMember.setMember_id(member.getMember_id());

				System.out.println(loginMember.getMember_id());
				// 스트링 타입으로 로긴 아이디와 유저 아이디를 넣어주자
				String userMemberId = userMember.getMember_id();
				String loginMemberId = loginMember.getMember_id();
				// 스트링 타입의 해쉬맵을 통해서 로그인 아이디와 유저 아이디를 넣는다
				HashMap<String, String> hashMap = new HashMap<>();
				hashMap.put("param1", loginMemberId);
				hashMap.put("param2", userMemberId);

				System.out.println("follower : " + loginMemberId);
				System.out.println("followed : " + userMemberId);
				// 카운트를 할 follow int 형 변수를 넣어주도록 한다.
				int follow;
				follow = registservice.follow(hashMap);
				// followList 라는 리스트를 만들어 로그인된 멤버의 모든 객체를 배열 형태로 저장한다
				List<Follow> followList = new ArrayList<>();
				followList = loginservice.followLoginSelect(loginMember);
				Follow finalFollow = new Follow();
				// followList의 배열 형태의 객체를 하나씩 풀어내어 로그인 아이디와 유저 아이디와 비교하도록 하자
				for (Follow followArraySecond : followList) {
					// 만약 그 둘이 같다면 finalFollow라는 변수에 로그인 및 유저 아이디를 각각 follower 및 followed 아이디로 넣어준다.
					if (loginMember.getMember_id().equals(followArraySecond.getFollower_id())
							&& user.getMember_id().equals(followArraySecond.getFollowed_id())) {				
					finalFollow.setFollowed_id(followArraySecond.getFollowed_id());
					finalFollow.setFollower_id(followArraySecond.getFollower_id());
					finalFollow.setRelationship(followArraySecond.getRelationship());				
					}
				}				 
				
				// 갱신을 위해서 카운트 값을 넣은 int 형 변수를 생성 및 쿼리 실행
				int follower_Count;
				int followed_Count;

				try {
					follower_Count = loginservice.follower_Count(userMember);
					System.out.println("팔로잉 숫자: " + follower_Count);
					followed_Count = loginservice.followed_Count(userMember);
					System.out.println("팔로워 하는 숫자: " + followed_Count);
					model.addAttribute("follower_Count", follower_Count);
					model.addAttribute("followed_Count", followed_Count);
					} catch(Exception e) {
						e.printStackTrace();
						model.addAttribute("follower_Count", 0);
						model.addAttribute("followed_Count", 0);
						return "/user/page/userprofile";
					}
				
				System.out.println("두번째 finalFollow의 followed_id : " + finalFollow.getFollowed_id());
				System.out.println("두번째 finalFollow의 follower_id : " + finalFollow.getFollower_id());
				System.out.println("두번째 finalFollow의 Relationship : " + finalFollow.getRelationship());
				// 기타 페이지 연동을 위해 갱신
				model.addAttribute("follow", finalFollow);
				model.addAttribute("userMember", userMember);
				System.out.println("팔로우 모델 파라미터로 덮어졌는가? : " + finalFollow);
				
				}
				return"/user/page/userprofile";
			}
		}

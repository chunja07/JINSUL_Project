package js.user.controller;

import java.lang.ProcessBuilder.Redirect;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import ch.qos.logback.core.net.SyslogOutputStream;
import js.user.model.*;
import js.user.model.Member;
import js.user.model.memberUpdate;
import js.user.service.findService;
import js.user.service.loginService;
import js.user.service.registService;
import nl.captcha.Captcha;

@SessionAttributes({ "Member", "LoginMember", "loginMemberId" })
@Controller
public class MainPageController {

	// 팔로우 관련 서비스
	@Autowired
	private registService registservice;

	// 로그인 관련 서비스
	@Autowired
	private loginService loginservice;

	// 아이디 , 비밀번호 찾기
	@Autowired
	private findService findservice;

	// 비밀번호 찾기할 때 메일 보내기
	@Autowired
	private JavaMailSender mailSender;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
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

	}
	
	// 로그인 페이지로(GET)
	// 로그인 실패 누적을 위한 쿠키값 저장하기위해 response 사용 // 쿠키의 생성주기 // 여기서는 GET 으로 클라이언트에게 입력을
	// 받을 시 response로 쿠키와 함께 return login/login.jsp 파일로 이동 // 이러한 과정으로
	// login/login.jsp 에서 쿠키가 생성되어진다
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goLogin(HttpServletResponse response, Model model) {

		String intCookie = "0";
		// response 해줄 쿠키 생성
		Cookie cookie1 = new Cookie("cookie", intCookie);
		// return 되는순간 쿠키 보내기
		response.addCookie(cookie1);
		model.addAttribute(cookie1);

		return "/login/login";
	}

	// 아이디찾기 페이지로(GET)
	@RequestMapping(value = "/MyId", method = RequestMethod.GET)
	public String MyId() {

		return "find/myId";
	}

	// 패스워드 찾기 페이지로(GET)
	@RequestMapping(value = "/MyPassword", method = RequestMethod.GET)
	public String MyPassword() {

		
		return "find/myPassword";
	}

	// 패스워드 찾기 성공(GET)
	@RequestMapping(value = "/find/myPasswordSuc", method = RequestMethod.GET)
	public String MyPasswordSuc() {

		return "find/myPasswordSuc";
	}

	// 패스워드 찾기 실패(GET)
	@RequestMapping(value = "find/myPasswordFail", method = RequestMethod.GET)
	public String MyPasswordFail() {

		return "find/myPasswordFail";
	}

	// 로그아웃(GET)
	@RequestMapping(value = "/logout", method = RequestMethod.GET) // 적어두기만해도 redirect 시 세션값 넘어가지 않음
	public String logout(Model model, SessionStatus status, @CookieValue("cookie") String cookie,
			RedirectAttributes redirectAttributes) {

		// 세션 지운 상태
		status.setComplete();
		// 쿠키 제거방법
		// 쿠키 생명주기 0으로 준다
		// 여기서 "cookie" 는 로그인 실패 누적에서 사용한 쿠키
		Cookie cookie1 = new Cookie("cookie", null);
		cookie1.setMaxAge(0);
		return "redirect:/";

	}

	// 로그인 강화 (GET)
	@RequestMapping(value = "/loginUp", method = RequestMethod.GET)
	public String loginUp(HttpServletResponse response, HttpServletRequest request) {

		return "login/loginUp";

	}

	// 검색기능(POST)
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

	// 로그인(POST)
	@RequestMapping(value = "/login", method = RequestMethod.POST) // 쿠키를 보내기위한 response 추가
	// 변경된 쿠키값을 저장하기위해서는 기존에 Session 설정하는 방법
	// model.addAttribute("",~) 와는 다르게
	// Cookie ~ = new Cookie("",~) 형태로 해줘야한다
	// session 과 마찬가지로 key 값은 같게
	public String login(HttpServletResponse response, Member member, Model model,
			@CookieValue(value = "cookie") String cookieValue, HttpSession session, HttpServletRequest request, RedirectAttributes variable) {
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
		}
		// 로그인 실패 횟수를 누적하기 위한 코드 (model.addAttribute("cookie",cookieValue) 까지)
		// 위와 동일
		int loginCount = Integer.parseInt(cookieValue);
		loginCount++;
		cookieValue = Integer.toString((loginCount));
		System.out.println("cookieValue : " + cookieValue);
		Cookie cookie1 = new Cookie("cookie", cookieValue);
		response.addCookie(cookie1);
		model.addAttribute("cookie", cookieValue);
		if (loginCount >= 5) {
			// loginUp.jsp 에 로그인 5회 입력 실패 입력되도록 model 에 저장 후 loginUp.jsp 파일에 c:if 문으로 출력
			model.addAttribute("loginUp", true);

			return "login/loginUp";

		}
		// 아이디와 비밀번호중 하나 틀릴경우
		model.addAttribute("pwNotM", true);
		return "login/login";

	}

	// 로그인 강화 (POST)(자동입력방지문자 사용)
	@RequestMapping(value = "/loginUp", method = RequestMethod.POST) // 자동입력방지문자 입력값 저장되는 곳
	public String loginUp(Member member, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "answer") String answer, HttpSession session) {
		// 자동입력방지문자 // js.user.model.CaptCha 에서 setAttribute 해준 NAME //
		// NAME =="simpleCaptcha";
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);

		// 입력한 문자와 출력된 문자가 일치
		if (captcha.isCorrect(answer)) {
			System.out.println("문자 일치 완료?");
			try {
				
				// 아이디,비밀번호,이메일 일치하는 회원정보가 있는지 확인
				Member member1 = loginservice.loginUp(member);
				if (member1.getMember_id() != null) {
					// 세션에 저장하기위한 attribute
					model.addAttribute("Member", member1);
					System.out.println("로그인 되니?");
					return "redirect:/";
				}
			} catch (Exception e) {
				// 로그인 실패 시
				model.addAttribute("loginF", true);
				return "login/loginUp";

			}

		} else {
			// 입력한 문자와 출력된 문자가 불일치
			model.addAttribute("loginF", true);
			return "login/loginUp";
		}

		return null;

	}

	// 아이디 찾기(POST)
	@ResponseBody
	@RequestMapping(value = "/findMyId/{member_email}/{member_phone}", method = RequestMethod.POST)
	public String MyId1(Member member) {

		String msg;
		// 전화번호와 이메일로 아이디 찾는 서비스
		Member member1 = findservice.findMyId(member);

		// findservice 해서 해당되는 정보 찾지 못한 경우
		if (member1.getMember_phone() == null) {
			msg = "해당되는 아이디가 없습니다.";
		} else {
			msg = member1.getMember_id();
		}

		return "{\"msg\" : \"" + msg + "\"}";

	}

	// 패스워드 찾기 첫번째(버튼눌러 이메일 전송)(form 에서 입력한 아이디와 이메일이 일치하는 정보가 있는지 DB 에서 확인 후 있으면 메일
	// 보내도록 설정)(POST)
	@ResponseBody
	@RequestMapping(value = "/findMyPw/{member_id}/{email}/{title}/{content}", method = RequestMethod.POST)
	public String MyId(@PathVariable("member_id") String member_id, @PathVariable("email") String toemail,
			@PathVariable("title") String title, @PathVariable("content") String content) {
		// 異뷀썑�뿉 愿�由ъ옄 硫붿씪濡� 蹂�寃�
		String setfrom = "zxcasdqwe155555@gmail.com";

		Member member = new Member();
		member.setMember_id(member_id);
		member.setMember_email(toemail);
		// form �뿉�꽌 �엯�젰諛쏆� �븘�씠�뵒�� 硫붿씪�씠 �씪移섑븯�뒗 �쑀��媛� �엳�뒗吏� 寃��깋�빐�꽌 �엳�떎硫� sendmail �릺�룄濡�
		Member member1 = findservice.findMyPw(member);
		String msg = null;
		try {
			// form �뿉�꽌 �엯�젰諛쏆� �븘�씠�뵒�� 硫붿씪�씠 �씪移섑븯�뒗 �쑀��媛� �엳�뒗寃쎌슦 硫붿씪蹂대궡湲�
			if (member1.getMember_id() != null) {

				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(setfrom); // 蹂대궡�뒗�궗�엺 �깮�왂�븯嫄곕굹 �븯硫� �젙�긽�옉�룞�쓣 �븞�븿
				messageHelper.setTo(toemail); // 諛쏅뒗�궗�엺 �씠硫붿씪
				messageHelper.setSubject(title); // 硫붿씪�젣紐⑹� �깮�왂�씠 媛��뒫�븯�떎
				messageHelper.setText(content); // 硫붿씪 �궡�슜

				mailSender.send(message);
				msg = "�쟾�넚�셿猷�";

			}
		} catch (Exception e) {
			// form �뿉�꽌 �엯�젰諛쏆� �븘�씠�뵒�� 硫붿씪�씠 �씪移섑븯�뒗 �쑀��媛� �뾾�뒗寃쎌슦
			msg = "�쟾�넚�떎�뙣";
			System.out.println(e);
		}

		return "{\"msg\" : \"" + msg + "\"}";
	}

	// 패스워드 찾기 두번째 ( 인증이 완료되면 새로운 비밀번호 설정)(POST)
	@RequestMapping(value = "/newPassword", method = RequestMethod.POST)
																		// 적어두기만해도 redirect 시 세션값 넘어가지 않음
	public String newPassword(memberUpdate memberUpdate, Model model, RedirectAttributes redirectAttributes) {

		
		
		Member member = new Member();
		member.setMember_id(memberUpdate.getMember_id());
		member.setMember_email(memberUpdate.getMember_email());
		
			// 재차확인 (이메일 전송 후 아이디 수정하는 경우가 있을 수 있으므로)
			Member member1 = findservice.findMyPw(member);
			// form 에서 입력받은 아이디와 메일이 일치하는 유저가 있는경우 메일보내기
			if (member1 != null) {
				// 패스워드 수정 날짜 설정
				Date date = new Date();
				SimpleDateFormat smdf = new SimpleDateFormat("yyyy/MM/dd/hh/mm/ss");
				String member_updatePassword_date = smdf.format(date);
				memberUpdate.setMember_updatePassword_date(member_updatePassword_date);
				// 새로운 비밀번호 설정
				findservice.newPassword(memberUpdate);
				return "redirect:/find/myPasswordSuc";

			}
		
		// form 에서 입력받은 아이디와 메일이 일치하는 유저가 없는경우 ( 메일만 전송하고 아이디를 바꿔 새로운 비밀번호 수정하려 하는 경우 )
		model.addAttribute("IdEmailNotMatch", true);
		return "/find/myPassword";

	}
}
package js.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import js.user.model.FileImage;
import js.user.model.Member;
import js.user.model.memberUpdate;
import js.user.service.loginService;
import js.user.service.updateService;

@SessionAttributes({ "Member", "checkPw" })
@Controller
public class updateController {

	@Autowired
	private updateService service;
	@Autowired
	private loginService loginservice;

	// 파일 업로드 전역변수
	private String ProfileAbsolutePath;
	
	
	// POST 방식은 모두 redirect 처리해주었다(ajax 제외 // 페이지전환 하지않으므로)
	
	
	
	

	// 개인정보 수정하기전 사용자의 비밀번호 확인 .jsp 로(GET)
	@RequestMapping(value = "/checkPw", method = RequestMethod.GET)
	public String checkPw() {
		return "/update/checkPw";
	}

	// 정보 수정 페이지로(GET)
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {

		return "/update/update";
	}

	// 패스워드 변경Form 으로 보내기(GET)
	@RequestMapping(value = "/update/password", method = RequestMethod.GET)
	public String updatePw() {
		
		return "/update/pwChange";
	}
	
	// 패스워드 변경 성공(GET)
	@RequestMapping(value = "/update/pwChangeSuc", method = RequestMethod.GET)
	public String updatePwSuc() {

		return "/update/pwChangeSuc";
	}

	// 개인정보 수정 Form 으로 보내기(GET)
	@RequestMapping(value = "update/privacyModify", method = RequestMethod.GET)
	public String privacyModify() {

		return "/update/privacyModify";
	}

	// 연락처수정 (GET)
	@RequestMapping(value = "/update/phoneNum", method = RequestMethod.GET)
	public String phoneNum1() {
		return "/update/privacyModify";
	}

	// 이메일 수정(GET)
	@RequestMapping(value = "/update/email", method = RequestMethod.GET)
	public String email1() {
		return "/update/privacyModify";
	}

	// 주소 수정(GET)
	@RequestMapping(value = "/update/address", method = RequestMethod.GET)
	public String address1() {
		return "/update/privacyModify";
	}

	// 프로필 수정(GET)
	@RequestMapping(value = "/update/profile", method = RequestMethod.GET)
	public String profile1() {
		return "/update/privacyModify";
	}

	// 수정 실패(GET)
	@RequestMapping(value = "/update/updateFail", method = RequestMethod.GET)
	public String updateFail() {
		return "/update/updateFail";
	}

	// 회원탈퇴Form 으로 보내기(GET)
	@RequestMapping(value = "/update/deleteMember", method = RequestMethod.GET)
	public String deleteMember() {

		return "/update/deleteMember";
	}

	// 개인정보 수정하기전 사용자의 비밀번호 확인(POST)
	@RequestMapping(value = "/checkPw", method = RequestMethod.POST)
	public String checkPw(Member member, Model model, @ModelAttribute("Member") Member sessionMember,
			// 적어두기만해도 redirect 시 세션값 넘어가지 않음
			RedirectAttributes redirectAttributes) {
		// 세션 멤버의 비밀번호와 input 필드에 적은 비밀번호가 일치하면 SessionAttributes("checkPw") 의 flag 값을
		// true
		Member member1 = loginservice.selectById(sessionMember);
		if (member.getMember_password().equals(member1.getMember_password())) {
			// 필터에서 사용할 세션들
			model.addAttribute("checkPw", true);
			model.addAttribute("Member", sessionMember);
			return "redirect:/update";
		}
		// 비밀번호가 일치하지 않을 시 해당 .jsp 에서 비밀번호가 일치하지 않습니다 구문 띄워줌
		model.addAttribute("passwordF", true);
		return "redirect:/checkPw";

	}

	// 패스워드 수정(POST)
	@RequestMapping(value = "/update/password", method = RequestMethod.POST)
	// Session 에 저장되어있는 Member 불러오기 // 비밀번호 변경을위해 새로만든 Model
	public String updatePw(Model model, memberUpdate memberupdate, @ModelAttribute("Member") Member sessionMember,
			// 적어두기만해도 redirect 시 세션값 넘어가지 않음
			RedirectAttributes redirectAttributes) {
		model.addAttribute("notMatch", false);
		Member member1 = new Member();
		try {
			// memberupdate 에 session Member 에 member_id 추가 xml에서 where 절 2개 member_id
			// ,current_member_password 사용해야한다
			memberupdate.setMember_id(sessionMember.getMember_id());
			// 패스워드 수정 날짜
			Date date = new Date();
			SimpleDateFormat sdfm = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss");
			String member_updatePassword_date = sdfm.format(date);
			memberupdate.setMember_updatePassword_date(member_updatePassword_date);

			// input 에서 입력한 현재 비밀번호와 로그인된 사용자의 비밀번호가 일치하면 member1 객체로 정보가 담긴다
			member1 = service.selectByPw(memberupdate);
			// selectByPw 가 잘 된경우
			if (member1.getMember_id() != null) {
				int count = service.updatePassword(memberupdate);
				// updatePassword 가 실패한 경우
				if (count == 0) {

					return "redirect:/update/privacyModify";
				}
				// updatePassword 가 성공한 경우
				// SessionAttributes("Member") 의 member_password를 new_member_password로 바꿔준다 (변경된
				// 내용의 세션이 바로 적용되도록(기존에 있던 자료("Member")에 덮어쓰기)))
				sessionMember.setMember_password(memberupdate.getNew_member_password());
				// 최근 수정일 sessionMember 에 추가
				sessionMember.setMember_updatePassword_date(member_updatePassword_date);
				model.addAttribute("Member", sessionMember);
				return "redirect:/update/pwChangeSuc";

			}
		} catch (Exception e) {
			// selectByPw 가 실패한 경우
			model.addAttribute("notMatch", true);
			return null;
		}
		return null;

	}

	// 연락처 수정 (POST)
	@RequestMapping(value = "/update/phoneNum", method = RequestMethod.POST)
	public String phoneNum(Model model, Member member, @ModelAttribute("Member") Member sessionMember,
			// 적어두기만해도 redirect 시 세션값 넘어가지 않음
			RedirectAttributes redirectAttributes) {

		// member_phone input 을 3칸으로 쪼개 자동으로 , 들어가 ,를 -로 바꿔주는 작업
		String member_phoneNum = member.getMember_phone().replace(",", "-");
		member.setMember_phone(member_phoneNum);
		System.out.println(member_phoneNum);

		// 연락처 수정 날짜
		Date date = new Date();
		SimpleDateFormat smdf = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss");
		String member_updatePhoneNum_date = smdf.format(date);
		member.setMember_updatePhoneNum_date(member_updatePhoneNum_date);

		// 현재 로그인한 유저의 아이디 set 해주기 update 시 where member_id=? 에 사용
		member.setMember_id(sessionMember.getMember_id());
		int count = service.updatePhoneNum(member);

		if (count == 1) {

			// SessionAttributes("Member") 의 member_phone 을 input에서 받아온 member_phone(새로운
			// 연락처)로 변경 (변경된 내용의 세션이 바로 적용되도록(기존에 있던 자료("Member")에 덮어쓰기))
			sessionMember.setMember_phone(member.getMember_phone());
			// 최근 수정일 sessionMember 에 추가
			sessionMember.setMember_updatePhoneNum_date(member_updatePhoneNum_date);
			model.addAttribute("Member", sessionMember);

			return "redirect:/update/privacyModify";
		}
		return "redirect:/update/updateFail";

	}

	// 이메일 수정(POST)
	@RequestMapping(value = "/update/email", method = RequestMethod.POST)
	// input에서 받아올때 email 입력칸이 3개 // 각각 따로 받아오는작업
	public String email(Model model, @RequestParam("member_email0") String member_email0,
			@RequestParam("member_email1") String member_email1, @RequestParam("member_email2") String member_email2,
															// 적어두기만해도 redirect 시 세션값 넘어가지 않음
			@ModelAttribute("Member") Member sessionMember, RedirectAttributes redirectAttributes) {

		Member member = new Member();
		// email input 할때 3칸으로 나눠가져와 합쳐주는 작업
		String email = member_email0 + "@" + member_email1 + member_email2;

		// 이메일 수정 날짜
		Date date = new Date();
		SimpleDateFormat smdf = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss");
		String member_updateEmail_date = smdf.format(date);
		member.setMember_updateEmail_date(member_updateEmail_date);

		// 현재 로그인한 유저의 아이디 set 해주기 update 시 where member_id=? 에 사용
		member.setMember_id(sessionMember.getMember_id());
		member.setMember_email(email);
		int count = service.updateEmail(member);

		if (count == 1) {
			// SessionAttributes("Member") 의 email 이 수정된 email 로 변경되도록 (변경된 내용의 세션이 바로
			// 적용되도록(기존에 있던 자료("Member")에 덮어쓰기))
			sessionMember.setMember_email(email);
			// 최근 수정일 sessionMember 에 추가
			sessionMember.setMember_updateEmail_date(member_updateEmail_date);
			model.addAttribute("Member", sessionMember);
			return "redirect:/update/privacyModify";
		}
		return "redirect:/update/updateFail";

	}

	// 주소 수정(POST)
	@RequestMapping(value = "/update/address", method = RequestMethod.POST)
	public String address(Model model, Member member, @ModelAttribute("Member") Member sessionMember,
			// 적어두기만해도 redirect 시 세션값 넘어가지 않음
			RedirectAttributes redirectAttributes) {

		// 현재 로그인한 유저의 아이디 set 해주기 update 시 where member_id=? 에 사용
		member.setMember_id(sessionMember.getMember_id());

		// 주소 수정 날짜
		Date date = new Date();
		SimpleDateFormat smdf = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss");
		String member_updateAddress_date = smdf.format(date);
		member.setMember_updateAddress_date(member_updateAddress_date);

		int count = service.updateAddress(member);

		if (count == 1) {
			// SessionAttributes("Member") 의 기존 주소들이 새로운 주소로 변경되도록 (변경된 내용의 세션이 바로 적용되도록(기존에
			// 있던 자료("Member")에 덮어쓰기))
			sessionMember.setMember_Zip_code(member.getMember_Zip_code());
			sessionMember.setMember_Street_name_address(member.getMember_Street_name_address());
			sessionMember.setMember_Detailed_Address(member.getMember_Detailed_Address());
			// 최근 수정일 sessionMember 에 추가
			sessionMember.setMember_updateAddress_date(member_updateAddress_date);

			model.addAttribute("Member", sessionMember);
			return "redirect:/update/privacyModify";
		}
		return "redirect:/update/updateFail";

	}

	// 프로필 수정(POST)
	@RequestMapping(value = "/update/profile", method = RequestMethod.POST)
	public String profile(Model model, Member member, @RequestParam("file") MultipartFile multipartFile,
			@ModelAttribute("Member") Member sessionMember, HttpServletRequest request,
			// 적어두기만해도 redirect 시 세션값 넘어가지 않음
			RedirectAttributes redirectAttributes) {

		// 파일 이미지 새로 업로드
		FileImage fileImage = new FileImage();
		fileImage.setFile(multipartFile);

		// 이미지 파일에 난수 처리 ( 서로 다른이미지인데 이름이 같을경우 대비하기위해 )
		// 파일은 substring 이라는 메소드가 존재하지않아 String 으로 변환 후 substring 사용
		String StringMultiFile = multipartFile.getOriginalFilename();
		// 난수 생성하기위한 Random
		Random random = new Random();

		// multipartFile.getOriginalFilename() 이 있을때 작동하도록 if문 (앞에 ! 붙어있음) // 이미지 첨부
		// 하지않을 시 substring 에서 오류발생하므로
		if (!StringMultiFile.equals("")) {
			// 데이터베이스에 파일 저장할때는 /WEB-INF/ 경로 빼고 저장 // ${} 표현식으로 바로 불러오게 하기위해서
			// 데이터베이스에 저장될 이미지파일 경로 // 현재 컨테이너경로(/JS/)불러오기 // WEB-INF접근을 위한 mvc:resource
			// 설정해준 /member/update/image/ // 파일 고유의 이름만 출력하기위한 substring (확장자만 제거) // 랜덤값 //
			// 뒤에 .jpg,.png ... (확장자) 만 선택하기 위한 코드 // substring과 indexOf 찾아보기
			ProfileAbsolutePath = request.getContextPath() + "/member/update/image/"
					+ StringMultiFile.substring(0, multipartFile.getOriginalFilename().indexOf(".")) + "_"
					+ random.nextLong() + StringMultiFile.substring(multipartFile.getOriginalFilename().indexOf("."));
			member.setMember_profile_pic(ProfileAbsolutePath);
		}

		// 현재 로그인한 유저의 아이디 set 해주기 update 시 where member_id=? 에 사용
		member.setMember_id(sessionMember.getMember_id());

		// 주소 수정 날짜
		Date date = new Date();
		SimpleDateFormat smdf = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss");
		String member_updateProfile_date = smdf.format(date);
		member.setMember_updateProfile_date(member_updateProfile_date);

		int count = service.updateProfile(member);

		if (count == 1) {

			// 파일을 /WEB-INF/member/update/image/
			String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/member/update/image/");

			// 정보수정 시 이미지 첨부 하지않을때도 있다 // fileName 이 null 일 경우 오류 발생하므로 != null 로 해준다 (이미지
			// 첨부가 있을때만 saveFile 되도록)
			if (member.getMember_profile_pic() != null) {

				// saveFile 할 때 이미지 명 다시설정 // 현재 fileName 은 /JS/image/...jpg 형태로 출력 // 이 값으로
				// image 폴더에 파일저장 안되므로 substring 으로 앞에 /JS/member/update/image/ 까지 짤라주고 뒤에
				// ~.jpg만 남도록 해주는 코드
				// 쉽게말해 저장될 파일 명
				String fileName = ProfileAbsolutePath.substring(24);
				service.saveFile(fileImage, realPath, fileName);

			}
			// SessionAttributes("Member") 에 기존에 저장되어있는 member_profile_pic 을 수정한
			// member_profile_pic 으로 변경 (변경된 내용의 세션이 바로 적용되도록(기존에 있던 자료("Member")에 덮어쓰기))
			sessionMember.setMember_profile_pic(member.getMember_profile_pic());
			// 최근 수정일 sessionMember 에 추가
			sessionMember.setMember_updateProfile_date(member_updateProfile_date);
			model.addAttribute("Member", sessionMember);
			return "redirect:/update/privacyModify";
		}

		return "redirect:/update/updateFail";

	}

	// 회원 탈퇴(POST) (보류중// 데이터베이스에 reference 된 키가 많아 바로 삭제 못함 // 마지막에 처리)
	@RequestMapping(value = "/update/deleteMember", method = RequestMethod.POST)
	// 세션에 저장되어있는 멤버의 아이디값으로 비밀번호 검색해 일치하면 삭제
	public String deleteM(Member member1, @ModelAttribute("Member") Member member, Model model,
			 // 적어두기만해도 redirect 시 세션값 넘어가지 않음
			RedirectAttributes redirectAttributes) {
		// input에 입력한 패스워드와 DB에 있는 패스워드 일치하는 경우
		if (member1.getMember_password() == member.getMember_password()) {
			int count = service.deleteMember(member);

			return "/update/deleteSuc";
		}

		// 패스워드가 일치하지 않는경우
		model.addAttribute("pwNotEq", true);
		return "/update/deleteM";
	}

	/*
	 * @ResponseBody // ajax 패스워드 체크문 (updateForm 에서 직접 스크립트문으로 처리)
	 * 
	 * @RequestMapping(value=
	 * "/updatePwChk/{current_member_password}/{member_password_chk}",
	 * method=RequestMethod.POST) public String
	 * updatePwChk(@PathVariable("current_member_password") String
	 * member_password, @PathVariable("member_password_chk") String
	 * member_password_chk,@ModelAttribute("Member") Member member1) {
	 * 
	 * String check;
	 * if(member_password.equals(member_password_chk)&&member_password_chk != null
	 * && member_password!= null) { check = "일치"; }else { check = "불일치"; }
	 * System.out.println(member_password); System.out.println(member_password_chk);
	 * System.out.println(check);
	 * 
	 * return "{\"msg\" : \""+check+"\"}"; }
	 */
}

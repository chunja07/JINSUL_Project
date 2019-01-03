package js.user.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.spi.RegisterableService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import js.user.model.FileImage;
import js.user.model.Member;
import js.user.service.registService;


// 회원가입 컨트롤러
@Controller
public class registController {

	@Autowired
	private registService registservice;
	
	private String ProfileAbsolutePath ;
 
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	public String goRegist(HttpSession session) {
		// 로그인 한 상태에서 회원가입 경로 입력 시 현재 로그인한 session 은 지워지도록
		session.removeAttribute("Member");
		return "regist/registForm";
	}
	// Member member >> input 에서 받아온 정보들
	// Member isMember >> 회원아이디 중복되는지 확인하기위한 객체
	@RequestMapping(value="/regist" ,method=RequestMethod.POST)
						// 커맨드 객체 // input id 와 Member 멤버필드 동일하면 자동으로 setter						업로드할 파일	@RequestParam으로 값을 가져와 MultipartFile 형태로 저장
	public String regist(Member member,@RequestParam("file")MultipartFile multipartFile,Model model,HttpServletRequest request, @RequestParam("member_email0") String member_email0 ,@RequestParam("member_email1") String member_email1 ,@RequestParam("member_email2") String member_email2)  throws IOException {
		
		FileImage fileimage = new FileImage();
		// FileImage 에 setFile (현재 FileImage 모델의 멤버필드는  
		fileimage.setFile(multipartFile);
		model.addAttribute("registF",false);
		
		// form 에서 이메일 서로다른 input name 3개로 가져와 합쳐주는 작업 // input 3개를 같은 name 으로 설정 시 값을 불러올때,가 붙는다 // ex전화번호)) 010,1231,1231
		String email = member_email0+"@"+member_email1+member_email2;
		
		/*
		// 비밀번호 불일치
		if(!chkPw.equals(member.getMember_password())) {
			model.addAttribute("pwMiss",true);
			return "regist/registForm";
		}
		jquery 이용해 처리완료
		*/
		
		// trip_exp= 0 (등급) , 가입날짜 , member_type=1(어드민),0(일반 사용자) 설정
		// member_phone input 을 3칸으로 쪼개 자동으로 , 들어가 ,를 -로 바꿔주는 작업
		String member_phoneNum = member.getMember_phone().replace(",","-" );
		
		
		
		member.setMember_phone(member_phoneNum);
		member.setMember_email(email);
		
		// 이미지 파일에 난수 처리 ( 서로 다른이미지인데 이름이 같을경우 대비하기위해 )
		// 파일은 substring 이라는 메소드가 존재하지않아 String 으로 변환 후 substring 사용
		String StringMultiFile = multipartFile.getOriginalFilename();
		
		// 난수 생성하기위한 Random
		Random random = new Random();

		// multipartFile.getOriginalFilename() 이 있을때 작동하도록 if문 (앞에 ! 붙어있음) // 이미지 첨부 하지않을 시 substring 에서 오류발생하므로
		if(!StringMultiFile.equals("")) {
		// 데이터베이스에 파일 저장할때는 /WEB-INF/ 경로 빼고 저장 // ${} 표현식으로 바로 불러오게 하기위해서
	// 파일 데이터베이스에 저장하기위한 코드  // 현재 컨테이너경로(/JS/)불러오기	// WEB-INF접근을 위한 mvc:resource 설정해준 /image/   // 파일 고유의 이름만 출력하기위한 substring (확장자만 제거) // 랜덤값 		// 뒤에 .jpg,.png ... (확장자) 만 선택하기 위한 코드 // substring과 indexOf 찾아보기
		ProfileAbsolutePath = request.getContextPath()+"/image/"+StringMultiFile.substring(0, multipartFile.getOriginalFilename().indexOf("."))+"_"+random.nextLong()+StringMultiFile.substring(multipartFile.getOriginalFilename().indexOf("."));				
		member.setMember_profile_pic(ProfileAbsolutePath);
		}

		// 가입날짜 설정
		Date date = new Date();
		SimpleDateFormat smdf = new SimpleDateFormat("yyyy/MM/dd/hh/mm/ss");
		String register_date = smdf.format(date);
		member.setMember_register_date(register_date);
		
		
		int check = registservice.insertM(member);
		int checkInt = registservice.insertMemberInt(member);
		
		if(check == 1 || checkInt == 1) {
			// 파일 WEB-INF/image 에 저장
			String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/image/");
			
			// 회원가입 시 이미지 첨부 하지않을때도 있다 // fileName 이 null 일 경우 오류 발생하므로 != null 로 해준다 (이미지 첨부가 있을때만 saveFile 되도록)
			if(member.getMember_profile_pic()!=null) {
			// saveFile 할 때 이미지 명 다시설정 // 현재 fileName 은 /JS/image/...jpg 형태로 출력 // 이 값으로 image 폴더에 파일저장 안되므로 substring 으로 앞에 /JS/image/ 까지 짤라주고 뒤에 ~.jpg만 남도록 해주는 코드
			// 쉽게말해 저장될 파일 명
			String fileName = ProfileAbsolutePath.substring(10);
			registservice.saveFile(fileimage,realPath,fileName);
			}
			
			
			//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ txt 파일 형태로 writer 해주는 작업 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
			// 파일 입력을 위한 경로설정
			File f = new File("C:\\dev\\java_EE\\sources\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\JS\\WEB-INF\\file");
			if(!f.exists()) {
				f.mkdirs();
			}
			// 파일에 입력하기위한 것 //  회원가입 정상적으로 되었을경우 WEB-INF/file 안에 회원 아이디로 txt 파일 자동생성
			BufferedWriter bos = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("C:\\dev\\java_EE\\sources\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\JS\\WEB-INF\\file\\"+member.getMember_id()+".txt")));
													// \r\n 은 자동 줄바꿈 (한칸 줄바꿈)
			bos.write("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ회원정보ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ\r\n");
			bos.write("회원 아이디 : "+member.getMember_id()+"\r\n");
			bos.write("회원 패스워드 : "+member.getMember_password()+"\r\n");
			bos.write("회원 이름 : "+member.getMember_name()+"\r\n");
			bos.write("회원 생일 : "+member.getMember_birthday()+"\r\n");
			bos.write("회원 성별 : "+member.getMember_gender()+"\r\n");
			bos.write("회원 연락처 : "+member.getMember_phone()+"\r\n");
			bos.write("회원 등급 : "+Integer.toString(member.getMember_trip_exp())+"\r\n");
			bos.write("회원 등록 날짜 : "+member.getMember_register_date()+"\r\n");
			bos.write("회원 프로필 사진 : "+member.getMember_profile_pic()+"\r\n");
			bos.write("회원 이메일 : "+member.getMember_email()+"\r\n");
			bos.write("회원 우편번호 : "+member.getMember_Zip_code()+"\r\n");
			bos.write("회원 도로명 : "+member.getMember_Street_name_address()+"\r\n");
			bos.write("회원 상세주소 : "+member.getMember_Detailed_Address()+"\r\n");
			bos.write("회원 멤버타입 : "+Integer.toString(member.getMember_type())+"\r\n");
			bos.write("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
			bos.flush();
			bos.close();
			return "redirect:/";	
		}
		
		// 동일한 아이디(primary 키)가 있어 회원가입이 실패한 경우 (int check == 0)
		model.addAttribute("registF",true);
		return "regist/registForm";
		
	}
	
	// ajax 사용 // 
	@ResponseBody				// url 로 jsp 에서 input에 입력한 member_id 가져온다
	@RequestMapping(value="/idChk/{member_id}", method=RequestMethod.POST)
	public String loginChk(@PathVariable("member_id") String id ) {
		Gson gson = new Gson();
		Member member = new Member();
		
		
		// 새로운 member 객체에 id 저장
		member.setMember_id(id);
		
		
		// 이러한 아이디가 있는지 검색하고 member1 객체에 저장
		Member member1=registservice.selectById(member);
			
		String check;
		
		
		// 없다면
		if(member1==null) {
			check = "사용 가능한 아이디입니다";
		}else {
			
			check = "이미 사용중인 아이디입니다";
		}
		
		// gson 사용해 json 형식으로 바꾼후 return 키값:value 형태아니라 단순히 문자를 출력하고 싶은경우
		// String json = gson.toJson(check);
		// return json;
		
		// 직접 return문에 json 형식으로 선언
		return "{\"value\" : \""+check+"\"}";
				
	}
	
	
}


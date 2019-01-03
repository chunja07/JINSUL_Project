package js.user.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
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

import js.user.model.FileImage;
import js.user.model.Member;
import js.user.model.Message;
import js.user.service.loginService;
import js.user.service.messageService;

@SessionAttributes("Member")
@Controller
public class messageController {

	@Autowired
	private messageService service;
	@Autowired
	private loginService loginservice;

	private String PictureAbsolutePath;

	private String PathsStoredInTheDatabase = "";

	// /message 입력 시 message 로 이동
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String messageSend1() {
		return "message/message";

	}

	// 메시지 form 으로 이동
	@RequestMapping(value = "/message/send", method = RequestMethod.GET)
	public String messageSend1(@ModelAttribute("Member") Member member, Model model) {

		return "message/messageSend";

	}

	// 메시지 작성
	@RequestMapping(value = "/message/send", method = RequestMethod.POST)
	public String messageSend2(Message message, Model model, @ModelAttribute("Member") Member member,
			@RequestParam("file") ArrayList<MultipartFile> multipartFile, HttpServletRequest request) {

		// 파일 여러개 첨부 시 한 테이블 컬럼안에 다 적어줘야 하기때문에 데이터베이스에 저장될 파일 경로를 ArrayList 안에 모두 넣기위해
		// .add 사용할 예정
		ArrayList<String> fileList = new ArrayList<>();

		// 파일 여러개 첨부 시 폴더에 저장하기위한 ArrayList
		ArrayList<String> folderList = new ArrayList<>();

		// 첨부파일이 여러개일경우를 대비해 파일 경로를 데이터베이스에 저장하기위한 변형된 for문
		for (MultipartFile mf : multipartFile) {
			FileImage fileimage = new FileImage();
			fileimage.setFile(mf);
			// 주소값으로 불러올 이미지 경로
			System.out.println("주소값으로 불러올 이미지 경로 (WEB-INF mapper 처리):" + request.getContextPath() + "/image/"
					+ mf.getOriginalFilename());

			// 기존의 회원 프로필 저장되어있는 WEB-INF/image 에 저장할 경우 뒤죽박죽 // 새로운 폴더만들어
			// WEB-INF/message/image // 파일 저장을 위한 변수 // C:~
			String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/message/image");
			System.out.println("실제 데이터베이스에 저장되는 절대경로: " + realPath);

			// substring 해주기위해 multipartFile.getOriginalFilename(); // String 형태가 아니면
			// substring 사용불가
			String StringMultiFile = mf.getOriginalFilename();
			Random random = new Random();

			// multipartFile.getOriginalFilename() 이 있을때 작동하도록 if문 // 이미지 첨부 하지않을 시
			// substring 에서 오류발생하므로
			if (!StringMultiFile.equals("")) {
				// 파일 데이터베이스에 저장하기위한 절대경로 // 절대경로 가져오기 // WEB-INF 접근위한 mvc:resource해준
				// /message/image/ // 파일 고유의 이름만 출력하기위한 substring (확장자만 제거) // 랜덤값 // 뒤에
				// .jpg,.png ... (확장자) 만 선택하기 위한 코드 // substring과 indexOf 찾아보기
				PictureAbsolutePath = request.getContextPath() + "/message/image/"
						+ StringMultiFile.substring(0, mf.getOriginalFilename().indexOf(".")) + "_" + random.nextLong()
						+ StringMultiFile.substring(mf.getOriginalFilename().indexOf("."));
				folderList.add(PictureAbsolutePath);
				fileList.add(PictureAbsolutePath);
			}

		}
		for (int i = 0; i < fileList.size(); i++) {

			PathsStoredInTheDatabase += fileList.get(i);

			// 파일 여러개일때 구분해주기위함 abc.jpg|def.jpg... 이러한 형태
			// 기본적으로 파일 이름 설정 시에  \ / : * ? " < > | 는 들어갈 수없으므로 다음값들중 하나를 사용해 구별 
			PathsStoredInTheDatabase += "|";
		}

		// db에 저장되는 경로
		System.out.println("PathsStoredInTheDatabase:" + PathsStoredInTheDatabase);

		message.setMessage_picture(PathsStoredInTheDatabase);
		// message 의 Message_send_date 해주기위한 코드
		Date date = new Date();
		SimpleDateFormat spdf = new SimpleDateFormat("yyyy/MM/dd/hh/mm/ss");
		String datetime = spdf.format(date);

		// post 에서 입력 안된것들 set 해주기 ( 보낸사람의 프로필 사진 , 보낸 날짜 , 보낸사람의 아이디)
		message.setMessage_profil_pic(member.getMember_profile_pic());
		message.setMessage_send_date(datetime);
		message.setMember_id(member.getMember_id());

		// 받는사람의 회원정보가 등록되어있는지 확인하기위해 messageSendForm에서 입력한 member_receiver(받는이) 를 set
		Member member1 = new Member();
		member1.setMember_id(message.getMember_receiver());

		int count1 = 0;
		int count2 = 0;
		try {
			// 받는 이의 정보가 DB에 등록되어있다면 member2 객체에 저장
			Member member2 = loginservice.selectById(member1);
			// 해당되는 회원정보가 있다면
			if (member2.getMember_id() != null) {
				// 보낸 메시지 테이블과 받은 메시지 테이블에 각각 insert
				count1 = service.messageSend(message);
				count2 = service.messageReceive(message);
				// 메시지 보내기 성공
				if (count1 == 1 && count2 == 1) {

					// 메시지 보낼때 이미지 첨부 하지않을때도 있다 // fileName 이 null 일 경우 오류 발생하므로 != null 로 해준다 (이미지
					// 첨부가 있을때만 saveFile 되도록)
					if (message.getMessage_picture() != null) {

						// 파일의 갯수만큼 반복돌리는 작업
						int i = 0;

						for (MultipartFile mf : multipartFile) {
							FileImage fileimage = new FileImage();
							fileimage.setFile(mf);

							// 기존의 회원 프로필 저장되어있는 WEB-INF/image 에 저장할 경우 뒤죽박죽 // 새로운 폴더만들어
							// WEB-INF/message/image // 파일 저장을 위한 변수 // C:~
							String realPath = request.getSession().getServletContext()
									.getRealPath("/WEB-INF/message/image");

							// substring 해주기위해 multipartFile.getOriginalFilename(); // String 형태가 아니면
							// substring 사용불가
							String StringMultiFile = mf.getOriginalFilename();

							// MultipartFile 이 비어있지않다면
							if (!StringMultiFile.equals("")) {

								// folderList.get(i) 로 ArrayList(파일의 경로 저장) 값을 하나씩 꺼내오는중
								String fileName1 = folderList.get(i);

								// 앞에 /JS/message/image/ 제거하고 뒤에 이미지명만 뽑아내는 작업
								String fileName = fileName1.substring(18);

								service.saveFile(fileimage, realPath, fileName);

								// 다중파일일 경우 다음 파일을 작업하기위한 ++ 작업
								i++;

							}
						}
						// 초기화 
						// 초기화 시켜주지않으면 전역변수여서 보낼때마다 값이 누적되어 // 메시지 보낸 후에 초기화
						// 전역변수는 서버가 종료되어야지 초기화된다
						PathsStoredInTheDatabase = "";
					}
					return "message/messageSendSuc";
				}
			} else {
				// 해당 회원정보가 없다면 보내지 못하도록
				model.addAttribute("MessageError", true);
				return "message/messageSend";
			}
		} catch (NullPointerException e) {
			// 메시지 보낼 대상이 Null 인 경우
			model.addAttribute("MessageError", true);
			return "message/messageSend";
		}
		return null;
	}

	// 메시지 작성할때 오류
	@ResponseBody // 보내려는 멤버 아이디가 DB에 저장되어있는지 확인
	@RequestMapping(value = "/memberChk/{member_id}", method = RequestMethod.POST)
	public String memberChk(@PathVariable("member_id") String member_id) {
		// selectById 하기위해 member_id 하나만 필요 // 해당하는 회원정보가 있는지 확인
		Member member1 = new Member();
		member1.setMember_id(member_id);
		Member member = loginservice.selectById(member1);
		// ajax 에 출력해줄 문구
		String check;
		if (member == null) {
			check = "해당 아이디 정보가 없습니다.";
		} else {
			check = "체크완료";
		}

		return "{\"msg\" : \"" + check + "\"}";
	}

	// 내가 보낸 메시지 보기
	@RequestMapping(value = "/message/sendMessageStore", method = RequestMethod.GET)
	public String sendMessageStore(Model model, @ModelAttribute("Member") Member member) {
		// 로그인한 유저의 보낸 메시지 불러오기
		List<Message> sendMessage = service.sendMessageStore(member);

		
		model.addAttribute("sendMessage", sendMessage);

		return "message/sendMessageStore";
	}

	// 받은 메시지 보기
	@RequestMapping(value = "/message/receiveMessageStore", method = RequestMethod.GET)
	public String receiveMessageStore(Model model, @ModelAttribute("Member") Member member) {
		Message receive = new Message();

		// 현재 로그인한 아이디가 받은 메시지 불러오기
		receive.setMember_receiver(member.getMember_id());
		List<Message> receiveMessage = service.receiveMessageStore(receive);
		model.addAttribute("receiveMessage", receiveMessage);

		return "message/receiveMessageStore";
	}

	// 받은 메시지 보관함 중 삭제하기 // member_receiver 과 message_id 를 이용해 delete 처리
	@RequestMapping(value = "/message/delete/receiveMessage/{message_id}", method = RequestMethod.GET)
	public String receiveMessage(@PathVariable("message_id") int message_id, @ModelAttribute("Member") Member member) {

		Message message = new Message();
		// 삭제하기 누른 메시지의 message_id (int auto_increment (자동증가))
		message.setMessage_id(message_id);

		// 로그인한 유저의 아이디
		message.setMember_receiver(member.getMember_id());

		service.deleteReceiveMessage(message);
		return "message/receiveMessageStore";
	}

	// 보낸 메시지 보관함 중 삭제하기 // member_id 와 message_id 로 delete 처리
	@RequestMapping(value = "/message/delete/sendMessage/{message_id}", method = RequestMethod.GET)
	public String sendMessage(@PathVariable("message_id") int message_id, @ModelAttribute("Member") Member member) {

		Message message = new Message();
		// 삭제하기 누른 메시지의 message_id (int auto_increment (자동증가))
		message.setMessage_id(message_id);

		// 로그인한 유저의 아이디
		message.setMember_id(member.getMember_id());

		service.deleteSendMessage(message);
		return "message/sendMessageStore";
	}
}

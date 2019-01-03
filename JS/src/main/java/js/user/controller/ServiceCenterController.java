package js.user.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import js.admin.service.QuestionService;
import js.user.model.Member;
import js.user.service.ServiceCenterService;
import js.admin.model.Question;
import js.admin.model.Notice;

@SessionAttributes("Member")
@Controller
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService service;
	
	@Autowired
	private QuestionService question_service;
	
	private String PictureAbsolutePath;
	private String PictureAbsolutePath_name;
	
	
	//회사 소개
	@RequestMapping("/company_info")
	public String company_info() {		
		return "user/page/servicecenter/company_info";
	}
	
	// 개인정보 정책
	@RequestMapping("/policy")
	public String Policy() {		
		return "user/page/servicecenter/policy";
	}

	
	//이용약관
	@RequestMapping("/tos")
	public String tos() {		
		return "user/page/servicecenter/tos";
	}
	
	//공지사항 및 건의사항
	@RequestMapping("/notice")
	public String notices(Model model, HttpServletRequest request, @ModelAttribute("Member") Member member) {		
		

		/* 공지 사항 */
		// 첫페이지 시작
		int page=1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 게시물 5개씩 보이기
		int count = 5;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", (page -1) * count);
		map.put("end", count);
		
		Notice notice = new Notice();
		
		model.addAttribute("count", service.count());
		model.addAttribute("notice", service.page(map));
		
		int recordCount = service.count();
		int totalPage = recordCount / count + (recordCount % count != 0 ? 1 : 0);
	    	if (page < 1 || page > totalPage) {
	    		return null;
	    	}
		int pageCount = 4;
		
		int startPage = (page -1) / pageCount * pageCount;
		if ( startPage % pageCount == 0)
			startPage +=1;
		
		int endPage = startPage + pageCount -1;
		if ( endPage > totalPage)
			endPage = totalPage; // 총페이지 수보다 끝나는 페이지가 더 크면 전체페이지수로 지정
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("page", page);
		
				
		
		/* 개인 문의  */
		
		// 첫페이지 시작
		int user_page=1;
		if (request.getParameter("question_page") != null) {
			user_page = Integer.parseInt(request.getParameter("question_page"));
		}
		// 게시물 5개씩 보이기
		int user_count = 5;
		
		
		System.out.println("문의 로그인맴버"+member.getMember_id());
		
		map.put("member_id", member.getMember_id());
		map.put("user_start", (user_page -1) * user_count);
		map.put("user_end", user_count);
						
		model.addAttribute("user_count", question_service.count());
		model.addAttribute("user_question", question_service.user_post(map));
		
		int user_recordCount = question_service.count();
		
		int user_totalPage = user_recordCount / user_count + (user_recordCount % user_count != 0 ? 1 : 0);
    	if (user_page < 1 || user_page > user_totalPage) {
    		return null;
    	}
		int user_pageCount = 4;
		
		int user_startPage = (user_page -1) / user_pageCount * user_pageCount;
		if ( user_startPage % user_pageCount == 0)
			user_startPage +=1;
		
		int user_endPage = user_startPage + user_pageCount -1;
		if ( user_endPage > user_totalPage)
			user_endPage = user_totalPage; // 총페이지 수보다 끝나는 페이지가 더 크면 전체페이지수로 지정
		
		model.addAttribute("user_totalPage", user_totalPage);
		model.addAttribute("user_startPage", user_startPage);
		model.addAttribute("user_endPage", user_endPage);
		model.addAttribute("user_page", user_page);
			
		
		
		
		
		return "user/page/servicecenter/notices";
	}
	
	
	//문의 작성 get
		@RequestMapping("/question_input")
		public String question_input() {
			return "user/page/servicecenter/question_input";
		}
	
	//문의 작성
	@RequestMapping(value="/question_input", method=RequestMethod.POST)
	public String question_input(Question question, Model model, @ModelAttribute("Member") Member member,
			HttpServletRequest request, HttpSession session,
			@RequestParam("title") String question_title,
			@RequestParam("content") String question_content) {		
		
		System.out.println("문의 로그인맴버"+member.getMember_id());
		Date date = new Date();
		SimpleDateFormat spdf = new SimpleDateFormat("yyyy/MM/dd/hh/mm/ss");
		String question_date = spdf.format(date);
		
		question.setMember_id(member.getMember_id());
		question.setQuestion_title(question_title);
		question.setQuestion_content(question_content);
		question.setQuestion_date(question_date);
		
		model.addAttribute("questionResult", question_service.insert(question));
		
		
		return  "redirect:/notice";
	}
	
	// 문의사항 정보
		@RequestMapping("/question_info/{questio_id}")
		public String question_input(Model model,
				@PathVariable int questio_id) {		
			
			Question question = new Question();
			question.setQuestion_id(questio_id);
			model.addAttribute("question_info", question_service.selectOne(question) );
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			return "user/page/servicecenter/question_info";
		}
	
	
	

	// 공지사항 정보
	@RequestMapping("/notices_info/{notice_id}")
	public String notices_info(Model model,
			@PathVariable int notice_id) {		
		
		Notice notice = new Notice();
		notice.setNotice_id(notice_id);
		model.addAttribute("notices_info", service.selectOne(notice) );
		
		return "user/page/servicecenter/notices_info";
	}
	
	
}

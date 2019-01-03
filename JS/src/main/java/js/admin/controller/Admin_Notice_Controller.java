package js.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import js.admin.model.FileImage;

import js.admin.service.NoticeService;
import js.user.model.Member;
import js.admin.model.Notice;

@SessionAttributes("Member")
@Controller
public class Admin_Notice_Controller {

	@Autowired
	private NoticeService service;
	
	private String PictureAbsolutePath;
	private String PictureAbsolutePath_name;

	public void setService(NoticeService service) {
		this.service = service;
	}
	
	@RequestMapping(value="/admin_notice" , method=RequestMethod.GET)
	public String admin_notice(Model model, HttpServletRequest request) {
		
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
	    		return "admin/page/admin_notice";
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
	
		return "admin/page/admin_notice";
	}
	
	// 게시글 삭제
	@RequestMapping(value="/admin_notice", method=RequestMethod.POST)
	public String admin_notice_delete(Notice notice, Model model, HttpServletRequest request,
					@RequestParam("d_notice_id") int notice_id) {
	
		System.out.println("아이디값은:?" +notice_id);
		notice.setNotice_id(notice_id);
		service.deleteOne(notice);
		
		return "redirect:/admin_notice";
	}
	
	@RequestMapping(value="/admin_noticesubmit", method=RequestMethod.GET)
	public String admin_noticesubmit(Notice notice, Model model) {
		return "admin/page/admin_noticesubmit";
	}
	
	
	//공지 작성
	@RequestMapping(value="/admin_noticesubmit", method=RequestMethod.POST)
	public String admin_noticesubmit(Notice notice, Model model, @ModelAttribute("Member") Member member,
			HttpServletRequest request, HttpSession session,
										@RequestParam("title") String notice_title,
										@RequestParam("content") String notice_content,
										@RequestParam("files") ArrayList<MultipartFile> multipartFile) {
	
		Random random = new Random();
		
		System.out.println("M:"+multipartFile);
		  for( MultipartFile mf : multipartFile ) {
		         FileImage fileimage = new FileImage();
		         fileimage.setFile(mf);
		         String fileName = mf.getOriginalFilename();
		         String realPath = request.getSession().getServletContext().getRealPath("/WEB-INF/notice/image");
		         System.out.println("realPath:" +realPath);
		       
		         
		         System.out.println("realPath: " + realPath);
		         System.out.println("fileName: " + fileName);
		         
		      // multipartFile.getOriginalFilename() 이 있을때 작동하도록 if문 (앞에 ! 붙어있음) // 이미지 첨부 하지않을 시 substring 에서 오류발생하므로
		 	if(!fileName.equals("")) {
		         // 데이터베이스에 파일 저장할때는 /WEB-INF/ 경로 빼고 저장 // ${} 표현식으로 바로 불러오게 하기위해서 
		         // 파일 데이터베이스에 저장하기위한 절대경로	// 절대경로 가져오기 // WEB-INF 접근위한 mvc:resource해준 /message/image/ // 파일 고유의 이름만 출력하기위한 substring (확장자만 제거) 		// 랜덤값 			// 뒤에 .jpg,.png ... (확장자) 만 선택하기 위한 코드 // substring과 indexOf 찾아보기
		     
		       PictureAbsolutePath_name = fileName.substring(0, mf.getOriginalFilename().indexOf("."))+"_"+random.nextLong()+fileName.substring(mf.getOriginalFilename().indexOf("."));
		      
		       PictureAbsolutePath = request.getContextPath()+"/notice/image/" + PictureAbsolutePath_name;

		       // 디비저장
		       notice.setNotice_img(PictureAbsolutePath);
		       
		       // 파일 저장
		       fileimage.fileImage(realPath, PictureAbsolutePath_name);
		       System.out.println("파일이름 : " + PictureAbsolutePath_name);
		       System.out.println("파일경로 + 이름 : " + PictureAbsolutePath);
		       
		 		}
		  }
		
		
		
		System.out.println("session 값 : " + session.getAttribute("Member"));
		
		// message 의 Message_send_date 해주기위한 코드
		Date date = new Date();
		SimpleDateFormat spdf = new SimpleDateFormat("yyyy/MM/dd/hh/mm/ss");
		String notice_date = spdf.format(date);
		
		System.out.println(member.getMember_id());
		
		notice.setNotice_title(notice_title);
		notice.setNotice_content(notice_content);
		//notice.setNotice_img(notice_img);
		notice.setMember_id(member.getMember_id());
		notice.setNotice_date(notice_date);
		
		model.addAttribute("registResult", service.insert(notice));
		
		return "redirect:/admin_notice";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}

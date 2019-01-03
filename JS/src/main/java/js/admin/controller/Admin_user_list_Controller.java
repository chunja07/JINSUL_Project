package js.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import js.admin.service.UserListService;
import js.admin.model.Member;

@Controller
public class Admin_user_list_Controller {
	/*
	 * //유저리스트 서비스
	 * 
	 * @Autowired private UserListService service;
	 * 
	 * public void setService(UserListService service) { this.service = service; }
	 * 
	 * @RequestMapping(value="/admin_user_list") public String admin_user_list(Model
	 * model) {
	 * 
	 * //Object memberlist = service.getUserList(); model.addAttribute("userList",
	 * service.getUserList());
	 * 
	 * return "admin/page/admin_user_list"; }
	 */
	// 유저리스트 서비스
	@Autowired
	private UserListService service;

	public void setService(UserListService service) {
		this.service = service;
	}

	@RequestMapping(value="/admin_user_list")
	public String admin_user_list(Model model, HttpServletRequest request) {
		// 첫페이지 시작
		int page=1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 게시물 5개씩 보이기
		int count = 5;
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", (page -1) * count);
		map.put("end", count);
		
		Member member = new Member();
		
		model.addAttribute("count", service.count());
		model.addAttribute("member", service.page(map));
		
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
		
		return "admin/page/admin_user_list";
	}

}

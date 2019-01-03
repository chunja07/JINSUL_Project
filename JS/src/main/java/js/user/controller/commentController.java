package js.user.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import js.user.model.Comment;
import js.user.service.commentService;

@Controller
public class commentController {

	@Autowired
	private commentService service;
	
	@RequestMapping(value="/abcde" , method=RequestMethod.GET)
	public String selectComment(Model model, @RequestParam("no") String abc) {
		System.out.println("com");
		int def = Integer.parseInt(abc);
		Comment comment3 = new Comment();
		List<Comment> comment = new ArrayList<>();
		List<Comment> comment2 = new ArrayList<>();
		List<Comment> commentIfNull = new ArrayList<>();
		comment = service.selectComment();
		comment3.setContent_id(def);
		System.out.println(comment3.getContent_id());
		
		commentIfNull = service.selectCommentIfNull(comment3);
		System.out.println("com"+commentIfNull);
		
		
		
		model.addAttribute("comment",comment);
		model.addAttribute("commentIfNull",commentIfNull);
		return "comment/comment";
	}
	
	
	
}

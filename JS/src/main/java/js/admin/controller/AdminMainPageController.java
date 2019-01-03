package js.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import js.admin.model.*;
import js.admin.service.*;
import js.user.model.Member;


@Controller
public class AdminMainPageController {

	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String admin_mainpage() {
		return "admin/page/adminmain";
	}
	

	@RequestMapping(value="/admin_warning_list", method=RequestMethod.GET)
	public String admin_warning_list() {
			return "admin/page/admin_warning_list";
	}
	

	@RequestMapping(value="/game", method=RequestMethod.GET)
	public String game() {
			return "game/index";
	}
	

}


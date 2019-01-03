package js.android.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import js.user.model.Member;
import js.user.service.loginService;
import js.user.service.registService;

@RestController
public class loginAndroidController {
	
	@Autowired
	private loginService loginService;
	
	@RequestMapping(value = "/android/login", method = RequestMethod.GET)
	public void restful_Android_login_get() {		
		
		String id = "test";	
	}
	
	@RequestMapping(value = "/android/login", method = RequestMethod.POST)
	public String restful_Android_login_post(String id, String password, HttpSession session) {		
		Gson gson = new Gson();
		
		Member member = new Member();		
				
		member = loginService.selectByUser(id);
		
		boolean check = member.getMember_password().equals(password);
		
		String json = gson.toJson(member);		
		
		try {
			json = URLEncoder.encode(json, "UTF-8");
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);
		if(check) {		
			return json;
			
		} else {
			
			return json;			
		}	
	}	
}

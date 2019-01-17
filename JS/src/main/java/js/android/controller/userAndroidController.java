package js.android.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import js.user.model.Introduction;
import js.user.model.Member;
import js.user.service.loginService;
import js.user.service.registService;

@RestController
public class userAndroidController {

	@Autowired
	private loginService loginService;

	@Autowired
	private registService registService;

	@RequestMapping(value = "/android/user", method = RequestMethod.GET)
	public void restful_Android_login_get(String id) {

	}

	@RequestMapping(value = "/android/user", method = RequestMethod.POST)
	public String restful_Android_login_post(String id, HttpSession session) {
		
		Gson gson = new Gson();

		Member member = new Member();
		
		member = loginService.selectByUser(id);
		System.out.println("멤버의 아이디 값은?" + member.getMember_id());
		int follower_num;
		int followed_num;

		follower_num = loginService.follower_Count(member);
		followed_num = loginService.followed_Count(member);

		Introduction intro = new Introduction();
		intro = registService.introSelect(member);
		
		String intro_value = intro.getIntroduction();

		HashMap<String, Object> value = new HashMap<>();
		value.put("follower_num", follower_num);
		value.put("followed_num", followed_num);
		value.put("intro", intro_value);

		String json = null;
		try {
			json = new ObjectMapper().writeValueAsString(value);
			json = URLEncoder.encode(json, "UTF-8");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(json);

		return json;
	}
}

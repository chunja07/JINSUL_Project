package js.android.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import js.user.model.Member;
import js.user.service.registService;

@RestController
public class registerAndroidController {		
	
	@Autowired
	private registService registservice;
	
	@RequestMapping(value = "/android/register", method = RequestMethod.GET)
	public void restful_Android_register_get() {		
		
		String id = "test";	
	}
	
	@RequestMapping(value = "/android/register", method = RequestMethod.POST)
	public void restful_Android_register_post(String id, String password, String name, String birthday,
			String gender, MultipartFile image, HttpServletRequest request) throws IllegalStateException, IOException {						
		Member member = new Member();
		member.setMember_id(id);
		member.setMember_password(password);
		member.setMember_name(name);
		member.setMember_birthday(birthday);
		member.setMember_gender(gender);;	
										
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));
		
		member.setMember_register_date(str);		
		
		String originalFileName = image.getOriginalFilename();
		System.out.println("OriginalFileName :" + originalFileName);		
		
		String saveFileName = member.getMember_id()+ "_" + originalFileName;
		String realpath = request.getSession().getServletContext().getRealPath("/image2");
		String imagePath = request.getContextPath() + "/image2/"+ member.getMember_id()+ "_" + originalFileName ;
		
		member.setMember_profile_pic(imagePath);
		
		File dir = new File(realpath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File imageFile = new File(dir, saveFileName);
		
		image.transferTo(imageFile);
		
		int check;
		check = registservice.insertAndroidMember(member);
						
		if(check==1){
			System.out.println("SQL에 쿼리가 성공적");
		} else {
			System.out.println("SQL에 쿼리가 실패적");
		}
		
	}

}

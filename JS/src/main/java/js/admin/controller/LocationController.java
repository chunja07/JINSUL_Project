package js.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

import javax.imageio.stream.FileCacheImageInputStream;
import javax.servlet.*;
import js.admin.service.*;
import js.admin.DAO.*;
import js.admin.model.*;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ch.qos.logback.core.net.SyslogOutputStream;



@Controller
public class LocationController {
		
		@Autowired
		private LocationService locationService;
	
	
		@RequestMapping(value = "/location", method = RequestMethod.GET)
	public String location(Model model) {
		
		model.addAttribute("lol", locationService.select());	
		
		return "location";
	}
	
	@RequestMapping(value = "/location", method = RequestMethod.POST)
	public String locationInsert(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// File
			
		BufferedReader bin = null;
		FileReader freader = null;
		
		HashMap<String, String> list = new HashMap<>();
		String path = "C:\\Users\\402-24\\git\\JINSUL\\JS\\src\\main\\resources\\spring\\지번_강원도.txt";
		
		bin = new BufferedReader(new InputStreamReader(new FileInputStream(path),"utf-8"));
		StringTokenizer st = null;
		StringTokenizer stbin = null;
		String b = null;
		
		File file = new File("");
		
		
		Scanner s = new Scanner(new File("C:\\Users\\402-24\\git\\JINSUL\\JS\\src\\main\\resources\\spring\\지번_강원도.txt"));
		
		while(s.hasNextLine()) {
			String line = s.nextLine();
			System.out.println(line);
			String [] str = new String[11];
			
			b = line;
			String [] tokens = b.split("\\|", -1);
						
			for(int i = 0; i <tokens.length; i++) {
				list.put("admin_no", tokens[0]);
				list.put("sequence_no", tokens[1]);
				list.put("towncode", tokens[2]);
				list.put("province", tokens[3]);
				list.put("district", tokens[4]);
				list.put("town", tokens[5]);
				list.put("subtown", tokens[6]);
				list.put("mountain", tokens[7]);
				list.put("street", tokens[8]);
				list.put("substreet", tokens[9]);
				list.put("representative", tokens[10]);				
				
				System.out.println(list);
			}
			model.addAttribute("street", locationService.street(list));
		}
			
			
		/*
		while((b=bin.readLine()) != null ) {
			System.out.println(b);
			st = new StringTokenizer(b, "|");
			stbin = new StringTokenizer(b, "||");
			String str[] = new String[11];
			
			for(int i = 0; st.hasMoreTokens(); i++) {
				
				
				str[i] = st.nextToken();
				
				list.add(i, str[i]);
				System.out.println(str[i]);
				System.out.println(list);
			}
			
			model.addAttribute("street", locationService.street(list));
			
			
			
		}
		
		HashMap<String, String> map = new HashMap<>();
		String path = "C:\\Users\\402-24\\git\\JINSUL\\JS\\src\\main\\webapp\\WEB-INF\\resources\\National_DB_final.csv";
		
		bin = new BufferedReader(new InputStreamReader(new FileInputStream(path),"euc-kr"));
		StringTokenizer st = null;
		String b = null;
		
		while((b = bin.readLine()) != null) {
			System.out.println(b);
			
			st = new StringTokenizer(b, ",");
			String str[] = new String [2];
			
			for(int i = 0; st.hasMoreTokens(); i++) {
				str[i] = st.nextToken();
			}
			
			map.put("province", str[0]);
			map.put("district", str[1]);
			
			System.out.println("str[0] =" + str[0]);
			System.out.println("str[1] =" + str[1]);
			
			model.addAttribute("location", locationService.location(map));
			
			
		}
		 */	
		bin.close();
		
		System.out.println("db 인서트 완료");
		
		return "locationResult";
	}
	
	
	
}

package js.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.admin.model.Member;
import js.admin.DAO.Admin_MemberDAO;


import java.sql.SQLException;
import java.util.*;


@Service
public class UserListService {
	
	@Autowired
	private Admin_MemberDAO dao;
	
	public void setDao(Admin_MemberDAO dao) {
		this.dao = dao;
	}
	
	public int count() {
		return this.dao.count();
	}
	
	public List<Member>  getUserList() {
		return this.dao.selectList();
	}
	
	public List<Member> page(HashMap<String, Integer> map){
		return this.dao.page(map);
	}

	
	
}

package js.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.admin.model.Notice;
import js.admin.DAO.Admin_NoticeDAO;


import java.sql.SQLException;
import java.util.*;


@Service
public class ServiceCenterService {
	
	@Autowired
	private Admin_NoticeDAO dao;
	
	public Notice selectOne(Notice notice) {
		return this.dao.selectOne(notice);
	}
	
	public void setDao(Admin_NoticeDAO dao) {
		this.dao = dao;
	}
	
	public int count() {
		return this.dao.count();
	}
	
	public List<Notice>  getUserList() {
		return this.dao.selectList();
	}
	
	public List<Notice> page(HashMap<String, Object> map){ 
		return this.dao.page(map);
	}
	
	public int insert(Notice notice) {
		return this.dao.insert(notice);
	}
	
	public int deleteOne( Notice notice_id) {
		return this.dao.deleteOne(notice_id);
	}
	
	
}

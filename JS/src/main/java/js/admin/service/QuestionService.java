package js.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.admin.model.Notice;
import js.admin.model.Question;
import js.admin.DAO.Admin_QuestionDAO;
import js.user.DAO.User_QuestionDAO;


import java.sql.SQLException;
import java.util.*;


@Service
public class QuestionService {
	
	@Autowired
	private Admin_QuestionDAO dao;
	
	@Autowired
	private User_QuestionDAO u_dao;
	
	public void setDao(Admin_QuestionDAO dao) {
		this.dao = dao;
	}
	
	public int count() {
		return this.dao.count();
	}
	
	public List<Question>  getUserList() {
		return this.dao.selectList();
	}
	//게시글 전체 
	public List<Question> page(HashMap<String, Object> map){ 
		return this.dao.page(map);
	}
	
	//해당유저의 게시글만
	public List<Question> user_post(HashMap<String, Object> map){ 
		return this.dao.user_post(map);
	}
	
	public int insert(Question question) {
		return this.dao.insert(question);
	}
	
	public int deleteOne( Question question_id) {
		return this.dao.deleteOne(question_id);
	}
	public Question selectOne(Question question_id) {
		return this.u_dao.selectOne(question_id);
	}
	
}

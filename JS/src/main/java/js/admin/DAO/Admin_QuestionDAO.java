package js.admin.DAO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.admin.model.Question;;



@Repository
public class Admin_QuestionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private String strNameSpace = "QuestionMapper";
	

	//공지리스트
	public List<Question> selectList(){
		return sqlSession.selectList(strNameSpace + ".userList");
	}
	
	//공지 카운트
	public int count() {
		return sqlSession.selectOne(strNameSpace + ".count");
	}
	//리스트
	public List <Question> page(HashMap<String, Object> map){
		
		return sqlSession.selectList(strNameSpace + ".page", map);
	}
	
	//해당유저 게시물 리스트
	public List <Question> user_post(HashMap<String, Object> map){
		
		return sqlSession.selectList(strNameSpace + ".user_post", map);
	}
	
	//공지 올리기
	public int insert(Question question) {
		return sqlSession.insert(strNameSpace + ".insert", question);
	}

	//공지삭제
	public int deleteOne(Question question_id) {
		return sqlSession.delete(strNameSpace + ".deleteOne", question_id);
	}
	
	//공지 게시글 보기
	public Question selectOne(Question question_id) {
		return sqlSession.selectOne(strNameSpace + ".oneRecord", question_id);
	}
	
	//문의 info
	

}

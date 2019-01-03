package js.user.DAO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.admin.model.Question;;



@Repository
public class User_QuestionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private String strNameSpace = "QuestionMapper";
	
	
	//문의 카운트
	public int count() {
		return sqlSession.selectOne(strNameSpace + ".count");
	}
	
	//문의 리스트
	public List <Question> page(HashMap<String, Integer> map){
		
		return sqlSession.selectList(strNameSpace + ".page", map);
	}
	
	//문의 올리기
	public int insert(Question question) {
		return sqlSession.insert(strNameSpace + ".insert", question);
	}

	//문의삭제
	public int deleteOne(Question question_id) {
		return sqlSession.delete(strNameSpace + ".deleteOne", question_id);
	}
	
	//문의 게시글 보기
	public Question selectOne(Question question_id) {
		return sqlSession.selectOne(strNameSpace + ".oneRecord", question_id);
	}

	

}

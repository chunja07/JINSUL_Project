package js.admin.DAO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.admin.model.*;



@Repository
public class Admin_NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	private String strNameSpace = "NoticeMapper";
	

	//공지리스트
	public List<Notice> selectList(){
		return sqlSession.selectList(strNameSpace + ".userList");
	}
	
	//공지 카운트
	public int count() {
		return sqlSession.selectOne(strNameSpace + ".count");
	}
	//리스트
	public List <Notice> page(HashMap<String, Object> map){
		
		return sqlSession.selectList(strNameSpace + ".page", map);
	}
	
	//공지 올리기
	public int insert(Notice notice) {
		return sqlSession.insert(strNameSpace + ".insert", notice);
	}

	//공지삭제
	public int deleteOne(Notice notice_id) {
		return sqlSession.delete(strNameSpace + ".deleteOne", notice_id);
	}
	
	//공지 게시글 보기
	public Notice selectOne(Notice notice_id) {
		return sqlSession.selectOne(strNameSpace + ".oneRecord", notice_id);
	}

}

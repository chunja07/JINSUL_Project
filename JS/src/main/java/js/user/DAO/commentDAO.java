package js.user.DAO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.user.model.Comment;

@Repository
public class commentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String str = "commentMapper";
	
	public List<Comment> selectComment() {
		return sqlSession.selectList(str+".selectComment");
	}
	
	
	
	public List<Comment> selectCommentIfNull(Comment comment){
		return sqlSession.selectList(str+".selectCommentIfNull",comment);
	}
	
	
	
	
}

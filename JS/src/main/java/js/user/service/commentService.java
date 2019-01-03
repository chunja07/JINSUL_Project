package js.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.DAO.commentDAO;
import js.user.model.Comment;
import java.util.*;

@Service
public class commentService {

	@Autowired
	private commentDAO commentDAO;
	
	public List<Comment> selectComment() {
		
		return this.commentDAO.selectComment();
	}
	
	public List<Comment> selectCommentIfNull(Comment comment){
		return this.commentDAO.selectCommentIfNull(comment);
	}
}

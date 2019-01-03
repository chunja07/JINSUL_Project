package js.user.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.user.model.Member;
import js.user.model.Message;



@Repository
public class messageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String str = "MessageMapper";
	
	// 메시지 작성 (보낸 메시지함에 저장)
	public int messageSend(Message message) {
		return sqlSession.insert(str+".sendMessage",message);
	}
	
	// 메시지 작성 (받은 메시지함에 저장)
	public int messageReceive(Message message) {
		return sqlSession.insert(str+".receiveMessage",message);
	}
	
	// 내가 보낸 메시지 확인
	public List<Message> sendMessageStore(Member member){
		return sqlSession.selectList(str+".sendMessageStore",member);
	}
	
	// 받은 메시지 확인
	public List<Message> receiveMessageStore(Message message){
		return sqlSession.selectList(str+".receiveMessageStore",message);
	}
	
	// 받은 메시지 삭제
	public int deleteReceiveMessage(Message message) {
		return sqlSession.delete(str+".deleteReceiveMessage",message);
	}
	
	// 보낸 메시지 삭제
	public int deleteSendMessage(Message message) {
		return sqlSession.delete(str+".deleteSendMessage",message);
	}
	
}

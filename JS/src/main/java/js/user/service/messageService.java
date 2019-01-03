package js.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.model.Member;
import js.user.DAO.*;
import js.user.model.FileImage;
import js.user.model.Message;

@Service
public class messageService {

	@Autowired
	private messageDAO messageDAO;

	// 메시지 작성 (보낸 메시지함에 저장)
	public int messageSend(Message message) {
		return this.messageDAO.messageSend(message);
	}
	
	// 메시지 작성 (받은 메시지함에 저장)
	public int messageReceive(Message message) {
		return this.messageDAO.messageReceive(message);
	}

	// 내가 보낸 메시지(보기)
	public List<Message> sendMessageStore(Member member) {
		return this.messageDAO.sendMessageStore(member);
	}
	
	// 파일 업로드
	public boolean saveFile(FileImage fileImage , String realPath,String fileName) {
		boolean flag = fileImage.fileImage(realPath,fileName);
		return flag;
	}
	
	// 받은 메시지 보기
	public List<Message> receiveMessageStore(Message message) {
		return this.messageDAO.receiveMessageStore(message);
	}
	
	// 받은 메시지 삭제
	public int deleteReceiveMessage(Message message) {
		return this.messageDAO.deleteReceiveMessage(message);
	}
	
	// 보낸 메시지 삭제
	public int deleteSendMessage(Message message) {
		return this.messageDAO.deleteSendMessage(message);
	}
}

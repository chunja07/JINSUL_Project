package js.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.model.*;
import js.user.DAO.*;

@Service
public class findService {

	@Autowired
	private findDAO findDAO;
	
	// 전화번호와 이메일로 아이디 찾기
	public Member findMyId(Member member) {
		return this.findDAO.findMyId(member);
	}
	
	// 아이디와 메일로 해당하는 정보가 있는지 확인하는 코드
	public Member findMyPw(Member member) {
		return this.findDAO.findMyPw(member);
	}
	
	// 패스워드 찾기해서 인증 후 새로운 비밀번호 설정
	public int newPassword(memberUpdate memberUpdate) {
		return this.findDAO.newPassword(memberUpdate);
	}
	
}

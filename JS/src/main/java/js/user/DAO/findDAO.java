package js.user.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.user.model.*;

@Repository
public class findDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String str ="MemberMapper";
	
	// 전화번호와 이메일로 아이디 찾기
	public Member findMyId(Member member) {
		return sqlSession.selectOne(str+".findMyId",member);
	}
	
	// 아이디와 메일로 해당하는 정보가 있는지 확인하는 코드
	public Member findMyPw(Member member) {
		return sqlSession.selectOne(str+".findMyPw",member);
	}
	
	// 패스워드 찾기해서 인증 후 새로운 비밀번호 설정
	public int newPassword(memberUpdate memberUpdate) {
		return sqlSession.update(str+".newPassword",memberUpdate);
	}
	
}

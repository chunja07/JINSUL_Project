package js.user.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import js.user.model.*;
import js.user.model.memberUpdate;
import java.util.*;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String str = "MemberMapper";

	// 멤버 선택
	public Member selectById(Member member) {

		return sqlSession.selectOne(str + ".selectById", member);
	}

	// 멤버 insert
	public int insertM(Member member) {
		return sqlSession.insert(str + ".insertM", member);

	}

	// 멤버 insert
	public int insertMemberInt(Member member) {
		return sqlSession.insert(str + ".insertMemberInt", member);

	}
	
	// 멤버 insertAndroidMember
		public int insertAndroidMember(Member member) {
			return sqlSession.insert(str + ".insertAndroidMember", member);

		}

	// 회원정보 수정을 위한 비밀번호 확인
	public Member selectByPw(memberUpdate memberupdate) {

		return sqlSession.selectOne(str + ".selectByPw", memberupdate);
	}

	// 회원정보 삭제
	public int deleteMember(Member member) {

		return sqlSession.delete(str + ".deleteMember", member);
	}

	// 로그인 강화페이지에서 로그인 ( 입력한 정보(아이디,비밀번호,이메일)가 일치하는지 )
	public Member loginUp(Member member) {
		return sqlSession.selectOne(str + ".loginUp", member);
	}

	// 비밀번호 수정 쿼리
	public int updatePassword(memberUpdate memberupdate) {
		return sqlSession.update(str + ".updatePassword", memberupdate);
	}

	// 연락처 수정
	public int updatePhoneNum(Member member) {
		return sqlSession.update(str + ".updatePhoneNum", member);
	}

	// 이메일 수정
	public int updateEmail(Member member) {
		return sqlSession.update(str + ".updateEmail", member);
	}

	// 주소 수정
	public int updateAddress(Member member) {
		return sqlSession.update(str + ".updateAddress", member);
	}

	// 프로필 수정
	public int updateProfile(Member member) {
		return sqlSession.update(str + ".updateProfile", member);
	}

	// 팔로워 상태
	public Follow followState(Member member) {

		return sqlSession.selectOne(str + ".followState", member);

	}

	// 언팔로우 하는 메소드
	public int followDelete(HashMap<String, String> hashMap) {

		return sqlSession.delete(str + ".followDelete", hashMap);

	}

	// 팔로우 한 것을 선택하는 것
	public Follow followSelect() {

		return sqlSession.selectOne(str + ".followSelect");

	}

	// 팔로우 클래스를 로그인 아이디와 유저 아이디로 구분해서 받아오는 메소드
	public int follow(HashMap<String, String> hashMap) {

		return sqlSession.insert(str + ".follow", hashMap);
	}

	// 유저 아이디를 통해서 멤버 객체를 받아오는 메서드
	public Member selectByUser(String id) {

		return sqlSession.selectOne(str + ".selectByUser", id);
	}

	// 리스트 형태로 멤버 아이디를 통해서 객체를 받아오는 메서드
	public List<Member> searchById(String search) {
		return sqlSession.selectList(str + ".searchById", search);

	}

	// 리스트 형태로 아이디 사진 경로를 리스트 형태로 받아옴
	public List<Member> searchByIdPic(String search) {
		return sqlSession.selectList(str + ".searchByIdPic", search);

	}

	// 팔로우 셀렉트 로그인 멤버 가져오기
	public List<Follow> followLoginSelect(Member member) {
		return sqlSession.selectList(str + ".followLoginSelect", member);
	}
	
	// 팔로우 셀렉트 로그인 멤버 가져오기
		public List<Object> followedLoginSelect(Member member) {
			return sqlSession.selectList(str + ".followedLoginSelect", member);
		}

	// 팔로우 셀렉트 로그인 멤버 가져오기
	public List<Follow> followedSelect(Member member) {
		return sqlSession.selectList(str + ".followedSelect", member);
	}

	// 로그인 한 사람이 팔로우 하는 사람의 숫자(팔로우)
	public int follower_Count(Member member) {
		return sqlSession.selectOne(str + ".follower_Count", member);
	}

	// 로그인 한 사람을 팔로우 하는 사람의 숫자(팔로워, 나를 따르는 사람의 숫자)
	public int followed_Count(Member member) {
		return sqlSession.selectOne(str + ".followed_Count", member);
	}

	// FollowMemberPic으로 불러오는 리스트
	public List<FollowMemberPic> followMemberPic(Member member) {
		return sqlSession.selectList(str + ".followMemberPic", member);
	}

	public Introduction introSelect(Member member) {
		return sqlSession.selectOne(str + ".introSelect", member);
	}

	// 자기 소개글 인서트 하는 서비스
	public int introUpdate(Introduction member) {
		return sqlSession.update(str + ".introUpdate", member);
	}

	// 팔로워 하는 사람들의 정보 가져오기
	public List<FollowPic> followerIdPic(Member member) {
		return sqlSession.selectList(str + ".followerIdPic", member);
	}

	// 팔로잉 하는 사람들의 정보 가져오기
	public List<FollowPic> followedIdPic(Member member) {
		return sqlSession.selectList(str + ".followedIdPic", member);
	}

	// 검색 시 멤버 클래스의 정보와 소개를 합한 테이블의 클래스인 memberIntroAll 클래스를 셀렉트 하는 메서드
	public List<Object> memberIntroAll(String member) {
		return sqlSession.selectList(str + ".memberIntroAll", member);
	}

	// 로그인으로 검색시 팔로우 하는지 여부를 체크하기 위해서 로그인 멤버로 팔로우 객체를 가져오는 메서드
	public List<Follow> followStringSearch(String member) {
		return sqlSession.selectList(str + ".followStringSearch", member);
	}

	// 로그인으로 검색시 팔로우 하는지 여부를 체크하기 위해서 로그인 멤버로 팔로우 객체를 가져오는 메서드
	public boolean followBooleanSearch(String member) {
		return sqlSession.selectOne(str + ".followBooleanSearch", member);
	}

}

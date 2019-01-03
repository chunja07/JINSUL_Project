package js.user.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.DAO.MemberDAO;
import js.user.model.Follow;
import js.user.model.FollowMemberPic;
import js.user.model.FollowPic;
import js.user.model.Member;
import js.user.model.MemberIntroAll;

@Service
public class loginService {

	@Autowired
	private MemberDAO memberDAO;

	// 멤버의 클래스를 파라미터로 받아 멤버 정보 받아옴
	public Member selectById(Member member) {

		return this.memberDAO.selectById(member);
	}

	// 멤버의 아이디를 스트링 파라미터로 받아 멤버 정보 받아옴
	public Member selectByUser(String id) {

		return this.memberDAO.selectByUser(id);
	}

	// 검색어를 스트링 파라미터로 받아와 멤버 클래스들을 리스트 형태로 받아옴
	public List<Member> searchById(String search) {

		return this.memberDAO.searchById(search);

	}

	// 검색어를 파라미터로 받아와 리스트 형태로 멤버 클래스들의 사진 경로만 받아옴
	public List<Member> searchByIdPic(String search) {

		return this.memberDAO.searchById(search);

	}

	// 멤버 클래스를 파라미터로 받아 팔로우 클래스의 정보를 받아옴
	public Follow followState(Member member) {
		System.out.println("loginService에서의 멤버: " + member.getMember_id());
		return this.memberDAO.followState(member);

	}

	// 팔로우 클래스를 로그인 아이디의 값으로 모두 받아오는 배열
	public List<Follow> followLoginSelect(Member member) {
		System.out.println("loginService에서의 멤버: " + member.getMember_id());
		return this.memberDAO.followLoginSelect(member);

	}
	
	// Json으로 팔로우 클래스를 로그인 아이디의 값으로 모두 받아오는 배열
	public List<Object> followedLoginSelect(Member member) {
		
		return this.memberDAO.followedLoginSelect(member);

	}
	

	// 팔로우드 컬럼을 유저 프로필 아이디로 받아오는 메서드
	public List<Follow> followedSelect(Member member) {
		System.out.println("loginService에서의 멤버: " + member.getMember_id());
		return this.memberDAO.followedSelect(member);
	}

	// 로그인 한 사람이 팔로우 하는 사람이 몇 명인지 보는 Service(팔로잉)
	public int follower_Count(Member member) {
		return this.memberDAO.follower_Count(member);
	}

	// 로그인 한 사람을 팔로우 하는 사람이 몇 명인지 보는 Service(팔로워)
	public int followed_Count(Member member) {
		return this.memberDAO.followed_Count(member);
	}

	// FollowMemberPic에서 리스트 형태로 followMeberPic 경로를 가져 오기 위한
	public List<FollowMemberPic> followMemberPic(Member member) {
		return this.memberDAO.followMemberPic(member);
	}

	// 팔로워 아이디와 그림을 가져오는 서비스 메서드
	public List<FollowPic> followerIdPic(Member member) {
		return this.memberDAO.followerIdPic(member);
	}

	// 팔로잉 아이디와 그림을 가져오는 서비스 메서드
	public List<FollowPic> followedIdPic(Member member) {
		return this.memberDAO.followedIdPic(member);
	}

	// 검색 시 멤버 클래스의 정보와 소개를 합한 테이블의 클래스인 memberIntroAll 클래스를 셀렉트 하는 메서드
	public List<Object> memberIntroAll(String member) {
		return this.memberDAO.memberIntroAll(member);
	}

	// 로그인으로 검색시 팔로우 하는지 여부를 체크하기 위해서 로그인 멤버로 팔로우 객체를 가져오는 메서드
	public List<Follow> followStringSearch(String member) {
		return this.memberDAO.followStringSearch(member);
	}
	
	public Member loginUp(Member member) {
		return this.memberDAO.loginUp(member);
	}

}

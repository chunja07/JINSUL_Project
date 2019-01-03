package js.user.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.DAO.MemberDAO;
import js.user.model.FileImage;
import js.user.model.Follow;
import js.user.model.Introduction;
import js.user.model.Member;

@Service
public class registService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public Member selectById(Member member) {
		return this.memberDAO.selectById(member);
	}
	
	// 두개 이상의 작업이 수행될때에 트랜잭션 처리( ex)) 내가 글을 보면 조회수와 함께 해당 페이지가 열려야 하는데 이 경우 조회수는 오르는데 페이지를 열람 못하는경우에도 트랜잭션 처리가 되어야한다 (조회수는 오르는데,내가 페이지 열람이 안되어 못봤다)
	public int insertM(Member member) {		
		
		return this.memberDAO.insertM(member);
			
	}
	// // 멤버 insertAndroidMember
		public int insertAndroidMember(Member member) {		
			
			return this.memberDAO.insertAndroidMember(member);
				
		}
		
		// // 멤버 insertMemberInt
		public int insertMemberInt(Member member) {		
			
			return this.memberDAO.insertMemberInt(member);
				
		}
	
	// 파일 업로드
	public boolean saveFile(FileImage file,String realPath,String fileName) {
		boolean flag = file.fileImage(realPath,fileName);
		return flag;
		
	}
	// 팔로우 취소 하는 메서드
	public int followDelete (HashMap<String, String> hashMap) {
		return this.memberDAO.followDelete(hashMap);
	}
	// 팔로우 하는 메서드
	public int follow (HashMap<String, String> hashMap) {
		return this.memberDAO.follow(hashMap);
	}
	// 팔로우 멤버를 통해 셀렉트	
	public Follow followSelect(Member member) {
		return this.memberDAO.followSelect();
	}
	// 자기 소개 이전꺼 가져오는 셀렉트
	public Introduction introSelect(Member member) {
		return this.memberDAO.introSelect(member);
	}
	// 자기소개를 수정하는 메서드
	public int introUpdate(Introduction member) {
		return this.memberDAO.introUpdate(member);
	}
}

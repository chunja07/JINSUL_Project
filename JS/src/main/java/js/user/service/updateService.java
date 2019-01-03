package js.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import js.user.DAO.MemberDAO;
import js.user.model.FileImage;
import js.user.model.Member;
import js.user.model.memberUpdate;

@Service
public class updateService {

	@Autowired
	private MemberDAO memberDao;
	
	// 해당 아이디가 DB에 있는지 
	public Member selectById(Member member) {
		
		return this.memberDao.selectById(member);
	}
	
	// 비밀번호 바꾸기 (정보수정)
	public int updatePassword(memberUpdate memberupdate) {
		return this.memberDao.updatePassword(memberupdate);
	}
	
	// 비밀번호 바꾸기 (비밀번호 변경시 현재 아이디의 비밀번호 선택해 updateForm 에서 입력한 현재 비밀번호와 같은지 확인)
	public Member selectByPw(memberUpdate memberupdate) {
		return this.memberDao.selectByPw(memberupdate);
	}
	
	// 회원 삭제
	public int deleteMember(Member member) {
		
		return this.memberDao.deleteMember(member);
	}
	
	// 연락처 수정
		public int updatePhoneNum(Member member) {
			return this.memberDao.updatePhoneNum(member);
		}
		
		// 이메일 수정
		public int updateEmail(Member member) {
			return this.memberDao.updateEmail(member);
		}
		
		// 주소 수정
		public int updateAddress(Member member) {
			return this.memberDao.updateAddress(member);
		}
		
		
		// 프로필 수정
		public int updateProfile(Member member) {
			return this.memberDao.updateProfile(member);
		}
	
	// 파일 업로드
		public boolean saveFile(FileImage file,String realPath,String fileName) {
			boolean flag = file.fileImage(realPath,fileName);
			return flag;
			
		}

}
